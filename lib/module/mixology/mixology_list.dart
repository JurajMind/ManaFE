import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/mixology/mixology_slice.dart';
import 'package:flutter/material.dart';

class MixologyList extends StatelessWidget {
  static const _loadingSpace = 10;

  @override
  Widget build(BuildContext context) {
    final mixologyBloc = DataProvider.getMixology(context);

    return StreamBuilder<MixologySlice>(
      stream: mixologyBloc.slice,
      initialData: MixologySlice.empty(),
      builder: (context, snapshot) => ListView.builder(
            itemCount: snapshot.data.endIndex + _loadingSpace,
            itemBuilder: (context, index) =>
                _createMixBloc(index, snapshot.data, mixologyBloc, context),
          ),
    );
  }

  Widget _createMixBloc(int index, MixologySlice data,
      MixologyBloc mixologyBloc, BuildContext context) {
    mixologyBloc.index.add(index);
    var mix;
    mix = data.elementAt(index);

    if (mix == null) {
      return Center(child: CircularProgressIndicator());
    }

    return new ListTile(
      title: Card(
        margin: EdgeInsets.zero,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Color.fromRGBO(2, 18, 37, 0.8),
                  child: FlutterLogo(
                    size: 200.0,
                  ),
                  elevation: 8.0,
                  margin: EdgeInsets.zero,
                ),
                Icon(
                  Icons.play_circle_outline,
                  size: 64.0,
                  color: Color.fromRGBO(27, 41, 58, 24.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
