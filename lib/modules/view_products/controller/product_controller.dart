import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:test_app/core/utils/services/sql_services.dart';
import 'package:test_app/data/product_model.dart';


class ProductController extends GetxController {
  final MySql mysql = MySql();
  final products = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

 void fetchProducts() async {
  try {
    final List<Object> productList = await mysql.getProducts();
    final List<Product> parsedProducts = productList
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
    products.value = parsedProducts;
  } catch (e) {
    debugPrint('Error fetching products: $e');
  }
}

}
