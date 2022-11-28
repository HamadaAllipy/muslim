import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/app/functions.dart';
import 'package:muslim/feature/main/domain/entities/surah.dart';
import 'package:muslim/feature/main/domain/entities/verse.dart';
import 'package:quran/quran.dart' as quran;

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<GetAllSurahsEvent>(_onGetAllSurahs);
    on<GetAllVersesForSurahEvent>(_onGetAllVersesForSurah);
    on<AddVerseToArchiveEvent>(_onAddVerseToArchive);
  }

  List<Surah> surah = [];
  List<Verse> versesArchive = [];
  List<String> listOfVerses = [];
  int verseCount = 0;
  int? index;
  int surahNumber = 0;

  String surahName = '';

   ScrollController controller = ScrollController();

  FutureOr<void> _onGetAllSurahs(
      GetAllSurahsEvent event, Emitter<MainState> emit) {
    for (int i = 1; i <= 114; i++) {
      surah.add(Surah(
          name: quran.getSurahNameArabic(i),
          countOfSurah: i,
          countOfVerses: quran.getVerseCount(i),
          place: getPlaceArabic(quran.getPlaceOfRevelation(i))));
    }
    emit(GetAllSurahsSuccessState());
  }


  FutureOr<void> _onGetAllVersesForSurah(GetAllVersesForSurahEvent event, Emitter<MainState> emit) {

    surahNumber = event.surahNumber;
    List<int> pagesCount = quran.getSurahPages(surahNumber);
    surahName = quran.getSurahNameArabic(surahNumber);
    verseCount = quran.getVerseCount(surahNumber);

    for(var pageNumber in pagesCount){
      listOfVerses.addAll(quran.getVersesTextByPage(pageNumber));
    }
    emit(GetAllVersesForSurahSuccessState());
  }


  void clear(){
    index = null;
    listOfVerses = [];
    surahName = '';
    verseCount = 0;
  }

  FutureOr<void> _onAddVerseToArchive(AddVerseToArchiveEvent event, Emitter<MainState> emit) {

    versesArchive.add(event.verse);
    emit(AddVerseToArchiveSuccessState());
  }
}
