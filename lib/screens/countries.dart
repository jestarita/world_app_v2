import 'package:flutter/material.dart';

import 'package:world_app_v2/widgets/countries_list.dart';
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
  Widget widgetForBody = CountriesList(
    key: UniqueKey(),
    regionGet: '',
  );

  String _title = '';
  String _region = '';
  void _setWidget(BuildContext contextGet, String title, String region) {
    if (region != '') {
      setState(() {
        Navigator.of(context).pop();
        _region = region;
        widgetForBody = CountriesList(
          regionGet: _region,
          key: UniqueKey(),
        );
        _title = title;
      });
    } else {
      setState(() {
        Navigator.of(context).pop();
        widgetForBody = CountriesList(
          key: UniqueKey(),
          regionGet: '',
        );
        _title = 'All Countries';
      });
    }
  }

  @override
  void initState() {
    _title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title),
      ),
      body: widgetForBody,
      drawer: DrawerList(parameters: _setWidget),
    );
  }
}
