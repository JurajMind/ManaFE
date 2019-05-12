import 'package:app/components/PipeAccesory/pipe_accesory_list_item.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class BrandPage extends StatefulWidget {
  final BrandGroup brand;
  final String type;
  const BrandPage({Key key, this.brand, this.type}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _BrandPageState();
  }
}

class _BrandPageState extends State<BrandPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  FocusNode _focusNode = new FocusNode();
  Widget build(BuildContext context) {
    final gearBloc = DataProvider.getData(context).gearBloc;
    return new SafeArea(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          flexibleSpace: Container(),
          title: Hero(
              tag: '${widget.brand.name}_${widget.type}_brand_picture',
              child: Text(widget.brand.name)),
          centerTitle: true,
        ),
        StreamBuilder<List<PipeAccesorySimpleDto>>(
            stream: gearBloc.brandAccesory,
            builder: (data, snapshot) {
              return snapshot.data != null
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => PipeAccesoryListItem(
                              pipeAccesory: snapshot.data[index]),
                          childCount: snapshot.data.length),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => PipeAccesoryListItemShimmer(),
                          childCount: widget.brand.itemCount),
                    );
            })
      ],
    ));
  }
}
