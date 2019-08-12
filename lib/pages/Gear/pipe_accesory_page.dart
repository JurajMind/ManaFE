import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PipeAccesoryPage extends StatefulWidget {
  final PipeAccesorySimpleDto pipeAccesory;
  final int pipeAccesoryId;

  const PipeAccesoryPage({Key key, this.pipeAccesory, this.pipeAccesoryId})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _PipeAccesoryPageState();
  }
}

class _PipeAccesoryPageState extends State<PipeAccesoryPage> {
  PipeAccesorySimpleDto pipeAccesory;
  @override
  void initState() {
    if (widget.pipeAccesory == null) {
      App.http.getGearInfo(widget.pipeAccesoryId).then((g) => setState(() {
            pipeAccesory = g;
          }));
    } else {
      pipeAccesory = widget.pipeAccesory;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (pipeAccesory == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return new SafeArea(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          flexibleSpace: Container(),
          actions: <Widget>[],
          title: Hero(
              tag: '${pipeAccesory.id}_name', child: Text(pipeAccesory.name)),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Text(pipeAccesory.brand)),
          centerTitle: true,
        ),
        SliverList(
          delegate: new SliverChildListDelegate(<Widget>[Placeholder()]),
        )
      ],
    ));
  }
}
