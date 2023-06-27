// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/values/app_constant.dart';
import 'package:test_app/global_widget.dart/cutsom_btn.dart';
import 'package:test_app/global_widget.dart/text_field.dart';
import 'package:test_app/modules/add_products/view/controller/add_product_controller.dart';

class EditProductsView extends StatelessWidget {
  EditProductsView({super.key});

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
                  
                  
                  ),
              CustomTextField(
                  text: 'description',
                ),
              CustomTextField(
                  text: 'price'),
              CustomTextField(
                  text: 'quantity'),
              CustomTextField(
                  text: 'category'),
              mediumSpace,
               
              mediumSpace,
              CustomButton(
                  mywidth: 0.4,
                  onPressed: () {
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
