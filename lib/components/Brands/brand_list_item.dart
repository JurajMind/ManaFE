import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Gear/brand_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrandListItem extends StatelessWidget {
  final BrandGroup brand;
  final String brandType;
  const BrandListItem({
    Key key,
    this.brand,
    this.brandType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
        onTap: () {
          final gearBloc = DataProvider.getData(context).gearBloc;
          gearBloc.loadBrandAccesory(brand.name, brandType ?? "Tobacco");
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) {
            return new BrandPage(
              brand: brand,
              type: brandType,
            );
          }));
        },
        trailing: Icon(Icons.chevron_right),
        leading: SizedBox(
            height: 60.0,
            width: 60.0,
            child: Hero(
                tag: '${brand.name}_${brandType}_brand_picture',
                child: Extensions.brandPicture(brand))),
        title:
            Text(this.brand.name, style: Theme.of(context).textTheme.display2),
        subtitle: Text('Item count: ' + brand.itemCount.toString(),
            style: Theme.of(context).textTheme.display3),
      ),
    );
  }
}

class BrandListItemShimmer extends StatelessWidget {
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
