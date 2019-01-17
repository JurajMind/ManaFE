import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/mixology/mixology_slice.dart';
import 'package:flutter/material.dart';

abstract class MainPage {}

class MixologyList extends StatefulWidget {

  @override
  MixologyListState createState() {
    return new MixologyListState();
  }
}

class MixologyListState extends State<MixologyList> {
  int curentView = 0;
  static const _loadingSpace = 10;
  static const Map<int, String> labels = {
    0: 'My mixes',
    1: 'Featured mixes',
    2: 'Mixes wizzard'
  };

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                mixTypeSelector(context, 0),
                mixTypeSelector(context, 1),
                mixTypeSelector(context, 2),
              ],
            ),
          );
        });
  }

  InkWell mixTypeSelector(BuildContext context, int index) {
    return InkWell(
      onTap: () {setState(() {
            curentView = index;
          }
          );
          Navigator.of(context).pop();},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(labels[index].toUpperCase(),
            style: Theme.of(context).textTheme.display1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mixologyBloc = DataProvider.getMixology(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: AppBar(
              title: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(labels[curentView]),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () => _showDialog(context),
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
          ),
          new Expanded(
            child: getContent(mixologyBloc),
          )
        ],
      ),
    );
  }

  Widget getContent(MixologyBloc mixologyBloc){
   switch (curentView) {
      case 0:
       return myMixesbuild(mixologyBloc);
      case 1:
        return Placeholder();
      case 2:
        return Placeholder();
    }
     return Placeholder();
  }

  StreamBuilder<MixologySlice> myMixesbuild(MixologyBloc mixologyBloc) {
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
          Text(
            item.item1.name,
            style:
                new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            item.item1.brand,
            style: TextStyle(color: Colors.black),
          ),
          Text(item.item2.toString() + 'g',
              style: TextStyle(color: Colors.grey)),
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
