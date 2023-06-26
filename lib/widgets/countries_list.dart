import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_app_v2/controllers/country.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key, required this.regionGet})
      : super(key: key);

  final String regionGet;

  @override
  State<CountriesList> createState() {
    return _CountriesListState();
  }
}

class _CountriesListState extends State<CountriesList> {

  @override
  void initState() {
    print('=============');
    print('CountriesList initState');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MixinBuilder<CountryController>(
      init: CountryController(context),
      builder: (controller){

        if(controller.loading){
          return const Center(child: CircularProgressIndicator());
        }

        if(!controller.loading && controller.countries.isEmpty){
          return const Center(child: Text('no countries'));
        }

        return Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.countries.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                          width: 250,
                          child:
                          Image.network(controller.countries[index].image!)),
                      Text(controller.countries[index].name!),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                },
              )
            ),
          ],
        );
      },
    );
  }
}
