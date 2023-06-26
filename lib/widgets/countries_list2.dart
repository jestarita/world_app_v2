import 'package:flutter/material.dart';
import 'package:world_app_v2/models/country.dart';

class CountriesList extends StatelessWidget {

  final List<Country> countries;

  const CountriesList({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    if(countries.isEmpty){
      return const Center(child: Text('no countries'));
    }
    return  ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
                width: 250,
                child:
                Image.network(countries[index].image!)),
            Text(countries[index].name!),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }

}
