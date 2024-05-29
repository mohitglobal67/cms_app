import 'package:cms_news/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:cms_news/bloc/bloc/news_bloc.dart';
import 'package:cms_news/utils/constant/colors.dart';
import 'package:cms_news/utils/constant/textstyle.dart';
import 'package:html/parser.dart' show parse;

class DetailsPage extends StatefulWidget {
  String? image;
  String? title;
  String? details;

  DetailsPage({
    super.key,
    required this.image,
    required this.title,
    required this.details,
  });

  @override
  State<DetailsPage> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<DetailsPage> {
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
        padding: EdgeInsets.only(left: 10.0.r, right: 10.r),
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.primaryWhiteColor,
            width: double.infinity,
            child: Column(
              children: [
                Image.network(
                  widget.image.toString(),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      widget.title.toString(),
                      style: h2TextStyle(AppColors.primaryBlackColor),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Text(
                    removeHtmlTags(
                      widget.details.toString(),
                    ),
                    style: secondTextStyle(AppColors.primaryBlackColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
