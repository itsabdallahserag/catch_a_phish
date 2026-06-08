import 'dart:convert';

ScreenShootResponce screenShootResponseFromJson(String str) =>
    ScreenShootResponce.fromJson(json.decode(str));

String screenShootResponseToJson(ScreenShootResponce data) =>
    json.encode(data.toJson());

class ScreenShootResponce {
  ScreenShootResponce({
    this.scanId,
    this.status,
    this.screenshotUrl,
    this.urlscanVerdictMalicious,
    this.urlscanScore,
    this.detectedBrands,
    this.reportUrl,
    this.error,
  });

  ScreenShootResponce.fromJson(dynamic json) {
    scanId                  = json['scan_id'];
    status                  = json['status'];
    screenshotUrl           = json['screenshot_url'];
    urlscanVerdictMalicious = json['urlscan_verdict_malicious'];
    urlscanScore            = json['urlscan_score'];
    reportUrl               = json['report_url'];
    error                   = json['error'];

    if (json['detected_brands'] != null) {
      detectedBrands = [];
      json['detected_brands'].forEach((v) {
        detectedBrands?.add(v.toString()); // ✅ String مش Object
      });
    }
  }

  String? scanId;
  String? status;
  String? screenshotUrl;
  bool?   urlscanVerdictMalicious;
  num?    urlscanScore;
  List<String>? detectedBrands; 
  String? reportUrl;
  dynamic error;

  Map<String, dynamic> toJson() {
    return {
      'scan_id'                   : scanId,
      'status'                    : status,
      'screenshot_url'            : screenshotUrl,
      'urlscan_verdict_malicious' : urlscanVerdictMalicious,
      'urlscan_score'             : urlscanScore,
      'detected_brands'           : detectedBrands, 
      'report_url'                : reportUrl,
      'error'                     : error,
    };
  }
}