import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tutee/models/program_belajar_model.dart';
import 'package:tutee/presentation/styles/color.dart';
import 'package:tutee/presentation/styles/text.dart';
import 'package:tutee/presentation/widgets/tutor_card.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List iklan = [
    'assets/iklan1.svg',
    'assets/iklan2.svg',
    'assets/iklan3.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 20.h),
              _buildSearchBar(),
              SizedBox(height: 20.h),
              _buildProgressSection(),
              SizedBox(height: 20.h),
              _buildPaketBelajarSection(),
              SizedBox(height: 20.h),
              _buildProgramBelajarSection(),
              SizedBox(height: 20.h),
              _buildTutorSection(),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
          CircleAvatar(
            radius: 25.r,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Halo,', style: TextStyles.body2(color: ColorStyles.white)),
              Text(
                'Maysa Heppy',
                style: TextStyles.heading3(color: ColorStyles.white),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.notifications_outlined,
            color: ColorStyles.white,
            size: 24.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: ColorStyles.neutral200,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          children: [
            Text(
              'Cari Materi',
              style: TextStyles.body2(color: ColorStyles.neutral600),
            ),
            Spacer(),
            Icon(Icons.search, color: ColorStyles.primary500, size: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Modul terakhir dibaca',
            style: TextStyles.body1(weight: FontWeightOption.semiBold),
          ),
          SizedBox(height: 5.h),
          Text(
            'Modul 12 : SQLite Database',
            style: TextStyles.body2(color: ColorStyles.neutral600),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(10),
                  value: 0.75,
                  backgroundColor: ColorStyles.primary700,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorStyles.secondary500,
                  ),
                  minHeight: 8.h,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                '75%',
                style: TextStyles.body2(
                  weight: FontWeightOption.semiBold,
                  color: ColorStyles.secondary500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaketBelajarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Pilih Paket Belajar',
            style: TextStyles.heading4(weight: FontWeightOption.semiBold),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 120.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: iklan.length,
            itemBuilder: (context, index) {
              return SvgPicture.asset(iklan[index]);
            },
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              iklan.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: _currentPage == index ? 20.w : 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color:
                      _currentPage == index
                          ? ColorStyles.primary500
                          : ColorStyles.neutral300,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgramBelajarSection() {
    final topPrograms = DummyData.programBelajarList.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Program Belajar',
                style: TextStyles.heading4(weight: FontWeightOption.semiBold),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/program-belajar');
                },
                child: Text(
                  'Lihat selengkapnya >>',
                  style: TextStyles.body3(color: ColorStyles.neutral600),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        Container(
          height: 240.h,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 1.5,
            ),
            itemCount: topPrograms.length,
            itemBuilder: (context, index) {
              final program = topPrograms[index];
              return GestureDetector(
                onTap: () {
                  if (program.isActive) {
                    context.push('/kelas-saat-ini', extra: program);
                  } else {
                    context.push('/ruang-belajar');
                  }
                },
                child: SvgPicture.asset(
                  program.icon,
                  width: 150.w,
                  height: 72.h,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTutorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tutor',
                style: TextStyles.heading4(weight: FontWeightOption.semiBold),
              ),
              Text(
                'Lihat selengkapnya >>',
                style: TextStyles.body3(color: ColorStyles.neutral600),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        Container(
          height: 120.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              TutorCard(
                name: 'Nisrlina Dyan',
                subject: 'Pemrograman Web',
                rating: '5',
                reviews: '(10 ulasan)',
                image: 'assets/tutor1.jpg',
              ),
              SizedBox(width: 15.w),
              TutorCard(
                name: 'Kansha CaSa',
                subject: 'Project Management',
                rating: '5',
                reviews: '(15 ulasan)',
                image: 'assets/tutor2.jpg',
              ),
              SizedBox(width: 15.w),
              TutorCard(
                name: 'Kansha CaSa',
                subject: 'Project Management',
                rating: '5',
                reviews: '(15 ulasan)',
                image: 'assets/tutor3.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
