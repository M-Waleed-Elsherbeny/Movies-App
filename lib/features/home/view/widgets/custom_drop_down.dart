import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/core/di/get_it_config.dart';
import 'package:movies_app/features/home/logic/cubit/home_cubit.dart';
import 'package:movies_app/features/home/models/search_category.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    HomeMoviesCubit homeCubit = getIt<HomeMoviesCubit>();
    return DropdownButton(
      value: homeCubit.initialDropDown,
      dropdownColor: Colors.black54.withAlpha(100),
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
      onChanged: (value) {
        homeCubit.changeDropDown(newValue: value!);
        log(value);
      },
      icon: Icon(Icons.menu, color: Colors.white),
      underline: Container(color: Colors.transparent),
    );
  }
}
