import 'package:bhagvadgita/providers/theme_provider.dart';
import 'package:bhagvadgita/views/screens/chapter1.dart';
import 'package:bhagvadgita/views/screens/chapter10.dart';
import 'package:bhagvadgita/views/screens/chapter11.dart';
import 'package:bhagvadgita/views/screens/chapter12.dart';
import 'package:bhagvadgita/views/screens/chapter13.dart';
import 'package:bhagvadgita/views/screens/chapter14.dart';
import 'package:bhagvadgita/views/screens/chapter15.dart';
import 'package:bhagvadgita/views/screens/chapter16.dart';
import 'package:bhagvadgita/views/screens/chapter17.dart';
import 'package:bhagvadgita/views/screens/chapter18.dart';
import 'package:bhagvadgita/views/screens/chapter2.dart';
import 'package:bhagvadgita/views/screens/chapter3.dart';
import 'package:bhagvadgita/views/screens/chapter4.dart';
import 'package:bhagvadgita/views/screens/chapter5.dart';
import 'package:bhagvadgita/views/screens/chapter6.dart';
import 'package:bhagvadgita/views/screens/chapter7.dart';
import 'package:bhagvadgita/views/screens/chapter8.dart';
import 'package:bhagvadgita/views/screens/chapter9.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List<Widget> chapters = [
    Chapter1page(),
    Chapter2page(),
    Chapter3(),
    Chapter4(),
    Chapter5(),
    Chapter6(),
    Chapter7(),
    Chapter8(),
    Chapter9(),
    Chapter10(),
    Chapter11(),
    Chapter12(),
    Chapter13(),
    Chapter14(),
    Chapter15(),
    Chapter16(),
    Chapter17(),
    Chapter18()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "BHAGVADGITA",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toogletheme();
            },
            icon: Provider.of<ThemeProvider>(context, listen: true).isdark
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.blue,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => chapters[index],
                ));
              },
              title: const Text("Bhagvadgita"),
              subtitle: Text("Chapter ${index + 1}"),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
