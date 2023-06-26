import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_app_v2/controllers/country.dart';
import 'package:world_app_v2/models/country.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({required Key key, required this.regionGet})
      : super(key: key);

  final String regionGet;

  @override
  State<CountriesList> createState() {
    return _CountriesListState();
  }
}

class _CountriesListState extends State<CountriesList> {
  final controller = Get.put(CountryController());
  late Future<List<Country>> _listadoPaises;

  @override
  void initState() {
    super.initState();
    _listadoPaises = controller.getCountries(widget.regionGet);
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        const SizedBox(
          height: 18,
        ),
        Expanded(
          child: FutureBuilder<List<Country>?>(
              future: _listadoPaises,
              builder: (context, countries) {
                if (countries.hasData &&
                    countries.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: countries.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                              width: 250,
                              child:
                                  Image.network(countries.data![index].image!)),
                          Text(countries.data![index].name!),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ],
    );
  }
}
