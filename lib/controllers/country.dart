import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:world_app_v2/models/country.dart';

class CountryController extends GetxController {

  Future<List<Country>> getCountries(String region) async {
    String url = region != '' ? "region/$region" : "all";

    final response =
        await http.get(Uri.parse("https://restcountries.com/v3.1/$url"));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      List<Country> countries = result.map((e) => Country.fromJson(e)).toList();

      return countries;
    } else {
      return [];
    }
  }


//end controller
}
