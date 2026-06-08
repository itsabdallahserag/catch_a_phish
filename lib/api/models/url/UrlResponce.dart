import 'dart:convert';

/// url : "https://paypal-secure.evil.com/login"
/// prediction : "phishing"
/// phishing_probability : 100.0
/// legitimate_probability : 0.0
/// confidence_score : 99.99
/// risk_level : "critical"
/// explanations : ["Brand name 'paypal' appears in a subdomain of 'evil.com', which is not the real brand. This is a deceptive subdomain stuffing pattern."]
/// triggered_rules : ["brand_in_subdomain"]
/// ml_probability : 100.0
/// screenshot_scan_id : "019e9aec-00eb-7449-8cec-18cdd545072b"
/// screenshot_cached : true

UrlResponce urlResponceFromJson(String str) => UrlResponce.fromJson(json.decode(str));
String urlResponceToJson(UrlResponce data) => json.encode(data.toJson());
class UrlResponce {
  UrlResponce({
      this.url, 
      this.prediction, 
      this.phishingProbability, 
      this.legitimateProbability, 
      this.confidenceScore, 
      this.riskLevel, 
      this.explanations, 
      this.triggeredRules, 
      this.mlProbability, 
      this.screenshotScanId, 
      this.screenshotCached,
      this.detail});

  UrlResponce.fromJson(dynamic json) {
    url = json['url'];
    prediction = json['prediction'];
    phishingProbability = json['phishing_probability'];
    legitimateProbability = json['legitimate_probability'];
    confidenceScore = json['confidence_score'];
    riskLevel = json['risk_level'];
    explanations = json['explanations'] != null ? json['explanations'].cast<String>() : [];
    triggeredRules = json['triggered_rules'] != null ? json['triggered_rules'].cast<String>() : [];
    mlProbability = json['ml_probability'];
    screenshotScanId = json['screenshot_scan_id'];
    screenshotCached = json['screenshot_cached'];
    detail = json['detail'];
  }
  String? url;
  String? prediction;
  num? phishingProbability;
  num? legitimateProbability;
  num? confidenceScore;
  String? riskLevel;
  List<String>? explanations;
  List<String>? triggeredRules;
  num? mlProbability;
  String? screenshotScanId;
  bool? screenshotCached;
  String? detail ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['prediction'] = prediction;
    map['phishing_probability'] = phishingProbability;
    map['legitimate_probability'] = legitimateProbability;
    map['confidence_score'] = confidenceScore;
    map['risk_level'] = riskLevel;
    map['explanations'] = explanations;
    map['triggered_rules'] = triggeredRules;
    map['ml_probability'] = mlProbability;
    map['screenshot_scan_id'] = screenshotScanId;
    map['screenshot_cached'] = screenshotCached;
    return map;
  }

}