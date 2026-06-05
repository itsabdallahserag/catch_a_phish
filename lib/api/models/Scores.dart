import 'dart:convert';

/// legit : 38.94
/// spam : 52.95
/// phishing : 8.12

Scores scoresFromJson(String str) => Scores.fromJson(json.decode(str));
String scoresToJson(Scores data) => json.encode(data.toJson());
class Scores {
  Scores({
      this.legit, 
      this.spam, 
      this.phishing,});

  Scores.fromJson(dynamic json) {
    legit = json['legit'];
    spam = json['spam'];
    phishing = json['phishing'];
  }
  num? legit;
  num? spam;
  num? phishing;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['legit'] = legit;
    map['spam'] = spam;
    map['phishing'] = phishing;
    return map;
  }

}