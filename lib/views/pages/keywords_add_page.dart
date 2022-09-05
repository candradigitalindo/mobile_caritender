import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tender_mobile/services/keywords_service.dart';
import 'package:tender_mobile/shared/theme.dart';
import 'package:tender_mobile/views/widgets/buttons.dart';
import 'package:tender_mobile/views/widgets/forms.dart';

class KeywordsAddPage extends StatefulWidget {
  const KeywordsAddPage({super.key});

  @override
  State<KeywordsAddPage> createState() => _KeywordsAddPageState();
}

class _KeywordsAddPageState extends State<KeywordsAddPage> {
  TextEditingController keywordsController = TextEditingController();
  int count = 0;

  void createData() {
    KeywordsService()
        .saveKeywords(
      keywordsController.text,
    )
        .then((value) {
      setState(() {
        if (value) {
          Alert(
              context: context,
              title: "Berhasil",
              desc: "Keyword berhasil disimpan",
              type: AlertType.success,
              buttons: [
                DialogButton(
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    })
              ]).show();
        } else {
          Alert(
              context: context,
              title: "Gagal",
              desc: "Keyword gagal disimpan",
              type: AlertType.error,
              buttons: [
                DialogButton(
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]).show();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 50,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  title: 'Kata Kunci',
                  controller: keywordsController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFilledButton(
                  title: 'Simpan',
                  onPressed: () {
                    createData();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextButton(
                  title: 'Kembali',
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
