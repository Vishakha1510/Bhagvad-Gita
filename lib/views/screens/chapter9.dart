import 'dart:convert';

import 'package:bhagvadgita/views/screens/detail1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chapter9 extends StatefulWidget {
  const Chapter9({super.key});

  @override
  State<Chapter9> createState() => _Chapter9State();
}

class _Chapter9State extends State<Chapter9> {
  List? chapterData;
  String? jsonString;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    jsonString = await rootBundle.loadString('assets/chapter9.json');
    Map decodedData = jsonDecode(jsonString!);
    setState(() {
      chapterData = decodedData['BhagavadGitaChapter'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade200,
        centerTitle: true,
        title: const Text(
          "CHAPTER-9  VERSES",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: chapterData == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: chapterData!.length,
              itemBuilder: (context, i) {
                var verse = chapterData![i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerseDetailScreen(verse: verse),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.blue,
                    margin: const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Verse ${verse['verse']}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              verse['text'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
