import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/core/utils/app_style.dart';
import 'package:muslim/core/values/app_color.dart';
import 'package:muslim/core/values/app_fonts.dart';
import 'package:muslim/core/values/app_strings.dart';
import 'package:muslim/feature/main/domain/entities/verse.dart';
import 'package:muslim/feature/main/presentation/controller/main_bloc.dart';

class VerseItem extends StatelessWidget {

  final Verse verse;
  const VerseItem({Key? key, required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = context.read<MainBloc>();
    return InkWell(
      onTap: (){
        bloc.index = verse.index;
        context.read<MainBloc>().add(GetAllVersesForSurahEvent(verse.surahNumber));
        Navigator.of(context).pushNamed(AppRoutes.detailRoute,arguments: ScrollController(initialScrollOffset: verse.offset));
      },
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 0.0,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      verse.verseText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(fontSize: FontSize.s18,color: AppColor.black,),

                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.surah,
                          style: getRegularStyle(
                            color: AppColor.gray,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        Text(
                          verse.fromSurah,
                          style: getRegularStyle(
                            color: AppColor.gray,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          AppStrings.numberOfVerse,
                          style: getRegularStyle(
                            color: AppColor.gray,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        Text(
                          verse.numberOfVerse.toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}
