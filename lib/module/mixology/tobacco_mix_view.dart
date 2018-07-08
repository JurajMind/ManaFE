import 'package:app/models/tobacco_mix.dart';
import 'package:app/module/mixology/tobacco_mix_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TobaccoMixPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Contacts"),
        ),
        body: new TobaccoMixList());
  }
}

class TobaccoMixList extends StatefulWidget {
  TobaccoMixList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _TobaccoMixState();
}

class _TobaccoMixState extends State<TobaccoMixList>
    implements TobaccoMixListViewContract {
  TobacoMixListPresenter _presenter;

  List<TobaccoMix> _tomaccoMix;

  @override
  void initState() {
    super.initState();   
    _presenter.loadTobaccoMix();
  }

    @override
  void onLoadContactsComplete(List<TobaccoMix> items) {

    setState(() {
      _tomaccoMix = items;    
    });

  }

  @override
  Widget build(BuildContext context) {
  
  }

  @override
  void onLoadContactsError() {
    // TODO: implement onLoadContactsError
  }
}
