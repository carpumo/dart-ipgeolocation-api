import 'dart:convert';
import 'package:meta/meta.dart';

GeolocationData geolocationDataFromJson(String str) =>
    GeolocationData.fromJson(json.decode(str));

String geolocationDataToJson(GeolocationData data) =>
    json.encode(data.toJson());

class GeolocationData {
  GeolocationData({
    this.status,
    @required this.country,
    @required this.countryCode,
    this.region,
    this.regionName,
    this.city,
    this.zip,
    @required this.lat,
    @required this.lon,
    @required this.timezone,
    this.isp,
    this.org,
    this.geolocationDataAs,
    @required this.ip,
  });

  String status;
  String country;
  String countryCode;
  String region;
  String regionName;
  String city;
  String zip;
  double lat;
  double lon;
  String timezone;
  String isp;
  String org;
  String geolocationDataAs;
  String ip;

  factory GeolocationData.fromJson(Map<String, dynamic> json) =>
      GeolocationData(
        status: json["status"],
        country: json["country"],
        countryCode: json["countryCode"],
        region: json["region"],
        regionName: json["regionName"],
        city: json["city"],
        zip: json["zip"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        isp: json["isp"],
        org: json["org"],
        geolocationDataAs: json["as"],
        ip: json["query"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "country": country,
        "countryCode": countryCode,
        "region": region,
        "regionName": regionName,
        "city": city,
        "zip": zip,
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "isp": isp,
        "org": org,
        "as": geolocationDataAs,
        "ip": ip,
      };
}
