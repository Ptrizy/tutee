import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutee/presentation/styles/color.dart';
import 'package:tutee/presentation/styles/text.dart';

class TutorCard extends StatelessWidget {
  final String name;
  final String subject;
  final String rating;
  final String reviews;
  final String image;

  const TutorCard({
    super.key,
    required this.name,
    required this.subject,
    required this.rating,
    required this.reviews,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorStyles.neutral200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: ColorStyles.neutral300,
            child: Icon(
              Icons.person,
              color: ColorStyles.neutral600,
              size: 30.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyles.body2(weight: FontWeightOption.semiBold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  subject,
                  style: TextStyles.body3(color: ColorStyles.neutral600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorStyles.secondary500,
                      size: 12.sp,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      rating,
                      style: TextStyles.caption(
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        reviews,
                        style: TextStyles.caption(
                          color: ColorStyles.neutral600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
