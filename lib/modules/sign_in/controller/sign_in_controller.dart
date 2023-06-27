import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/utils/services/sql_services.dart';
import 'package:test_app/data/user_model.dart';
import 'package:test_app/modules/add_or_edit_product_view.dart';

class SignINController extends GetxController {
  MySql mysql = MySql();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signInUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    List<User> users = await mysql.getUsers();

    bool isMatched =
        users.any((user) => user.email == email && user.password == password);

    if (isMatched) {
      Get.snackbar('Success', 'Sign in successful!');
      Get.to(AddOrEditProduct());
    } else {
      // Show an error snackbar
      Get.snackbar('Error', 'Invalid email or password');
    }
  }
}
