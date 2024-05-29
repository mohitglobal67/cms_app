import 'package:cms_news/bloc/bloc/news_bloc.dart';
import 'package:cms_news/utils/constant/colors.dart';
import 'package:cms_news/utils/constant/textstyle.dart';
import 'package:cms_news/view/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationItem extends StatefulWidget {
  const RecommendationItem({
    super.key,
  });

  @override
  State<RecommendationItem> createState() => _RecommendationItemState();
}

class _RecommendationItemState extends State<RecommendationItem> {
  @override
  void initState() {
    context.read<NewsBloc>().add(GetTrandingNews());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.trendingNews!.length,
            itemBuilder: (context, index) {
              var data = state.trendingNews![index];
              return InkWell(
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
                  color: AppColors.primaryWhiteColor,
                  margin: EdgeInsets.only(bottom: 8.h),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0.r),
                          child: Image.network(
                            data.coverImage.toString(),
                            height: 80.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16.0.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.category.toString(),
                                style:
                                    secondTextStyle(AppColors.primaryGreyColor),
                              ),
                              SizedBox(height: 8.0.h),
                              Text(
                                data.title.toString(),
                                style: secondTextStyle(
                                    AppColors.primaryBlackColor),
                              ),
                              SizedBox(height: 20.0.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
