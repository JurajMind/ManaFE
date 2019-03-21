import 'dart:io';

import 'package:app/components/LikeButton/like_button.dart';
import 'package:app/components/Places/card_more_widget.dart';
import 'package:app/components/Places/card_widget.dart';
import 'package:app/components/Places/home_page_custom_shape.dart';
import 'package:flutter/material.dart';
import 'package:app/const/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewPlacePage extends StatefulWidget {
  @override
  NewPlacePageState createState() {
    return new NewPlacePageState();
  }
}

class NewPlacePageState extends State<NewPlacePage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _tabController;
  PageController _pageController;
  GoogleMapController _mapController;
  int _tabbarIndex = 0;
  String _selectedLocation = "Istanbul, TR";
  bool selectedColor = true;

  bool showMaps = false;

  List<String> _location = ["Newyork, NY", "Dubai", "Istanbul, TR"];
  @override
  void initState() {
    setState(() {
      showMaps = true;
    });
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: _tabbarIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: new SizedBox(
        height: 55,
      ),
      endDrawer: Stack(
        children: <Widget>[
          Theme(
            data: ThemeData(canvasColor: Colors.transparent),
            child: Container(
              width: 80,
              height: 150,
              child: Drawer(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      width: 80,
                      height: 75,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      height: 75,
                      width: 80,
                      child: Icon(
                        Icons.contact_phone,
                        color: Colors.white,
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 42,
            top: -10,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: _media.width,
                height: _media.height,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Stack(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            buildHeaderStack(_media),
                            buildHomeMainContainer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                width: _media.width,
                height: _media.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: _media.height,
                      width: double.infinity,
                      child: showMaps
                          ? GoogleMap(
                              compassEnabled: true,
                              initialCameraPosition: CameraPosition(
                                bearing: 10,
                                zoom: 15,
                                target: LatLng(10, 10),
                              ),
                              onMapCreated: (controller) {
                                setState(() {
                                  _mapController = controller;
                                });
                              },
                            )
                          : Container(),
                    ),
                    Container(
                      child: Positioned(
                        width: _media.width,
                        height: 280,
                        bottom: 0,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _mapController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: LatLng(
                                        41.08738144641038,
                                        28.788369297981262,
                                      ),
                                      zoom: 15.0,
                                      tilt: 60.0,
                                      bearing: 160,
                                    ),
                                  ),
                                );
                                print("tpped");
                              },
                              child: Container(
                                child: CardListWidget(
                                    heartIcon: LikeButton(
                                      width: 70,
                                    ),
                                    foodDetail: "Desert - Fast Food - Alcohol",
                                    foodName: "Cafe De Perks",
                                    vote: 4.5,
                                    foodTime: "15-30 min",
                                    image: ""),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _mapController == null ? null : _mapController;
                                _mapController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: LatLng(
                                        41.05612003462361,
                                        28.72148036956787,
                                      ),
                                      zoom: 15.0,
                                      tilt: 80.0,
                                      bearing: 160,
                                    ),
                                  ),
                                );
                                print("tpped");
                              },
                              child: CardListWidget(
                                heartIcon: LikeButton(
                                  width: 70,
                                ),
                                foodDetail: "Desert - Fast Food - Alcohol",
                                foodName: "Cafe De Istanbul",
                                vote: 4.5,
                                foodTime: "15-60 min",
                                image: "",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    buildHeaderStack(_media),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stack buildHeaderStack(Size _media) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: Platform.isIOS ? 200 : 150,
            width: _media.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.blue,
                  AppColors.blueLight,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(
          padding: Platform.isAndroid
              ? EdgeInsets.only(left: 20, top: 30, right: 10)
              : EdgeInsets.only(left: 20, top: 50, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _selectedLocation,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                          FontAwesomeIcons.caretDown,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                  iconSize: 0,
                  items: _location.map((location) {
                    return DropdownMenuItem<String>(
                        value: location,
                        child: Text(
                          location,
                          style: TextStyle(color: Colors.black54, fontSize: 20),
                        ));
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue;
                      print(_selectedLocation);
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.tune,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
              ),
            ],
          ),
        ),
        buildPositionedButtons(),
      ],
    );
  }

  Container buildHomeMainContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 22.0, bottom: 10),
            child: Text(
              "Featured Restaurants in $_selectedLocation",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Container(
              height: 280,
              child: NotificationListener(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 20),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return CardListWidget(
                      heartIcon: LikeButton(
                        key: ObjectKey(index.toString()),
                        width: 70,
                      ),
                      image: "",
                      foodDetail: "Desert - Fast Food - Alcohol",
                      foodName: "Cafe De Perks",
                      vote: 4.5,
                      foodTime: "15-30 min",
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            color: AppColors.gray,
            height: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 22.0, bottom: 10),
            child: Text(
              "More Restaurants in $_selectedLocation",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          CardMoreWidget(
            image: "",
            foodDetail: "Desert - Fast Food - Alcohol",
            foodName: "Cafe De Ankara",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "CLOSE",
            statusColor: Colors.pinkAccent,
            heartIcon: LikeButton(
              width: 70,
            ),
          ),
          CardMoreWidget(
            heartIcon: LikeButton(
              width: 70,
            ),
            image: "",
            foodDetail: "Desert - Fast Food - Alcohol",
            foodName: "Cafe De NewYork",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "OPEN",
            statusColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget buildFloatingActionButton() {
    return GestureDetector(
      onTap: () {
        print("Icon tapped");
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 12),
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blue,
                AppColors.blueLight.withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: AppColors.blue, blurRadius: 12, offset: Offset(0, 5)),
            ]),
        child: Icon(
          IconData(0xe800, fontFamily: "Icons"),
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }

  Positioned buildPositionedButtons() {
    return Positioned(
      bottom: 10,
      left: 40,
      right: 40,
      child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 8,
                spreadRadius: 1,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (_pageController.page.abs() != 0) {
                    _pageController.jumpToPage(0);
                    setState(() {
                      selectedColor = true;
                    });
                  } else {
                    selectedColor = false;
                  }
                },
                child: Text(
                  "List View",
                  style: TextStyle(
                    color: selectedColor ? AppColors.blue : AppColors.gray,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerticalDivider(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_pageController.page.abs() != 1) {
                    _pageController.jumpToPage(1);
                    setState(() {
                      selectedColor = false;
                    });
                  } else {
                    selectedColor = true;
                  }
                },
                child: Text(
                  "Map View",
                  style: TextStyle(
                    color: selectedColor ? AppColors.gray : AppColors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
