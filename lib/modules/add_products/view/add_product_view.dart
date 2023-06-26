// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/values/app_constant.dart';
import 'package:test_app/global_widget.dart/cutsom_btn.dart';
import 'package:test_app/global_widget.dart/text_field.dart';
import 'package:test_app/modules/add_products/view/controller/add_product_controller.dart';

class AddProductsView extends StatelessWidget {
  AddProductsView({super.key});
  AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                  text: 'name',
                  controller: addProductsController.nameController),
              CustomTextField(
                  text: 'description',
                  controller: addProductsController.descriptionController),
              CustomTextField(
                  text: 'price',
                  controller: addProductsController.priceController),
              CustomTextField(
                  text: 'quantity',
                  controller: addProductsController.quantityController),
              CustomTextField(
                  text: 'category',
                  controller: addProductsController.categoryController),
              mediumSpace,
                CustomButton(
                mywidth: 0.4,
                onPressed: () {
                  addProductsController.selectImage();
                },
                child: 'Select Image',
                gradientColors: [Colors.green.shade400, Colors.greenAccent],
                color: Colors.green,
              ),
              mediumSpace,
              CustomButton(
                  mywidth: 0.4,
                  onPressed: () {
                    addProductsController.addProduct();
                  },
                  child: 'Add Products',
                  gradientColors: [Colors.green.shade400, Colors.greenAccent],
                  color: Colors.green)
            ],
          ),
        ),
      ),
    );
  }
}
