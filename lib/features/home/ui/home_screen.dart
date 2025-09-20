import 'package:flutter/material.dart';
import 'package:movies_app/features/home/widgets/custom_background.dart';

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
                mainAxisSize: MainAxisSize.min,
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
                      children: [
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) {},
                            controller: controller,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              hintText: 'Search...',
                              alignLabelWithHint: true,
                              focusColor: Colors.transparent,
                              hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Colors.black54,
                            ),
                          ),
                        ),
                        DropdownMenu(
                          // initialSelection: 'English',
                          // label: Text("English"),
                          dropdownMenuEntries: [],
                          width: deviceWidth * 0.35,
                          hintText: "Popular",
                          trailingIcon: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
