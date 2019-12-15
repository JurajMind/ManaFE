// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Raw data for the animation demo.

import 'package:app/module/general/gear_bloc.dart';
import 'package:app/pages/Gear/devices.dart';
import 'package:app/pages/Gear/pipe_accesory.dart';
import 'package:app/utils/translations/app_translations.dart';

import 'package:flutter/material.dart';

const Color _mariner = Color(0xFF3B5F8F);
const Color _mediumPurple = Color(0xFF8266D4);
const Color _tomato = Color(0xFFF95B57);
const Color _mySin = Color(0xFFF3A646);

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
  const Section({
    this.title,
    this.backgroundAsset,
    this.leftColor,
    this.rightColor,
    this.type,
  });
  final String title;
  final String backgroundAsset;
  final Color leftColor;
  final Color rightColor;

  final String type;

  @override
  bool operator ==(Object other) {
    if (other is! Section) return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

List<Section> getAllSections(
    int currentView, ValueChanged<int> onViewChanged, BuildContext context) {
  return <Section>[
    Section(
      title: AppTranslations.of(context).text('gear.devices').toUpperCase(),
      leftColor: _mediumPurple,
      rightColor: _mariner,
      backgroundAsset: 'images/gear/mygear.jpg',
      type: "Device",
    ),
    Section(
      title: AppTranslations.of(context).text('gear.tobacco').toUpperCase(),
      leftColor: _tomato,
      rightColor: _mediumPurple,
      backgroundAsset: 'images/gear/tobacco.jpg',
      type: "Tobacco",
    ),
    Section(
      title: AppTranslations.of(context).text('gear.pipes').toUpperCase(),
      leftColor: _mySin,
      rightColor: _tomato,
      backgroundAsset: 'images/gear/hookah.jpg',
      type: "Hookah",
    ),
    Section(
      title: AppTranslations.of(context).text('gear.bowls').toUpperCase(),
      leftColor: Colors.white,
      rightColor: _tomato,
      backgroundAsset: 'images/gear/bowls.jpg',
      type: "Bowl",
    ),
    Section(
      title: AppTranslations.of(context).text('gear.hmd').toUpperCase(),
      leftColor: Colors.blueAccent,
      rightColor: Colors.blue,
      backgroundAsset: 'images/gear/hms.jpg',
      type: "HeatManagement",
    ),
    Section(
      title: AppTranslations.of(context).text('gear.coals').toUpperCase(),
      leftColor: Colors.black,
      rightColor: Colors.red,
      backgroundAsset: 'images/gear/coals.jpg',
      type: "Coal",
    ),
  ];
}
