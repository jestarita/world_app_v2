import 'package:json_annotation/json_annotation.dart';
import 'package:world_app_v2/models/currency.dart';

@JsonSerializable()
class Country {
  String? image;
  String? name;
  String? region;
  String? officialName;
  String? subRegion;
  int? population;
  Currency? currency;
  Country(
      {required this.image,
      required this.name,
      required this.region,
      required this.officialName,
      required this.subRegion,
      required this.population,
      required this.currency});

  Country.fromJson(Map<String, dynamic> json) {
    image = json['flags']['png'];
    name = json["name"]["common"];
    region = json["region"];
    officialName = json["name"]["official"];
    subRegion = json["subregion"];
    population = json["population"];

    var currenciesGet = json['currencies'];

    if (currenciesGet != null) {
      var key = currenciesGet.keys.toList().first;
      currency = Currency(
          name: currenciesGet[key]['name'],
          symbol: currenciesGet[key]['symbol']);
    } else {
      currency = null;
    }
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['flags']['png'] = image;
    json["name"]["common"] = name;
    json["region"] = region;
    json["name"]["official"] = officialName;
    json["subregion"] = subRegion;
    json["population"] = population;
    json['currencies'] = currency;
    return json;
  }
}
