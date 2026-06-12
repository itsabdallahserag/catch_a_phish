class ScanHistoryModel {
  String? id;
  String? uid;
  String? url;
  String? result;
  DateTime? createdAt;
  static const String collectionName = 'history';

  ScanHistoryModel({
    this.id,
    this.uid,
    this.url,
    this.result,
    this.createdAt,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'url': url,
      'result': result,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  ScanHistoryModel.fromFirestore(Map<String, dynamic> json)
      : this(
          id: json['id'],
          uid: json['uid'],
          url: json['url'],
          result: json['result'],
          createdAt: json['createdAt'] != null
              ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'])
              : null,
        );
}