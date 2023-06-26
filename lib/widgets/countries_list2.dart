import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:world_app_v2/models/country.dart';
import 'package:world_app_v2/screens/country_detail.dart';

class CountriesList2 extends StatelessWidget {
  final List<Country> countries;

  const CountriesList2({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    if (countries.isEmpty) {
      return const Center(child: Text('no countries'));
    }
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Card(
              borderOnForeground: true,
              elevation: 4.0,
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: countries[index].image!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      countries[index].name!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ButtonBar(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_circle_right_sharp,
                            size: 40),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => CountryDetailScreen(
                                  countryGet: countries[index])));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }
}
