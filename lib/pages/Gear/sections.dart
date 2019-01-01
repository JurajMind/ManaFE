// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Raw data for the animation demo.

import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/module/general/gear_bloc.dart';
import 'package:app/pages/Gear/widgets.dart';
import 'package:flutter/material.dart';

const Color _mariner = Color(0xFF3B5F8F);
const Color _mediumPurple = Color(0xFF8266D4);
const Color _tomato = Color(0xFFF95B57);
const Color _mySin = Color(0xFFF3A646);

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class SectionDetail {
  const SectionDetail({
    this.title,
    this.subtitle,
    this.imageAsset,
    this.imageAssetPackage,
  });
  final String title;
  final String subtitle;
  final String imageAsset;
  final String imageAssetPackage;
}

class Section {
  const Section(
      {this.title,
      this.backgroundAsset,
      this.backgroundAssetPackage,
      this.leftColor,
      this.rightColor,
      this.child,
      this.children,
      this.scrollController});
  final String title;
  final String backgroundAsset;
  final String backgroundAssetPackage;
  final Color leftColor;
  final Color rightColor;
  final Widget child;
  final List<Widget> children;
  final ScrollController scrollController;

  @override
  bool operator ==(Object other) {
    if (other is! Section) return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

List<Section> getAllSections(GearBloc bloc, ScrollPhysics physics,
    Map<int, ScrollController> controllers) {
  return <Section>[
    const Section(
        title: 'MY GEAR',
        leftColor: _mediumPurple,
        rightColor: _mariner,
        backgroundAsset: 'images/gear/mygear.jpg',
        backgroundAssetPackage: _kGalleryAssetsPackage,
        child: Placeholder()),
    Section(
        title: 'TOBACCO',
        leftColor: _tomato,
        rightColor: _mediumPurple,
        backgroundAsset: 'images/gear/tobacco.jpg',
        backgroundAssetPackage: _kGalleryAssetsPackage,
        child: ListView(
            physics: physics,
            controller: controllers[1],
            children: List.generate(100, (int index) {
              return new ListTile(
                title: new Text(index.toString()),
              );
            }))),
    const Section(
      title: 'HOOKAH',
      leftColor: _mySin,
      rightColor: _tomato,
      backgroundAsset: 'images/gear/hookah.jpg',
      backgroundAssetPackage: _kGalleryAssetsPackage,
    ),
    const Section(
        title: 'BOWLS',
        leftColor: Colors.white,
        rightColor: _tomato,
        backgroundAsset: 'images/gear/bowls.jpg',
        backgroundAssetPackage: _kGalleryAssetsPackage),
    const Section(
        title: 'HEAT MANAGEMENT',
        leftColor: Colors.blueAccent,
        rightColor: Colors.blue,
        backgroundAsset: 'images/gear/hms.jpg',
        backgroundAssetPackage: _kGalleryAssetsPackage),
    const Section(
        title: 'COALS',
        leftColor: Colors.black,
        rightColor: Colors.red,
        backgroundAsset: 'images/gear/coals.jpg',
        backgroundAssetPackage: _kGalleryAssetsPackage),
  ];
}
