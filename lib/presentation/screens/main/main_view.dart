import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutee/presentation/screens/main/belajar/belajar_screen.dart';
import 'package:tutee/presentation/screens/main/beranda/beranda_screen.dart';
import 'package:tutee/presentation/screens/main/cari_tutor/cari_tutor_screen.dart';
import 'package:tutee/presentation/screens/main/daftar_kelas/daftar_kelas_screen.dart';
import 'package:tutee/presentation/styles/color.dart';
import 'package:tutee/presentation/styles/text.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late List<Widget> screens;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    screens = [
      BerandaScreen(),
      const BelajarScreen(),
      const CariTutorScreen(),
      const DaftarKelasScreen(),
    ];

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: screens[currentIndex]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 66,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorStyles.primary500,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(71, 64, 66, 0.1),
                    blurRadius: 24,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: ColorStyles.primary500,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                  _controller.reset();
                  _controller.forward();
                },
                showUnselectedLabels: true,
                selectedLabelStyle: TextStyles.body3(
                  color: ColorStyles.secondary500,
                  weight: FontWeightOption.semiBold,
                ),
                selectedItemColor: ColorStyles.secondary500,
                unselectedLabelStyle: TextStyles.body3(
                  color: ColorStyles.white,
                  weight: FontWeightOption.regular,
                ),
                unselectedItemColor: ColorStyles.neutral500,
                items: [
                  _buildAnimatedNavItem(
                    index: 0,
                    inactiveIcon: 'assets/beranda-inactive.svg',
                    activeIcon: 'assets/beranda-active.svg',
                    label: "Beranda",
                  ),
                  _buildAnimatedNavItem(
                    index: 1,
                    inactiveIcon: 'assets/belajar-inactive.svg',
                    activeIcon: 'assets/belajar-active.svg',
                    label: "Belajar",
                  ),
                  _buildAnimatedNavItem(
                    index: 2,
                    inactiveIcon: 'assets/cari-tutor-inactive.svg',
                    activeIcon: 'assets/cari-tutor-active.svg',
                    label: "Cari Tutor",
                  ),
                  _buildAnimatedNavItem(
                    index: 3,
                    inactiveIcon: 'assets/daftar-kelas-inactive.svg',
                    activeIcon: 'assets/daftar-kelas-active.svg',
                    label: "Daftar Kelas",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildAnimatedNavItem({
    required int index,
    required String inactiveIcon,
    required String activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(inactiveIcon, width: 24.w),
      activeIcon: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return SizedBox(
            width: 60.w,
            child: Padding(
              padding: EdgeInsets.only(top: 4.h * _animation.value),
              child: SvgPicture.asset(activeIcon, width: 24.w),
            ),
          );
        },
      ),
      label: label,
    );
  }
}
