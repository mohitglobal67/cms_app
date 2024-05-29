import 'package:carousel_slider/carousel_slider.dart';
import 'package:cms_news/bloc/bloc/news_bloc.dart';
import 'package:cms_news/utils/constant/colors.dart';
import 'package:cms_news/utils/constant/textstyle.dart';
import 'package:cms_news/view/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final _controller = CarouselController();
  int _current = 0;

  @override
  void initState() {
    context.read<NewsBloc>().add(GetBannersgNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            switch (state.condation) {
              case Condation.loading:
                return const Center(child: CircularProgressIndicator());
              case Condation.sucess:
                return Column(
                  children: [
                    CarouselSlider.builder(
                        itemCount: state.banners!.length,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          var data = state.banners![index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                              image: data.coverImage,
                                              details: data.summary,
                                              title: data.title,
                                            )),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5.0.r),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0.r)),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.network(
                                              data.coverImage.toString(),
                                              height: 128.h,
                                              fit: BoxFit.cover,
                                              width: 1000.0.w),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                            200, 0, 0, 0),
                                                        Color.fromARGB(
                                                            0, 0, 0, 0)
                                                      ],
                                                      begin: Alignment
                                                          .bottomCenter,
                                                      end: Alignment.topCenter,
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8.0.h,
                                                      horizontal: 10.0.r),
                                                  child: Text(
                                                      data.title.toString(),
                                                      style: secondTextStyle(
                                                          AppColors
                                                              .primaryWhiteColor)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          );
                        }),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      for (int i = 0; i < state.banners!.length; i++)
                        GestureDetector(
                          onTap: () => _controller.animateToPage(i),
                          child: Container(
                            width: _current == i ? 15.0 : 8.0,
                            height: 8.0.h,
                            margin: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                borderRadius: _current == i
                                    ? BorderRadius.circular(8.0)
                                    : null,
                                shape: _current == i
                                    ? BoxShape.rectangle
                                    : BoxShape.circle,
                                color: _current == i
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey.withOpacity(0.3)),
                          ),
                        )
                    ])
                  ],
                );

              case Condation.failuar:
                return Center(child: Text(state.message.toString()));
            }
          },
        ),
      ],
    );
  }
}
