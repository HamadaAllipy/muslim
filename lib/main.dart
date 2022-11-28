import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/app/app.dart';
import 'package:muslim/core/utils/app_bloc_observer.dart';

void main(){


  // set bloc observer for app
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}