import 'package:flutter/material.dart';
import 'package:test_app/global_widget.dart/text_field.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: Column(
          children: [
            CustomTextField(text: 'Name'),
            CustomTextField(text: 'Name'),
            CustomTextField(text: 'Name'),
            CustomTextField(text: 'Name'),
            CustomTextField(text: 'Name'),
          ],
        ),
      ),
    );
  }
}
