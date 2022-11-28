import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/feature/main/presentation/components/verse_item.dart';
import 'package:muslim/feature/main/presentation/controller/main_bloc.dart';

class Archives extends StatelessWidget {
  const Archives({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return ReorderableListView.builder(
          itemCount: bloc.versesArchive.length,
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            var item = bloc.versesArchive.removeAt(oldIndex);
            bloc.versesArchive.insert(newIndex, item);
          },
          itemBuilder: (_, index) {
            return VerseItem(
              verse: bloc.versesArchive[index], key: Key('$index'),);
          },
        );
      },
    );
  }
}
