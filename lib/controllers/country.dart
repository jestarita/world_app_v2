import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:world_app_v2/models/country.dart';

class CountryController extends GetxController {

  // final String region;
  final BuildContext context;

  RxList<Country> _countries = <Country>[].obs;

  List<Country> get countries => _countries.value;

  bool get loading => _loading.value;

  RxBool _loading = false.obs;

  RxString _title = ''.obs;

  String get title => _title.value;

  setTitle(String title){
    _title.value = title;
  }

  CountryController(this.context);

  @override
  void onReady() async {
    await getCountries('');
    super.onReady();
  }

  Future<List<Country>> getCountries(String region) async {
    _loading.value = true;
    String url = region != '' ? "region/$region" : "all";
    print("https://restcountries.com/v3.1/$url");
    final response = await http.get(Uri.parse("https://restcountries.com/v3.1/$url"));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      _countries.value = result.map((e) => Country.fromJson(e)).toList();
      _loading.value = false;
      return _countries.value;
    } else {
      _loading.value = false;
      return [];
    }
  }


//end controller
}
