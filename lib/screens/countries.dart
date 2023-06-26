import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_app_v2/controllers/country.dart';

import 'package:world_app_v2/widgets/countries_list2.dart';
import 'package:world_app_v2/widgets/drawer_list.dart';

class Countries extends StatefulWidget {
  const Countries({super.key, required this.title, required this.region});

  final String title;

  final String region;

  @override
  State<Countries> createState() {
    return _CountriesState();
  }
}

class _CountriesState extends State<Countries> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MixinBuilder<CountryController>(
      init: CountryController(context),
      builder: (controller){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(controller.title),
          ),
          body: controller.loading ? const Center(child: CircularProgressIndicator()) : CountriesList2(
            countries: controller.countries,
          ),
          drawer: DrawerList(onSelected: (region){
            controller.getCountries(region);
            controller.setTitle(region != '' ? 'Countries from $region' : 'All Countries');
          }),
        );
      },
    );

  }
}
