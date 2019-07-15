import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PipeAccesoryPage extends StatefulWidget {
  final PipeAccesorySimpleDto pipeAccesory;

  const PipeAccesoryPage({Key key, this.pipeAccesory}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _PipeAccesoryPageState();
  }
}

class _PipeAccesoryPageState extends State<PipeAccesoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          flexibleSpace: Container(),
          actions: <Widget>[],
          title: Hero(
              tag: '${widget.pipeAccesory.id}_name',
              child: Text(widget.pipeAccesory.name)),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Text(widget.pipeAccesory.brand)),
          centerTitle: true,
        ),
        SliverList(
          delegate: new SliverChildListDelegate(<Widget>[Placeholder()]),
        )
      ],
    ));
  }
}
