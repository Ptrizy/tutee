import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tutee/models/program_belajar_model.dart';
import 'package:tutee/presentation/styles/color.dart';
import 'package:tutee/presentation/styles/text.dart';

class KelasSaatIniScreen extends StatelessWidget {
  final ProgramBelajar program;

  const KelasSaatIniScreen({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    final modules = DummyData.getModulesForProgram(program.id);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, program),
            SizedBox(height: 20.h),
            _buildDescription(program),
            SizedBox(height: 20.h),
            _buildChatButton(),
            SizedBox(height: 20.h),
            Expanded(child: _buildModulesList(context, modules, program)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ProgramBelajar program) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorStyles.primary500,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Row(
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
                  program.nama,
                  style: TextStyles.heading3(color: ColorStyles.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            program.id == '1' ? 'Rabu, 09:00-11:00' : 'Kamis, 16:00-17:00',
            style: TextStyles.body2(color: ColorStyles.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(ProgramBelajar program) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: ColorStyles.secondary50,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          program.deskripsi,
          style: TextStyles.body2(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildChatButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 150.w,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: ColorStyles.primary500,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(child: SvgPicture.asset('assets/chat.svg', width: 24.w)),
      ),
    );
  }

  Widget _buildModulesList(
    BuildContext context,
    List<ModulData> modules,
    ProgramBelajar program,
  ) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: modules.length,
      itemBuilder: (context, index) {
        final module = modules[index];
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          child: GestureDetector(
            onTap: () {
              context.push(
                '/modul',
                extra: {
                  'module': module,
                  'program': program,
                  'moduleIndex': index,
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: ColorStyles.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorStyles.neutral200),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Modul ${index + 1}',
                              style: TextStyles.body1(
                                weight: FontWeightOption.semiBold,
                              ),
                            ),
                            SizedBox(width: 24.w),
                            Text(
                              module.judul,
                              style: TextStyles.body2(
                                color: ColorStyles.neutral600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.sp,
                        color: ColorStyles.primary500,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Divider(
                    color: ColorStyles.secondary500,
                    height: 2,
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
