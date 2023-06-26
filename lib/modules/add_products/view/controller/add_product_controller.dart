import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/core/utils/services/sql_services.dart';

class AddProductsController extends GetxController {
  final MySql mysql = MySql();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  late File? selectedImage;

  void selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
    }
  }

  Future<String> saveImageLocally(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/product_image.jpg';
    final File localImage = await imageFile.copy(imagePath);
    return localImage.path;
  }

  void addProduct() async {
    final String name = nameController.text;
    final String description = descriptionController.text;
    final double price = double.parse(priceController.text);
    final int quantity = int.parse(quantityController.text);
    final String category = categoryController.text;

    if (selectedImage != null) {
      final String localImagePath = await saveImageLocally(selectedImage!);
      final String imageUrl = 'https://example.com/images/$localImagePath';

      // Call the insertProduct function
      debugPrint('Local Image Path: $localImagePath');

      mysql.insertProduct(
          name, description, price, quantity, category, imageUrl);
      Get.snackbar('Success', 'Product added successfully!');
    } else {
      Get.snackbar('Error', 'Please select an image.');
    }
  }
}
