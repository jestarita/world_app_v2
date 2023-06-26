import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Country {
 String? image;
  String? name;
  String? region;
  Country({ required this.image, required this.name, required this.region});


   Country.fromJson(Map<String, dynamic> json) {
    image = json['flags']['png'];
    name = json["name"]["common"];
    region = json["region"];
  }


    Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['flags']['png'] = image;
    json["name"]["common"] = name;
    json["region"] = region;
    return json;
  }

}
