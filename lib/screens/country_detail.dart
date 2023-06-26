import 'package:flutter/material.dart';
import 'package:world_app_v2/models/country.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({super.key, required this.countryGet});

  final Country countryGet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(countryGet.name!),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 45),
          child: Column(children: [
            CachedNetworkImage(
              imageUrl: countryGet.image!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 17,
            ),
            Text(countryGet.officialName!,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 17,
            ),
            Text(
              'Population: ${countryGet.population}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Region: ${countryGet.region!}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Subregion: ${countryGet.subRegion!}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            countryGet.currency != null
                ? const Text('Currency',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ))
                : const Text(''),
            const SizedBox(
              height: 5,
            ),
            countryGet.currency != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Name: ${countryGet.currency!.name}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Text('Symbol: ${countryGet.currency!.symbol}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ))
                    ],
                  )
                : const Text('')
          ])),
    );
  }
}
