part of 'main_bloc.dart';

abstract class MainEvent {}

class GetAllSurahsEvent extends MainEvent {}
class GetAllVersesForSurahEvent extends MainEvent {
  final int surahNumber;

  GetAllVersesForSurahEvent(this.surahNumber);
}


class AddVerseToArchiveEvent extends MainEvent {
  final Verse verse;

  AddVerseToArchiveEvent(this.verse);
}


