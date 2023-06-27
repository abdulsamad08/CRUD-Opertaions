import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/values/app_constant.dart';
import 'package:test_app/data/product_model.dart';
import 'package:test_app/global_widget.dart/custom_appbar.dart';
import 'package:test_app/global_widget.dart/text.dart';
import 'package:test_app/modules/view_products/controller/product_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      appBar: customAppBar('View Products'),
      body: GetBuilder<ProductController>(
        init: productController,
        builder: (productController) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    if (productController.isLoading.value) {
                      return const CircularProgressIndicator();
                    } else if (productController.products.isEmpty) {
                      return const Text('No products available');
                    } else {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productController.products.length,
                        separatorBuilder: (context, index) => mediumSpace,
                        itemBuilder: (context, index) {
                          final Product product =
                              productController.products[index];
                          return Container(
                            padding: const EdgeInsets.only(top: 15),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Call delete product function
                                  productController.deleteProduct(product.id);
                                },
                              ),
                              title:
                              textWidget(
                                        text:
                                            'Name: ${product.name ?? ''}',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                               
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  smallSpace,
                                  textWidget(
                                        text:
                                            'Description: ${product.description ?? ''}',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                  
                                  extrasmallSpace,
                                    textWidget(
                                        text:
                                            'Quantity: ${product.quantity?.toString() ?? ''}',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                  extrasmallSpace,
                                  textWidget(
                                        text:
                                            'Category: ${product.category ?? ''}',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                
                                  smallSpace,
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: textWidget(
                                        text:
                                            'Price: \$${product.price?.toStringAsFixed(2) ?? ''}',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.green,
                                      )),
                                  smallSpace,
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
