import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/global_widget.dart/cutsom_btn.dart';
import 'package:test_app/modules/add_products/view/add_product_view.dart';
import 'package:test_app/modules/edit_products/view/edit_product_view.dart';

class AddOrEditProduct extends StatelessWidget {
  const AddOrEditProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomButton(
              mywidth: 0.4,
              onPressed: () {
                Get.to(AddProductsView());
              },
              child: 'Add Products',
              gradientColors: [Colors.green.shade400, Colors.greenAccent],
              color: Colors.green),
          CustomButton(
              mywidth: 0.4,
              onPressed: () {
                Get.to(EditProductsView());
              },
              child: 'Edit Products',
              gradientColors: [Colors.green.shade400, Colors.greenAccent],
              color: Colors.green)
        ],
      ),
    );
  }
}
