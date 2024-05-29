import 'package:cms_news/bloc/bloc/news_bloc.dart';
import 'package:cms_news/utils/constant/colors.dart';
import 'package:cms_news/utils/constant/textstyle.dart';
import 'package:cms_news/utils/routes/routes_name.dart';
import 'package:cms_news/widget/custom_slider.dart';
import 'package:cms_news/widget/drawer.dart';
import 'package:cms_news/widget/trending_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      GlobalKey<ScaffoldState>();
  int? select = 0;

  bool check = true;

  @override
  void initState() {
    context.read<NewsBloc>().add(GetCatagoryNews());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarymainColor,
      appBar: AppBar(
        elevation: 4,
        leading: InkWell(
            onTap: () {
              if (_drawerscaffoldkey.currentState!.isDrawerOpen) {
                _drawerscaffoldkey.currentState!.closeDrawer();
              } else {
                _drawerscaffoldkey.currentState!.openDrawer();
              }
            },
            child: const Icon(Icons.menu)),
        backgroundColor: AppColors.primarymainColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 60.w),
            child: Row(children: [
              InkWell(
                onTap: () {
                  setState(() {
                    check = true;
                  });
                },
                child: Text(
                  "Trending news",
                  style: h2TextStyle(check == false
                      ? AppColors.primaryBlackColor
                      : AppColors.redColor),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.breakingpage,
                  );
                  setState(() {
                    check = false;
                  });
                },
                child: Text(
                  "Breaking news",
                  style: h2TextStyle(check == true
                      ? AppColors.primaryBlackColor
                      : AppColors.redColor),
                ),
              ),
            ]),
          )
        ],
      ),
      drawer: const drawer(),
      key: _drawerscaffoldkey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.r, right: 10.r),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 45.h,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: state.categories!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var data = state.categories![index];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                select = index;
                              });
                            },
                            child: Container(
                              //height: 40.h,

                              width: 120.w,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryWhiteColor,
                                  border: Border.all(
                                      color: select == index
                                          ? AppColors.redColor
                                          : Colors.transparent,
                                      width: 1.5.h),
                                  borderRadius: BorderRadius.circular(25.r)),
                              child: Center(
                                  child: Text(
                                data.title.toString(),
                                style: secondTextStyle(
                                    AppColors.primaryBlackColor),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          );
                        }),
                  );
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomCarouselSlider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending news",
                    style: h2TextStyle(AppColors.primaryBlackColor),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(''),
                  ),
                ],
              ),

              RecommendationItem(),
              // ...news
              //     .map((newsItem) => Padding(
              //           padding: const EdgeInsets.only(bottom: 16.0),
              //           child: InkWell(
              //             onTap: () {
              //               // final index = news.indexOf(newsItem);

              //               // Navigator.of(context, rootNavigator: true)
              //               //     .push(
              //               //       CupertinoPageRoute(
              //               //         builder: (_) => NewsDetailsPage(
              //               //           index: index,
              //               //         ),
              //               //       ),
              //               //     )
              //               // .then((value) => setState(
              //               //       () {},
              //               //     ));
              //             },
              //             child: RecommendationItem(newsItem: newsItem),
              //           ),
              //         ))
              //     .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
