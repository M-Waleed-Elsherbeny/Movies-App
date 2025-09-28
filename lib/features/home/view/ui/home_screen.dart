import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/get_it_config.dart';
import 'package:movies_app/features/home/logic/cubit/home_cubit.dart';
import 'package:movies_app/features/home/view/widgets/custom_background.dart';
import 'package:movies_app/features/home/view/widgets/custom_drop_down.dart';
import 'package:movies_app/features/home/view/widgets/custom_movies_details.dart';
import 'package:movies_app/features/home/view/widgets/custom_search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double deviceHeight, deviceWidth;
  TextEditingController searchController = TextEditingController();
  HomeMoviesCubit homeCubit = getIt<HomeMoviesCubit>();
  int currentIndex = 0;
  @override
  void initState() {
    homeCubit.getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomBackground(
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
              index: currentIndex,
            ),
            Positioned(
              top: deviceHeight * 0.08,
              left: deviceWidth * 0.05,
              right: deviceWidth * 0.05,
              child: BlocConsumer<HomeMoviesCubit, HomeMoviesState>(
                listener: (context, state) {
                  if (state is HomeError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        margin: EdgeInsets.symmetric(
                          horizontal: deviceWidth * 0.1,
                          vertical: deviceHeight * 0.05,
                        ),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 100,
                        content: Text(
                          state.errorMessage,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                  if (state is DropDownChanged) {
                    homeCubit.getAllMovies();
                  }
                },
                builder: (context, state) {
                  log("builder Called");
                  return Column(
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
                              controller: searchController,
                              deviceWidth: deviceWidth * 0.6,
                              onChanged: (String? searchValue) {
                                log("searchValue ==> $searchValue");
                                homeCubit.searchMoviesByTitle(
                                  searchQuery: searchValue!.toLowerCase(),
                                );
                              },
                            ),
                            CustomDropDown(),
                          ],
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.05),
                      SizedBox(
                        height: deviceHeight * 0.8,
                        child: state is HomeLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  color: Colors.blue,
                                ),
                              )
                            : state is HomeSuccess
                            ? ListView.separated(
                                itemBuilder: (context, index) {
                                  return CustomMoviesDetails(
                                    deviceHeight: deviceHeight,
                                    deviceWidth: deviceWidth,
                                    index: index,
                                    onTap: () {
                                      currentIndex = index;
                                      setState(() {});
                                    },
                                    moviesModel:
                                        searchController.text.isNotEmpty
                                        ? homeCubit.searchMovies
                                        : homeCubit.allMovies,
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(color: Colors.transparent),
                                itemCount: searchController.text.isNotEmpty
                                    ? homeCubit.searchMovies.length
                                    : homeCubit.allMovies.length,
                              )
                            : Center(
                                child: Text(
                                  "No Data Founded",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
