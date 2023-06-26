import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget{
  const DrawerList({super.key, required this.onSelected});

  // final Function(BuildContext context, String title, String region) parameters;
  final Function(String region) onSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 0, 0, 0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/globe.png'),
                  )),
              child: InkWell(
                child: RichText(
                  text: TextSpan(
                      text: "", style: DefaultTextStyle.of(context).style),
                ),
                onTap: () {
                    onSelected('');
                    Navigator.of(context).pop();
                },
              ),
            ),
            ListTile(
              title: const Text('Europe'),
              onTap: () {
                onSelected('europe');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('America'),
              onTap: () {
                onSelected('Americas');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Asia'),
              onTap: () {
                onSelected('Asia');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Africa'),
              onTap: () {
                onSelected('Africa');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Oceania'),
              onTap: () {
                onSelected('Oceania');
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
  }

}
