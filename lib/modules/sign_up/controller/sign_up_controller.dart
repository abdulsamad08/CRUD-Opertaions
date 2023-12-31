import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/utils/services/sql_services.dart';
import 'package:test_app/modules/view_products/view/product_view.dart';

class SignUpController extends GetxController {
  MySql mysql = MySql();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUpUser() {
    final String firstName = firstNameController.text.trim();
    final String lastName = lastNameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    // Call the insertUser function to insert the new user into the database
    mysql.insertUser(firstName, lastName, email, password).then((result) {
      if (result) {
        Get.snackbar('Success', 'User added successfully!');
        Get.to(const ProductView());
      } else {
        Get.snackbar('Error', 'Failed to add user.');
      }
    }).catchError((error) {
      Get.snackbar('Error', 'An error occurred while adding user.');
    });
  }
}
