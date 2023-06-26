import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/add_products/view/add_product_view.dart';
import 'package:test_app/modules/view_products/view/product_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //  home: AddProductsView()
        home: ProductView());
  }
}
