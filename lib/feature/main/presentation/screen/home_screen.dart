import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim/app/functions.dart';
import 'package:muslim/core/utils/app_style.dart';
import 'package:muslim/core/values/app_assets.dart';
import 'package:muslim/core/values/app_fonts.dart';
import 'package:muslim/core/values/app_strings.dart';
import 'package:muslim/feature/main/presentation/components/surah_item.dart';
import 'package:muslim/feature/main/presentation/controller/main_bloc.dart';
import 'package:muslim/feature/main/presentation/screen/archives.dart';
import 'package:muslim/feature/main/presentation/screen/list_of_surah.dart';
import 'package:quran/quran.dart' as quran;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            body: Column(
              children: [
                _getTopWidget(),
                const Expanded(
                  child: TabBarView(
                    children: [
                      ListOfSurah(),
                      Archives(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTopWidget() {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            AppImages.backgroundAppBar,
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              AppStrings.holyQuran,
              style: getBoldStyle(fontSize: FontSize.s18),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: getMediumStyle(
                fontSize: FontSize.s14,
              ),
              tabs: const [
                Tab(
                  text: AppStrings.surahs,
                ),
                Tab(
                  text: AppStrings.archives,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
