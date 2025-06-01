import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tutee/models/program_belajar_model.dart';
import 'package:tutee/presentation/styles/color.dart';
import 'package:tutee/presentation/styles/text.dart';

class ProgramBelajarScreen extends StatefulWidget {
  const ProgramBelajarScreen({super.key});

  @override
  _ProgramBelajarScreenState createState() => _ProgramBelajarScreenState();
}

class _ProgramBelajarScreenState extends State<ProgramBelajarScreen> {
  TextEditingController _searchController = TextEditingController();
  List<ProgramBelajar> _filteredPrograms = DummyData.programBelajarList;
  List<ModulData> _searchResults = [];
  bool _showSearchResults = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _filteredPrograms = DummyData.programBelajarList;
        _showSearchResults = false;
        _searchResults = [];
      });
    } else {
      // Search in program names
      List<ProgramBelajar> filteredPrograms =
          DummyData.programBelajarList
              .where((program) => program.nama.toLowerCase().contains(query))
              .toList();

      // Search in modules
      List<ModulData> searchResults = [];
      for (var program in DummyData.programBelajarList) {
        var modules = DummyData.getModulesForProgram(program.id);
        for (var module in modules) {
          if (module.judul.toLowerCase().contains(query) ||
              module.konten.toLowerCase().contains(query)) {
            searchResults.add(module);
          }
        }
      }

      setState(() {
        _filteredPrograms = filteredPrograms;
        _searchResults = searchResults;
        _showSearchResults = searchResults.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 20.h),
            _buildSearchBar(),
            SizedBox(height: 20.h),
            _buildRuangBelajarButton(),
            SizedBox(height: 20.h),
            Expanded(
              child:
                  _showSearchResults
                      ? _buildSearchResults()
                      : _buildProgramGrid(),
            ),
          ],
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
            'Program Belajar',
            style: TextStyles.heading3(color: ColorStyles.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: ColorStyles.neutral200,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Cari Materi',
            hintStyle: TextStyles.body2(color: ColorStyles.primary500),
            contentPadding: EdgeInsets.symmetric(vertical: 15.h),
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: ColorStyles.primary500,
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRuangBelajarButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: () {
          context.push('/ruang-belajar');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: BoxDecoration(
            border: Border.all(color: ColorStyles.primary500),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ruang Belajar',
                style: TextStyles.body1(
                  weight: FontWeightOption.semiBold,
                  color: ColorStyles.primary500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: ColorStyles.primary500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Hasil Pencarian',
            style: TextStyles.heading4(
              weight: FontWeightOption.semiBold,
              color: ColorStyles.secondary500,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              final module = _searchResults[index];
              return Container(
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: ColorStyles.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: ColorStyles.neutral200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pemrograman Website',
                      style: TextStyles.heading4(
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                    Container(
                      height: 2.h,
                      width: double.infinity,
                      color: ColorStyles.secondary500,
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                    ),
                    Text(
                      'Modul 1 : ${module.judul}',
                      style: TextStyles.body1(
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'HTML atau Hypertext Markup Language adalah sebuah bahasa markup yang digunakan untuk membuat sebuah halaman web. Meskipun sering diartikan sebagai bahasa pemrograman dasar yang digunakan untuk membuat sebuah web, HTML ...',
                      style: TextStyles.body2(color: ColorStyles.neutral600),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProgramGrid() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 1.2,
      ),
      itemCount: _filteredPrograms.length,
      itemBuilder: (context, index) {
        final program = _filteredPrograms[index];
        return GestureDetector(
          onTap: () {
            if (program.isActive) {
              context.push('/kelas-saat-ini', extra: program);
            } else {
              context.push('/ruang-belajar');
            }
          },
          child: SvgPicture.asset(program.icon, width: 148.w, height: 69.h),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
