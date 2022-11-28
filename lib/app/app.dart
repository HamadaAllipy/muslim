import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/theme/light_theme.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/feature/main/presentation/controller/main_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc()..add(GetAllSurahsEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.homeRoute,
        onGenerateRoute: RouteGenerator.generate,
        theme: getLightTheme(),
      ),
    );
  }
}
