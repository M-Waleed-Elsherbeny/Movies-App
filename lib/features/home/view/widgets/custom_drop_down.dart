import 'package:flutter/material.dart';
import 'package:movies_app/features/home/models/search_category.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: SearchCategory.popular,
      dropdownColor: Colors.black54,
      items: [
        DropdownMenuItem(
          value: SearchCategory.popular,
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.upcoming,
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      onChanged: (value) {},
      icon: Icon(Icons.menu, color: Colors.white),
      underline: Container(color: Colors.transparent),
    );
  }
}
