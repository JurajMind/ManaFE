import 'package:app/components/Brands/brand_list_item.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrandSelectPage extends StatefulWidget {
  BrandSelectPage({Key key}) : super(key: key);

  _BrandSelectPageState createState() => _BrandSelectPageState();
}

class _BrandSelectPageState extends State<BrandSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select brand'),
      ),
      body: PageView(
        children: <Widget>[
          BrandTypeSelect("Tobacco"),
          BrandTypeSelect("Hookah"),
          BrandTypeSelect("Bowl"),
          BrandTypeSelect("HeatManagement"),
          BrandTypeSelect("Coal"),
          NewBrandTypeSelect()
        ],
      ),
    );
  }
}

class NewBrandTypeSelect extends StatefulWidget {
  @override
  _NewBrandTypeSelectState createState() => _NewBrandTypeSelectState();
}

class _NewBrandTypeSelectState extends State<NewBrandTypeSelect> {
  String brandName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.add, size: 40),
              Container(
                height: 40,
                width: 40,
              ),
              Text(
                'New brand',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 200,
                child: TextField(
                  onChanged: (brandName) {
                    setState(() {
                      this.brandName = brandName;
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter new brand name'),
                ),
              ),
            ),
          ),
          OutlineButton.icon(
            icon: Icon(Icons.save),
            label: Text('Use new brand'),
            onPressed: () {
              if (this.brandName == null || this.brandName.length == 0) {
                return;
              }
              var brand = new BrandGroup();
              brand.name = this.brandName;
              Navigator.of(context).pop(brand);
            },
          )
        ],
      ),
    );
  }
}

class BrandTypeSelect extends StatelessWidget {
  final String type;
  const BrandTypeSelect(
    this.type, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).gearBloc;
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 40,
                width: 40,
                child: Extensions.defaultTypePicture(type)),
            Container(
              height: 40,
              width: 40,
            ),
            Text(
              type,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
        Expanded(
          child: StreamBuilder<List<BrandGroup>>(
              stream: bloc.getBrandsByType(type),
              initialData: null,
              builder: (context, snapshot) {
                if (snapshot == null) return Text('test');
                return ListView.builder(
                  itemCount: snapshot?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    var brand = snapshot.data[index];
                    return BrandListItem(
                      brand: brand,
                      brandType: type,
                      ontap: () {
                        Navigator.of(context).pop(brand);
                      },
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
