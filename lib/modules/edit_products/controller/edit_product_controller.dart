import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/utils/services/sql_services.dart';

class EditProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  MySql mysql = MySql();

  void updateProduct(int id, String name, double price, String category,
      int quantity, String description) async {
    await mysql.updateProduct(id, name, price, category, quantity, description);
    Get.snackbar('Success', 'Product updated successfully!');
    clearFields(); // Clear the text fields after updating the product
  }

  void clearFields() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    quantityController.clear();
    categoryController.clear();
  }
}
