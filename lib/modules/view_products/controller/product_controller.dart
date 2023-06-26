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
      final productList = await mysql.getProducts();
      final parsedProducts =
          productList.map((item) => Product.fromJson(item)).toList();
      products.value = parsedProducts;
      isLoading.value = false; // Set isLoading to false when data is fetched
    } catch (e) {
      debugPrint('Error fetching products: $e');
      isLoading.value = false; // Set isLoading to false in case of an error
    }
  }
}
