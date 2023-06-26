// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/values/app_constant.dart';
import 'package:test_app/global_widget.dart/custom_appbar.dart';
import 'package:test_app/global_widget.dart/cutsom_btn.dart';
import 'package:test_app/global_widget.dart/text.dart';
import 'package:test_app/global_widget.dart/text_field.dart';
import 'package:test_app/modules/sign_in/controller/sign_in_controller.dart';

class SignINView extends StatelessWidget {
  SignINView({Key? key}) : super(key: key);

  SignINController signINController = SignINController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar('Sign In'),
      body: Padding(
        padding: const EdgeInsets.only(left: 34, right: 34),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                textWidget(
                  text: 'Log in or sign up to\nbook',
                  textAlign: TextAlign.left,
                  fontSize: 20,
                ),
                const SizedBox(height: 8),
                smallSpace,
                textWidget(
                  text: "Email",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: signINController.emailController,
                  text: "Email",
                  valid: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                textWidget(
                  text: "Password",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: signINController.passwordController,
                  text: "Password",
                  valid: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 characters";
                    }
                    return null;
                  },
                ),
                largeSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      borderColor: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(35),
                      mywidth: 0.39,
                      height: 55,
                      onPressed: () {
                        signINController.signInUser();
                      },
                      child: "Log-in",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.black,
                      color: Colors.white,
                      gradientColors: const [],
                    ),
                    smallSpaceh,
                    CustomButton(
                      borderRadius: BorderRadius.circular(35),
                      mywidth: 0.39,
                      height: 55,
                      onPressed: () {
                        // signINController.signUpUser();
                      },
                      child: "Sign-Up",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                      color: const Color.fromARGB(255, 8, 49, 4),
                      gradientColors: const [],
                    ),
                  ],
                ),
                mediumSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
