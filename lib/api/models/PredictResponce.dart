import 'Scores.dart';
import 'dart:convert';

/// label : "SPAM"
/// confidence : 52.95
/// scores : {"legit":38.94,"spam":52.95,"phishing":8.12}

PredictResponce predictResponceFromJson(String str) => PredictResponce.fromJson(json.decode(str));
String predictResponceToJson(PredictResponce data) => json.encode(data.toJson());
class PredictResponce {
  PredictResponce({
      this.label, 
      this.confidence, 
      this.scores,
    this.detail
  });

  PredictResponce.fromJson(dynamic json) {
    detail = json['detail'];
    label = json['label'];
    confidence = json['confidence'];
    scores = json['scores'] != null ? Scores.fromJson(json['scores']) : null;
  }
  String? label;
  num? confidence;
  Scores? scores;
  String? detail ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['confidence'] = confidence;
    if (scores != null) {
      map['scores'] = scores?.toJson();
    }
    return map;
  }

}