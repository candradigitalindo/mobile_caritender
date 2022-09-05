import 'package:flutter/material.dart';
import 'package:tender_mobile/models/keywords_model.dart';
import 'package:tender_mobile/services/keywords_service.dart';
import 'package:tender_mobile/shared/theme.dart';

class KeywordsPage extends StatefulWidget {
  const KeywordsPage({super.key});

  @override
  State<KeywordsPage> createState() => _KeywordsPageState();
}

class _KeywordsPageState extends State<KeywordsPage> {
  late Future data;
  List<KeywordsModel> data2 = [];

  @override
  void initState() {
    data = KeywordsService().getKeywords();
    data.then((value) {
      setState(() {
        data2 = value;
      });
    });
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
              Navigator.pushNamed(context, '/add-keywords');
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
                );
              },
            ),
    );
  }
}
