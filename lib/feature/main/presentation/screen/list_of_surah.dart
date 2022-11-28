import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/app/functions.dart';
import 'package:muslim/core/values/app_strings.dart';
import 'package:muslim/feature/main/presentation/components/surah_item.dart';
import 'package:muslim/feature/main/presentation/controller/main_bloc.dart';

class ListOfSurah extends StatelessWidget {
  const ListOfSurah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current){
          return previous is GetAllSurahsSuccessState || current is GetAllSurahsSuccessState;
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: bloc.surah.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return SurahItem(surah: bloc.surah[index],);
            },
          );
        },
      ),
    );
  }
}
