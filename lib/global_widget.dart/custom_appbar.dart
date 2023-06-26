import 'package:flutter/material.dart';
import 'package:test_app/global_widget.dart/text.dart';

AppBar customAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.white,
    title: textWidget(
      text: title,
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
  );
}
