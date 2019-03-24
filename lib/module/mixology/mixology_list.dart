import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/mixology/mixology_slice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class MainPage {}

class MixologyList extends StatelessWidget {
  static const _loadingSpace = 10;

  @override
  Widget build(BuildContext context) {
    final mixologyBloc = DataProvider.getMixology(context);

    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      child: Column(
        children: <Widget>[
          SizedBox(
              height: 200.0, width: 200.0, child: buildListView(mixologyBloc)),
        ],
      ),
    );
  }

  StreamBuilder<MixologySlice> buildListView(MixologyBloc mixologyBloc) {
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

  List<Widget> _createTobaccoRow(TobaccoMix mix) {
    return mix.tobaccos.map((item) {
      return new Column(
        children: <Widget>[
          Text(item.item2.toString() + 'g',
              style: TextStyle(color: Colors.grey)),
          Text(
            item.item1.name,
            style:
                new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            item.item1.brand,
            style: TextStyle(color: Colors.black),
          ),
        ],
      );
    }).toList();
  }

  Widget _createMixBloc(int index, MixologySlice data,
      MixologyBloc mixologyBloc, BuildContext context) {
    mixologyBloc.index.add(index);
    TobaccoMix mix;
    mix = data.elementAt(index);

    if (mix == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              mix.name != null
                  ? Text(mix.name)
                  : Text(
                      'No name',
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: mix.tobaccos.length > 3
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.spaceEvenly,
                  children: _createTobaccoRow(mix)),
            ),
            elevation: 8.0,
            margin: EdgeInsets.zero,
          )
        ],
      ),
    );
  }
}
