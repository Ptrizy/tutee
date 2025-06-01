import 'package:go_router/go_router.dart';
import 'package:tutee/models/program_belajar_model.dart';
import 'package:tutee/presentation/routers/name.dart';
import 'package:tutee/presentation/routers/path.dart';
import 'package:tutee/presentation/screens/main/beranda/beranda_screen.dart';
import 'package:tutee/presentation/screens/main/beranda/kelas_saat_ini_screen.dart';
import 'package:tutee/presentation/screens/main/beranda/modul_screen.dart';
import 'package:tutee/presentation/screens/main/beranda/program_belajar_screen.dart';
import 'package:tutee/presentation/screens/main/beranda/ruang_belajar_screen.dart';
import 'package:tutee/presentation/screens/main/main_view.dart';
import 'package:tutee/presentation/screens/splash_screen.dart';

final router = GoRouter(
  initialLocation: RoutePath.splashPage,
  routes: [
    GoRoute(
      path: RoutePath.splashPage,
      name: RouteName.splashPage,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePath.mainPage,
      name: RouteName.mainPage,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: RoutePath.berandaPage,
      name: RouteName.berandaPage,
      builder: (context, state) => BerandaScreen(),
    ),
    GoRoute(
      path: '/program-belajar',
      name: 'program-belajar',
      builder: (context, state) => ProgramBelajarScreen(),
    ),
    GoRoute(
      path: '/ruang-belajar',
      name: 'ruang-belajar',
      builder: (context, state) => RuangBelajarScreen(),
    ),
    GoRoute(
      path: '/kelas-saat-ini',
      name: 'kelas-saat-ini',
      builder: (context, state) {
        final program = state.extra as ProgramBelajar;
        return KelasSaatIniScreen(program: program);
      },
    ),
    GoRoute(
      path: '/modul',
      name: 'modul',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        return ModulScreen(args: args);
      },
    ),
  ],
);
