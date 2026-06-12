class UserModel {
  UserModel({
    this.uid ,
    this.name,
    this.email,
    this.totalScans = 0,
    this.threatsBlocked = 0,
  });

  UserModel.fromFirestore(Map<String, dynamic> json)
      : this(
          uid: json['uid'],
          name: json['name'],
          email: json['email'],
          totalScans: json['totalScans'] ?? 0,
          threatsBlocked: json['threatsBlocked'] ?? 0,
        );

  String? uid;
  String? name;
  String? email;
  int totalScans;
  int threatsBlocked;
  static const String collectionName = 'Users' ;

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'totalScans': totalScans,
      'threatsBlocked': threatsBlocked,
    };
  }
  UserModel copyWith({
  String? uid,
  String? name,
  String? email,
  int? totalScans,
  int? threatsBlocked,
}) {
  return UserModel(
    uid: uid ?? this.uid,
    name: name ?? this.name,
    email: email ?? this.email,
    totalScans: totalScans ?? this.totalScans,
    threatsBlocked: threatsBlocked ?? this.threatsBlocked,
  );
}
}