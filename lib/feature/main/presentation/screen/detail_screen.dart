import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim/app/functions.dart';
import 'package:muslim/core/utils/app_style.dart';
import 'package:muslim/core/values/app_assets.dart';
import 'package:muslim/core/values/app_color.dart';
import 'package:muslim/core/values/app_fonts.dart';
import 'package:muslim/feature/main/domain/entities/verse.dart';
import 'package:muslim/feature/main/presentation/controller/main_bloc.dart';
import 'package:quran/quran.dart' as quran;

class DetailScreen extends StatelessWidget {

  final ScrollController controller;
  const DetailScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = context.read<MainBloc>();

    const snackBar = SnackBar(
      content: Text(
        'تم حفظ الايه',
        textAlign: TextAlign.end,
      ),
    );



    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title:  Text(
            bloc.surahName,
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
            bloc.clear();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),


      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: SizedBox(
            width: double.infinity,
            child: RichText(
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              text: TextSpan(
                style: const TextStyle(
                  color: AppColor.black,
                  fontFamily: FontFamily.urwDinArabic,
                  height: 1.7,
                  fontSize: 26,
                ),
                children: [
                  for(int i = 0 ; i < bloc.listOfVerses.length; i++)...[
                    TextSpan(
                      text: bloc.listOfVerses[i],
                      style: TextStyle(
                        color: i == bloc.index ?Colors.red:null
                      ),
                      recognizer: LongPressGestureRecognizer()..onLongPress = (){

                        final verse = Verse(
                          verseText: bloc.listOfVerses[i],
                          fromSurah: bloc.surahName,
                          numberOfVerse: bloc.verseCount,
                          index: i,
                          surahNumber: bloc.surahNumber,
                          offset: controller.offset,
                        );

                        bloc.add(AddVerseToArchiveEvent(verse));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                    ),
                    TextSpan(
                      text: quran.getVerseEndSymbol(i + 1),
                      recognizer: LongPressGestureRecognizer()..onLongPress = (){
                        printLog('Test ');
                      },
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'ArabicTwo',
                      ),
                    ),
                  ],

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
