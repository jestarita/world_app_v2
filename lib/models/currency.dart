
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Currency{
 String? name;
 String? symbol;

  Currency({ required this.name, required this.symbol});

  Currency.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json["symbol"];
  }


  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['name'] = name;
    json["symbol"] = symbol;
    return json;
  }

}
