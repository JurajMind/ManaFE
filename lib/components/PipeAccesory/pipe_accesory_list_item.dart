import 'package:app/models/extensions.dart';
import 'package:app/pages/Gear/pipe_accesory_page.dart';
import 'package:app/pages/Gear/tobacco_page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:shimmer/shimmer.dart';

class PipeAccesoryListItem extends StatelessWidget {
  final PipeAccesorySimpleDto pipeAccesory;
  const PipeAccesoryListItem({
    Key key,
    this.pipeAccesory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
        onTap: () => Navigator.of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) {
              return pipeAccesory.type == "Tobacco" ? TobaccoPage(tobacco: pipeAccesory) : PipeAccesoryPage(pipeAccesory: pipeAccesory);
            })),
        trailing: Icon(Icons.chevron_right),
        leading: SizedBox(
            height: 60.0,
            width: 60.0,
            child: Extensions.accesoryPicture(pipeAccesory)),
        title: Hero(
          tag: '${pipeAccesory.id}_name',
          child: Text(this.pipeAccesory.name,
              style: Theme.of(context).textTheme.display2),
        ),
        subtitle: Text(pipeAccesory.brand,
            style: Theme.of(context).textTheme.display3),
      ),
    );
  }
}

class PipeAccesoryListItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400],
      highlightColor: Colors.white,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          leading: SizedBox(
              height: 60.0,
              width: 60.0,
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              )),
          title: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      height: 16.0,
                      width: 20.0,
                      decoration: BoxDecoration(color: Colors.white))),
              Expanded(flex: 1, child: Container())
            ],
          ),
          subtitle: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 12.0,
                    width: 20.0,
                    decoration: BoxDecoration(color: Colors.white),
                  )),
              Expanded(flex: 4, child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
