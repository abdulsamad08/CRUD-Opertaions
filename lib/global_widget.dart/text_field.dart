import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final IconData? suffix;
  final bool? isreadOnly;
  final ValueSetter<String>? onchanged;
  // ignore: prefer_typing_uninitialized_variables
  final prefix;
  final TextEditingController? controller;
  final String? Function(String?)? valid;
  final FocusNode? focusNode;

  final String initialValue;
  final VoidCallback? onTap;
  const CustomTextField(
      {super.key,
      required this.text,
      this.suffix,
      this.focusNode,
      this.onTap,
      this.prefix,
      this.isreadOnly = false,
      this.controller,
      this.valid,
      this.onchanged,
      // this.isReadable
      this.initialValue = ''});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // ignore: unused_field
  final bool _isEditable = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.text = widget.initialValue;
    // _isEditable = widget.initiallyEditable;
  }

  FocusNode? _focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: SizedBox(
          height: 55,
          child: TextFormField(
            onChanged: widget.onchanged,
            focusNode: widget.focusNode ?? _focusNode,
            readOnly: widget.isreadOnly ?? false,
            onTap: widget.onTap,
            controller: widget.controller,
            validator: widget.valid,
            style: const TextStyle(
              fontSize: 13,
            ),
            decoration: InputDecoration(
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),

              filled: true,
              fillColor: Colors.white70,
              // contentPadding:
              //     const EdgeInsets.symmetric(vertical: 10.0, horizontal: 13),
              isDense: false,
              hintText: widget.text,
              hintStyle: const TextStyle(color: Colors.green, fontSize: 12),
              prefixIcon: widget.prefix,
              suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: widget.onTap, icon: Icon(widget.suffix))),
            ),
          ),
        ));
  }
}