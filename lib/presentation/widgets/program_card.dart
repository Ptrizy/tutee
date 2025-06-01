import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tutee/models/program_belajar_model.dart';
import 'package:tutee/presentation/styles/color.dart';
import 'package:tutee/presentation/styles/text.dart';

class ProgramCard extends StatelessWidget {
  final ProgramBelajar program;

  const ProgramCard({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (program.isActive) {
          context.push('/kelas-saat-ini', extra: program);
        } else {
          context.push('/ruang-belajar');
        }
      },
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          gradient: _getGradientForProgram(program.nama),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIcon(program.nama),
            Text(
              program.nama,
              style: TextStyles.body1(
                weight: FontWeightOption.semiBold,
                color: ColorStyles.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient _getGradientForProgram(String programName) {
    switch (programName) {
      case 'Pemrograman Web':
        return LinearGradient(
          colors: [Color(0xFFFF6B35), Color(0xFFE55100)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Pemrograman Android':
        return LinearGradient(
          colors: [Color(0xFF42A5F5), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Project Management':
        return LinearGradient(
          colors: [Color(0xFF7B1FA2), Color(0xFF4A148C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Data Science':
        return LinearGradient(
          colors: [Color(0xFF66BB6A), Color(0xFF2E7D32)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Data Mining':
        return LinearGradient(
          colors: [Color(0xFFEF5350), Color(0xFFC62828)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Pemrograman Dasar Java':
        return LinearGradient(
          colors: [Color(0xFFD4E157), Color(0xFF827717)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return LinearGradient(
          colors: [Color(0xFF42A5F5), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }

  Widget _buildIcon(String programName) {
    IconData iconData;
    switch (programName) {
      case 'Pemrograman Web':
        iconData = Icons.language;
        break;
      case 'Pemrograman Android':
        iconData = Icons.phone_android;
        break;
      case 'Project Management':
        iconData = Icons.assignment;
        break;
      case 'Data Science':
        iconData = Icons.analytics;
        break;
      case 'Data Mining':
        iconData = Icons.search;
        break;
      case 'Pemrograman Dasar Java':
        iconData = Icons.code;
        break;
      default:
        iconData = Icons.book;
    }

    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(iconData, color: ColorStyles.white, size: 24.sp),
    );
  }
}
