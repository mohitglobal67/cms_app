import 'package:cms_news/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:cms_news/bloc/bloc/news_bloc.dart';
import 'package:cms_news/utils/constant/colors.dart';
import 'package:cms_news/utils/constant/textstyle.dart';
import 'package:html/parser.dart' show parse;

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  PaletteGenerator? paletteGenerator;
  Color defaultcolor = AppColors.primaryWhiteColor;

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(GetBreakingNews());
  }

  String removeHtmlTags(String htmlString) {
    final document = parse(htmlString);
    return parse(document.body?.text).documentElement?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutesName.homepage,
            );
          },
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: defaultcolor,
        centerTitle: true,
        title: Text('Breaking news',
            style: h2TextStyle(AppColors.primaryBlackColor)),
      ),
      backgroundColor: AppColors.primarymainColor,
      body: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          switch (state.condation) {
            case Condation.loading:
              return const Center(child: CircularProgressIndicator());

            case Condation.sucess:
              if (state.breakingNews == null || state.breakingNews!.isEmpty) {
                return const Center(child: Text('No breaking news available.'));
              }

              return SizedBox(
                height: 600.h,
                child: CardSwiper(
                  cardsCount: state.breakingNews!.length,
                  cardBuilder: (context, index, x, y) {
                    var data = state.breakingNews![index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: AppColors.primaryWhiteColor,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Image.network(
                              data.coverImage.toString(),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  data.title.toString(),
                                  style:
                                      h2TextStyle(AppColors.primaryBlackColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Expanded(
                              //height: 320,
                              child: Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: Text(
                                  removeHtmlTags(
                                    data.summary.toString(),
                                  ),
                                  maxLines: 20,
                                  style: secondTextStyle(
                                      AppColors.primaryBlackColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );

            case Condation.failuar:
              return Center(child: Text(state.message.toString()));
          }
        }),
      ),
    );
  }
}
