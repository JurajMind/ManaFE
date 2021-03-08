import 'package:app/components/Brands/brand_list_item.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/general/gear_bloc.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:queries/collections.dart';

class BrandSelectPage extends StatefulWidget {
  final GearBloc bloc;
  BrandSelectPage(this.bloc, {Key key}) : super(key: key);

  _BrandSelectPageState createState() => _BrandSelectPageState();
}

class _BrandSelectPageState extends State<BrandSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context).text("gear.select_brand").toUpperCase()),
        centerTitle: true,
      ),
      body: PageView(
        children: <Widget>[
          BrandTypeSelect(
            "Tobacco",
            right: true,
            bloc: widget.bloc,
          ),
          BrandTypeSelect(
            "Hookah",
            right: true,
            left: true,
            bloc: widget.bloc,
          ),
          BrandTypeSelect(
            "Bowl",
            right: true,
            left: true,
            bloc: widget.bloc,
          ),
          BrandTypeSelect(
            "HeatManagement",
            displayType: "hmd",
            right: true,
            left: true,
            bloc: widget.bloc,
          ),
          BrandTypeSelect(
            "Coal",
            left: true,
            bloc: widget.bloc,
          ),
          // NewBrandTypeSelect()
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context).text("gear.add_new_brand").toUpperCase()),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                    decoration: new InputDecoration(
                      labelText: AppTranslations.of(context).text("gear.enter_new_brand_name"),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(color: Colors.white, width: 3.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(color: Colors.white, width: 3.0),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            OutlineButton.icon(
              icon: Icon(Icons.save),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.white, width: 1),
              label: Text(AppTranslations.of(context).text("gear.use_new_brand")),
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
      ),
    );
  }
}

class BrandTypeSelect extends StatefulWidget {
  final bool left;
  final bool right;
  final String type;
  final String displayType;
  final dynamic bloc;
  const BrandTypeSelect(
    this.type, {
    Key key,
    this.left,
    this.right,
    this.displayType,
    this.bloc,
  }) : super(key: key);

  @override
  _BrandTypeSelectState createState() => _BrandTypeSelectState();
}

class _BrandTypeSelectState extends State<BrandTypeSelect> {
  String searchString = "";
  bool searchMode = false;
  var textController = new TextEditingController();
  String display;

  @override
  initState() {
    if (widget.displayType != null) {
      display = widget.displayType;
    } else {
      display = widget.type;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        !searchMode
            ? Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => setState(() {
                      searchMode = true;
                    }),
                  ),
                  if (widget.left ?? false) Icon(Icons.chevron_left),
                  SizedBox(
                    width: 40,
                  ),
                  Container(height: 40, width: 40, child: Extensions.defaultTypePicture(widget.type)),
                  Container(
                    height: 40,
                    width: 40,
                  ),
                  Text(
                    AppTranslations.of(context).text("gear.$display"),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  if (widget.right ?? false) Icon(Icons.chevron_right)
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.search),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      autofocus: true,
                      controller: textController,
                      onChanged: (data) {
                        setState(() {
                          this.searchString = data;
                        });
                      },
                      decoration: InputDecoration(hintText: 'Search', border: InputBorder.none, labelStyle: Theme.of(context).textTheme.headline4),
                    ),
                  )),
                  Flexible(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () => setState(() {
                              this.searchString = "";
                              textController.text = "";
                              searchMode = false;
                            }),
                          ))),
                ],
              ),
        Expanded(
          child: StreamBuilder<List<BrandGroup>>(
              stream: widget.bloc.getBrandsByType(widget.type),
              initialData: null,
              builder: (context, snapshot) {
                if (snapshot?.data == null) return Container();
                var data = snapshot.data;
                if (data != null && this.searchString != "") {
                  var dataCollection = Collection(data);
                  data = dataCollection.where$1((a, _) => a.name.toUpperCase().contains(this.searchString.toUpperCase())).toList();
                }

                if (data.length == 0) {
                  return Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: AppTranslations.of(context).text("gear.no_result_1"),
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(text: searchString, style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: AppTranslations.of(context).text("gear.no_result_2"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      InkWell(
                        onTap: () {
                          addNewBrand(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: AppTranslations.of(context).text("gear.no_result_3"),
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(text: searchString, style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: ' as new brand'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Icon(
                              Icons.add,
                              size: 40,
                            )
                          ],
                        ),
                      )
                    ],
                  ));
                }

                return ListView.builder(
                  itemCount: data.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= data.length)
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () => addNewBrand(context),
                          leading: Icon(Icons.add),
                          title: Text('Not found what you were looking for?'),
                          subtitle: Row(
                            children: <Widget>[
                              Icon(Icons.add),
                              Text('Add new brand'),
                            ],
                          ),
                        ),
                      );

                    var brand = data[index];
                    return BrandListItem(
                      brand: brand,
                      brandType: widget.type,
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

  void addNewBrand(BuildContext context) {
    Navigator.of(context).push<BrandGroup>(MaterialPageRoute(builder: (context) => NewBrandTypeSelect(), fullscreenDialog: true)).then((newGear) {
      if (newGear != null) Navigator.of(context).pop(newGear);
    });
  }
}
