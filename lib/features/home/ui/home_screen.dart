import 'package:flutter/material.dart';
import 'package:movies_app/features/home/widgets/custom_background.dart';
import 'package:movies_app/features/home/widgets/custom_drop_down.dart';
import 'package:movies_app/features/home/widgets/custom_movies_details.dart';
import 'package:movies_app/features/home/widgets/custom_search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double deviceHeight, deviceWidth;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomBackground(
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
            ),
            Positioned(
              top: deviceHeight * 0.08,
              left: deviceWidth * 0.05,
              right: deviceWidth * 0.05,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: deviceWidth,
                    height: deviceHeight * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomSearchField(
                          controller: controller,
                          deviceWidth: deviceWidth * 0.6,
                        ),
                        CustomDropDown(),
                      ],
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.05),
                  SizedBox(
                    height: deviceHeight * 0.8,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CustomMoviesDetails(
                          deviceHeight: deviceHeight,
                          deviceWidth: deviceWidth,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.transparent),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
