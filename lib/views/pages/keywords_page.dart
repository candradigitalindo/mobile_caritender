// ignore_for_file: prefer_is_empty

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tender_mobile/models/keywords_model.dart';
import 'package:tender_mobile/services/keywords_service.dart';
import 'package:tender_mobile/shared/theme.dart';
import 'package:tender_mobile/views/pages/keywords_add_page.dart';

class KeywordsPage extends StatefulWidget {
  const KeywordsPage({super.key});

  @override
  State<KeywordsPage> createState() => _KeywordsPageState();
}

class _KeywordsPageState extends State<KeywordsPage> {
  late Future data;
  List<KeywordsModel> data2 = [];
  final KeywordsService keywordsService = KeywordsService();

  void ambilData() {
    data = KeywordsService().getKeywords();
    data.then((value) {
      setState(() {
        data2 = value;
      });
    });
  }

  FutureOr onGoBack(dynamic value) {
    ambilData();
  }

  void navigateAddKeywords() {
    Route route =
        MaterialPageRoute(builder: (context) => const KeywordsAddPage());
    Navigator.push(context, route).then(onGoBack);
  }

  @override
  void initState() {
    ambilData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: const Text('Kata Kunci'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              navigateAddKeywords();
            },
          )
        ],
      ),
      body: data2.length == 0
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data2.length,
              itemBuilder: (contex, index) {
                return ListTile(
                  title: Text(data2[index].keyword),
                  trailing: IconButton(
                    onPressed: () async {
                      await keywordsService.deleteKeywords(data2[index].id!);
                      return ambilData();
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
