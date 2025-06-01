import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tutee/models/program_belajar_model.dart';
import 'package:tutee/presentation/styles/color.dart';
import 'package:tutee/presentation/styles/text.dart';

class RuangBelajarScreen extends StatelessWidget {
  const RuangBelajarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activePrograms =
        DummyData.programBelajarList
            .where((program) => program.isActive)
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Kelas Saat ini',
                style: TextStyles.heading4(weight: FontWeightOption.semiBold),
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child:
                  activePrograms.isEmpty
                      ? _buildEmptyState()
                      : _buildActiveClasses(context, activePrograms),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorStyles.primary500,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Icon(
              Icons.arrow_back,
              color: ColorStyles.white,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 15.w),
          Text(
            'Ruang Belajar',
            style: TextStyles.heading3(color: ColorStyles.white),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_outlined,
            size: 80.sp,
            color: ColorStyles.neutral400,
          ),
          SizedBox(height: 20.h),
          Text(
            'Tidak ada kelas aktif',
            style: TextStyles.heading4(color: ColorStyles.neutral600),
          ),
          SizedBox(height: 10.h),
          Text(
            'Pilih program belajar untuk memulai kelas',
            style: TextStyles.body2(color: ColorStyles.neutral500),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveClasses(
    BuildContext context,
    List<ProgramBelajar> activePrograms,
  ) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: activePrograms.length,
      itemBuilder: (context, index) {
        final program = activePrograms[index];
        return GestureDetector(
          onTap: () {
            context.push('/kelas-saat-ini', extra: program);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: ColorStyles.primary500,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/task.svg', width: 24.w),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            program.nama,
                            style: TextStyles.body1(
                              weight: FontWeightOption.semiBold,
                              color: ColorStyles.white,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            program.id == '1'
                                ? 'Senin, Pukul 09:00 - 11:00'
                                : 'Kamis, Pukul 16:00 - 17:00',
                            style: TextStyles.body3(color: ColorStyles.white),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/chat.svg', width: 24.w),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(
                  height: 4,
                  thickness: 2,
                  color: ColorStyles.secondary500,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
