import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/values/app_constant.dart';
import 'package:test_app/data/product_model.dart';
import 'package:test_app/global_widget.dart/text.dart';
import 'package:test_app/modules/view_products/controller/product_controller.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key});
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            mediumSpace,
            Obx(
              () {
                if (productController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else if (productController.products.isEmpty) {
                  return textWidget(text: 'No products available');
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      final Product product = productController.products[index];
                      return ListTile(
                        leading: Image.network(product.image ?? ''),
                        title: Text(product.name ?? ''),
                        subtitle: Text(product.description ?? ''),
                        trailing:
                            Text('\$${product.price!.toStringAsFixed(2)}'),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
