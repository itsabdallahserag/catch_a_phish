class UserModel {
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.photoUrl,
    this.realTimeProtection = true,
    this.deepInspection = false,
    this.smsFiltering = true,
    this.notifications = true,
    this.darkMode = true,
    this.language = 'en',
    this.totalScans = 0,
    this.threatsBlocked = 0,
  });

  UserModel.fromFirestore(Map<String, dynamic> json)
      : this(
          uid: json['uid'],
          name: json['name'],
          email: json['email'],
          photoUrl: json['photoUrl'],
          realTimeProtection: json['realTimeProtection'] ?? true,
          deepInspection: json['deepInspection'] ?? false,
          smsFiltering: json['smsFiltering'] ?? true,
          notifications: json['notifications'] ?? true,
          darkMode: json['darkMode'] ?? true,
          totalScans: json['totalScans'] ?? 0,
          threatsBlocked: json['threatsBlocked'] ?? 0,
          language: json['language'] ?? 'en',
        );

  String? uid;
  String? name;
  String? email;
  String? photoUrl;

  int totalScans;
  int threatsBlocked;

  bool realTimeProtection;
  bool deepInspection;
  bool smsFiltering;
  bool notifications;
  bool darkMode;

  String language;

  static const String collectionName = 'Users';

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'totalScans': totalScans,
      'threatsBlocked': threatsBlocked,
      'realTimeProtection': realTimeProtection,
      'deepInspection': deepInspection,
      'smsFiltering': smsFiltering,
      'notifications': notifications,
      'darkMode': darkMode,
      'language': language,
    };
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
    int? totalScans,
    int? threatsBlocked,
    bool? realTimeProtection,
    bool? deepInspection,
    bool? smsFiltering,
    bool? notifications,
    bool? darkMode,
    String? language,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      totalScans: totalScans ?? this.totalScans,
      threatsBlocked: threatsBlocked ?? this.threatsBlocked,
      realTimeProtection: realTimeProtection ?? this.realTimeProtection,
      deepInspection: deepInspection ?? this.deepInspection,
      smsFiltering: smsFiltering ?? this.smsFiltering,
      notifications: notifications ?? this.notifications,
      darkMode: darkMode ?? this.darkMode,
      language: language ?? this.language,
    );
  }
}