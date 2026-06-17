import 'package:catch_a_phish/Firbase_utils/models/scan_history_model.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseUtils {
  // Sign Up
  static Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Login
  static Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> sendEmailVerification() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  static bool isEmailVerified() {
    return FirebaseAuth.instance.currentUser?.emailVerified ?? false;
  }

  // Google Sign In
  static Future<UserCredential?> loginByGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // GitHub Sign In
  static Future<UserCredential> loginByGitHub() async {
    final githubProvider = GithubAuthProvider();

    return await FirebaseAuth.instance.signInWithProvider(githubProvider);
  }

  //                        FireStore
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) =>
              UserModel.fromFirestore(snapshot.data()!),
          toFirestore: (user, _) => user.toFirestore(),
        );
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> collectionReference = getUserCollection();
    var docRef = collectionReference.doc(user.uid);
    return docRef.set(user);
  }

  static Future<UserModel?> readUser() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var doc = await getUserCollection().doc(uid).get();
    return doc.data();
  }

  static Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  static CollectionReference<ScanHistoryModel> getScanCollection(String uid) {
    return getUserCollection()
        .doc(uid)
        .collection(ScanHistoryModel.collectionName)
        .withConverter<ScanHistoryModel>(
          fromFirestore: (snapshot, _) =>
              ScanHistoryModel.fromFirestore(snapshot.data()!),
          toFirestore: (scan, _) => scan.toFirestore(),
        );
  }

  static Future<void> addScan(ScanHistoryModel scan) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await getScanCollection(uid).add(scan);

    await getUserCollection().doc(uid).update({
      'totalScans': FieldValue.increment(1),
    });

    if (scan.result?.toLowerCase() == 'phishing') {
      await getUserCollection().doc(uid).update({
        'threatsBlocked': FieldValue.increment(1),
      });
    }
  }

  static Future<List<ScanHistoryModel>> getUserScansOnce() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    var snapshot = await getScanCollection(
      uid,
    ).orderBy("createdAt", descending: true).get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> cleanScansOnce() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var collection = getScanCollection(uid);
    var snapshot = await collection.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    await getUserCollection().doc(uid).update({
      'totalScans': 0,
      'threatsBlocked': 0,
    });
  }

  static Future<void> updateSetting({
    required bool value,
    required String updated,
  }) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await getUserCollection().doc(uid).update({updated: value});
  }

  static Future<void> updateStringSetting({
    required String updated,
    required String value,
  }) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await getUserCollection().doc(uid).update({updated: value});
  }
}
