import 'package:flutter/material.dart';
import 'package:tender_mobile/shared/theme.dart';
import 'package:tender_mobile/views/widgets/buttons.dart';
import 'package:tender_mobile/views/widgets/forms.dart';

class KeywordsAddPage extends StatefulWidget {
  const KeywordsAddPage({super.key});

  @override
  State<KeywordsAddPage> createState() => _KeywordsAddPageState();
}

class _KeywordsAddPageState extends State<KeywordsAddPage> {
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
                // NOTE : PHONE INPUT
                const CustomFormField(
                  title: 'Kata Kunci',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),

                CustomFilledButton(
                  title: 'Simpan',
                  onPressed: () {},
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

//https://www.youtube.com/watch?v=eh1mwHSebE4&t=6s
