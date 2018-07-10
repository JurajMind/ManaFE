import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/mixology/mixology_slice.dart';
import 'package:flutter/material.dart';

class MixologyList extends StatelessWidget {
  static const _loadingSpace = 40;

  static const _listDelegate =
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1);

  @override
  Widget build(BuildContext context) {
    final mixologyBloc = DataProvider.of(context);

    return StreamBuilder<MixologySlice>(
      stream: mixologyBloc.slice,
      initialData: MixologySlice.empty(),
      builder: (context, snapshot) => GridView.builder(
            gridDelegate: _listDelegate,
            itemCount: snapshot.data.endIndex + _loadingSpace,
            itemBuilder: (context, index) =>
                _createMixBloc(index, snapshot.data, mixologyBloc),
          ),
    );
  }

  Widget _createMixBloc(
      int index, MixologySlice data, MixologyBloc mixologyBloc) {
    mixologyBloc.index.add(index);
    final mix = data.elementAt(index);

    if (mix == null) {
      return Center(child: CircularProgressIndicator());
    }


    return Row(children: <Widget>[
      mix.name == null ? Placeholder(fallbackWidth: 20.0,) : Text(mix.name),
    ]);
  }
}
