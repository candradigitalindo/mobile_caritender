import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_mobile/blocs/auth/auth_bloc.dart';
import 'package:tender_mobile/models/sign_up_form_model.dart';
import 'package:tender_mobile/shared/method.dart';
import 'package:tender_mobile/shared/theme.dart';
import 'package:tender_mobile/views/widgets/buttons.dart';
import 'package:tender_mobile/views/widgets/forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController(text: '');
  final phoneController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          // if (state is AuthCheckPhoneSuccess) {
          //   Navigator.pushNamedAndRemoveUntil(
          //       context, '/home', (route) => false);
          // }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                width: 155,
                height: 50,
                margin: const EdgeInsets.only(
                  top: 50,
                  bottom: 20,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/logo_caritender.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Selamat Datang\nSilahkan isi kolom dibawah ini.',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 5,
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
                      title: 'Nama',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // NOTE : PHONE INPUT
                    CustomFormField(
                      title: 'No. WhatsApp',
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    // NOTE : PASSWORD INPUT
                    CustomFormField(
                      title: 'Password',
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    CustomFilledButton(
                      title: 'Buat Akun',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthRegister(
                                  SignUpFormModel(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackbar(
                              context, 'Mohon isi Kolom yang kosong');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextButton(
                      title: 'Login',
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
