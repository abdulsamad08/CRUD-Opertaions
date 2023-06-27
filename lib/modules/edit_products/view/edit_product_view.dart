// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/values/app_constant.dart';
import 'package:test_app/global_widget.dart/custom_appbar.dart';
import 'package:test_app/global_widget.dart/cutsom_btn.dart';
import 'package:test_app/global_widget.dart/text_field.dart';
import 'package:test_app/modules/edit_products/controller/edit_product_controller.dart';

class EditProductsView extends StatelessWidget {
  EditProductsView({super.key});

  EditProductController editProductController =
      Get.put(EditProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Edit Product'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                text: 'name',
                controller: editProductController.nameController,
              ),
              CustomTextField(
                text: 'description',
                controller: editProductController.descriptionController,
              ),
              CustomTextField(
                text: 'price',
                controller: editProductController.priceController,
              ),
              CustomTextField(
                text: 'quantity',
                controller: editProductController.quantityController,
              ),
              CustomTextField(
                text: 'category',
                controller: editProductController.categoryController,
              ),
              mediumSpace,
              mediumSpace,
              CustomButton(
                  mywidth: 0.4,
                  onPressed: () {
                    editProductController.updateProduct(
                        1,
                        editProductController.nameController.text,
                        double.parse(
                            editProductController.priceController.text),
                        editProductController.categoryController.text,
                        int.parse(
                            editProductController.quantityController.text),
                        editProductController.descriptionController.text);
                  },
                  child: 'Update Products',
                  gradientColors: [Colors.green.shade400, Colors.greenAccent],
                  color: Colors.green)
            ],
          ),
        ),
      ),
    );
  }
}
