import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.deviceWidth,
    required this.controller, this.onSubmitted,
  });
  final double deviceWidth;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth,
      child: TextField(
        onSubmitted: onSubmitted,
        controller: controller,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: InputBorder.none,
          hintText: 'Search...',
          alignLabelWithHint: true,
          focusColor: Colors.transparent,
          hintStyle: TextStyle(color: Colors.white),
          // filled: true,
          // fillColor: Colors.black54,
        ),
      ),
    );
  }
}
