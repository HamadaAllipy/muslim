part of 'main_bloc.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class GetAllSurahsSuccessState extends MainState {}
class GetAllVersesForSurahSuccessState extends MainState {}
class AddVerseToArchiveSuccessState extends MainState {}

