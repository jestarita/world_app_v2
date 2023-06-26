import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget{
  const DrawerList({super.key, required this.parameters});

  final Function(BuildContext context, String title, String region) parameters;

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
                    parameters(context,'countries from world', '');
                },
              ),
            ),
            ListTile(
              title: const Text('Europe'),
              onTap: () {
                 parameters(context,'List countries from europe', 'europe');
              },
            ),
            ListTile(
              title: const Text('America'),
              onTap: () {
                 parameters(context,'List countries from America', 'Americas');
              },
            ),
            ListTile(
              title: const Text('Asia'),
              onTap: () {
                      parameters(context, 'List countries from Asia', 'Asia');
              },
            ),
            ListTile(
              title: const Text('Africa'),
              onTap: () {
                      parameters(context, 'List countries from Africa', 'Africa');
              },
            ),
            ListTile(
              title: const Text('Oceania'),
              onTap: () {
                      parameters(context, 'List countries from Oceania', 'Oceania');
              },
            )
          ],
        ),
      );
  }

}
