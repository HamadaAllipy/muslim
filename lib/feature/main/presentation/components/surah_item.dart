import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/core/utils/app_style.dart';
import 'package:muslim/core/values/app_assets.dart';
import 'package:muslim/core/values/app_color.dart';
import 'package:muslim/core/values/app_fonts.dart';
import 'package:muslim/core/values/app_strings.dart';
import 'package:muslim/feature/main/domain/entities/surah.dart';
import 'package:muslim/feature/main/presentation/controller/main_bloc.dart';

class SurahItem extends StatelessWidget {


  final Surah surah;
  const SurahItem({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.read<MainBloc>().add(GetAllVersesForSurahEvent(surah.countOfSurah));
        Navigator.of(context).pushNamed(AppRoutes.detailRoute,arguments: ScrollController());
      },
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 0.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 20),
                child: SvgPicture.asset(
                  AppImages.quranIcon,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      surah.name,
                      style: getMediumStyle(fontSize: FontSize.s18,color: AppColor.black,),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.numberOfSurah,
                          style: getRegularStyle(
                            color: AppColor.gray,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        Text(
                          surah.countOfSurah.toString(),
                          style: getRegularStyle(
                            color: AppColor.gray,
                            fontSize: FontSize.s16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        surah.place,
                        style: getMediumStyle(fontSize: FontSize.s16,color: AppColor.primaryColor,),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.countOfVerses,
                            style: getRegularStyle(
                              color: AppColor.gray,
                              fontSize: FontSize.s16,
                            ),
                          ),
                          Text(
                            surah.countOfVerses.toString(),
                            style: getRegularStyle(
                              color: AppColor.gray,
                              fontSize: FontSize.s16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
