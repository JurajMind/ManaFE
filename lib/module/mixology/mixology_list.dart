import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/mixology/mixology_slice.dart';
import 'package:flutter/material.dart';

abstract class MainPage {}

class MixologyList extends StatelessWidget {
  static const _loadingSpace = 10;

  @override
  Widget build(BuildContext context) {
    final mixologyBloc = DataProvider.getMixology(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: AppBar(
              title: Text('Mixology'),
              backgroundColor: Colors.transparent,
            ),
          ),
          new Expanded(
            child: buildListView(mixologyBloc),
          )
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
      return Center(child: Container());
    }

    return MixCardExpanded(tobaccoMix: mix);
  }

  SingleChildScrollView _longMix(TobaccoMix mix) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _createTobaccoRow(mix)),
    );
  }
}
