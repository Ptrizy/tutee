import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tutee/models/program_belajar_model.dart';
import 'package:tutee/presentation/styles/color.dart';
import 'package:tutee/presentation/styles/text.dart';

class ModulScreen extends StatefulWidget {
  final Map<String, dynamic> args;

  const ModulScreen({super.key, required this.args});

  @override
  _ModulScreenState createState() => _ModulScreenState();
}

class _ModulScreenState extends State<ModulScreen> {
  bool _showChapterMenu = false;

  @override
  Widget build(BuildContext context) {
    final ModulData module = widget.args['module'];
    final ProgramBelajar program = widget.args['program'];
    final int moduleIndex = widget.args['moduleIndex'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildHeader(context, module, moduleIndex),
                Expanded(child: _buildContent(module, program)),
              ],
            ),
            if (_showChapterMenu) _buildChapterMenu(program),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ModulData module, int moduleIndex) {
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
          Expanded(
            child: Text(
              'Modul ${moduleIndex + 1}: ${module.judul}',
              style: TextStyles.heading3(color: ColorStyles.white),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showChapterMenu = !_showChapterMenu;
              });
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: ColorStyles.secondary500,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.menu, color: ColorStyles.white, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChapterMenu(ProgramBelajar program) {
    return Positioned(
      top: 80.h,
      left: 20.w,
      right: 20.w,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: ColorStyles.primary500,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              program.bab.asMap().entries.map((entry) {
                int index = entry.key;
                String bab = entry.value;
                bool isCompleted =
                    index == 0; // Only first chapter is completed

                return Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bab ${index + 1} : $bab',
                              style: TextStyles.body1(
                                weight: FontWeightOption.semiBold,
                                color: ColorStyles.white,
                              ),
                            ),
                            Container(
                              height: 2.h,
                              width: double.infinity,
                              color: ColorStyles.secondary500,
                              margin: EdgeInsets.only(top: 5.h),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color:
                              isCompleted
                                  ? ColorStyles.success500
                                  : ColorStyles.neutral400,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isCompleted
                              ? Icons.check
                              : Icons.radio_button_unchecked,
                          color: ColorStyles.white,
                          size: 16.sp,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildContent(ModulData module, ProgramBelajar program) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${module.konten}',
            style: TextStyles.body3(weight: FontWeightOption.semiBold),
          ),
        ],
      ),
    );
  }
}
