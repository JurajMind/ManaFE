// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Raw data for the animation demo.

import 'package:app/module/general/gear_bloc.dart';
import 'package:app/pages/Gear/devices.dart';
import 'package:app/pages/Gear/pipe_accesory.dart';

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
  const Section(
      {this.title,
      this.backgroundAsset,
      this.leftColor,
      this.rightColor,
      this.child,
      this.children,
      this.scrollController});
  final String title;
  final String backgroundAsset;
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

List<Section> getAllSections(
    GearBloc bloc,
    ScrollPhysics physics,
    Map<int, ScrollController> controllers,
    int currentView,
    ValueChanged<int> onViewChanged) {
  return <Section>[
    Section(
        title: 'DEVICES',
        leftColor: _mediumPurple,
        rightColor: _mariner,
        backgroundAsset: 'images/gear/mygear.jpg',
        child: Devices(
          scrollController: controllers[0],
          scrollPhysics: physics,
        )),
    Section(
        title: 'TOBACCO',
        leftColor: _tomato,
        rightColor: _mediumPurple,
        backgroundAsset: 'images/gear/tobacco.jpg',
        child: PipeAccesoryList(
          currentView: currentView,
          onViewChanged: onViewChanged,
          scrollController: controllers[1],
          scrollPhysics: physics,
          type: "Tobacco",
        )),
    Section(
      title: 'HOOKAH',
      leftColor: _mySin,
      rightColor: _tomato,
      backgroundAsset: 'images/gear/hookah.jpg',
      child: PipeAccesoryList(
        currentView: currentView,
        onViewChanged: onViewChanged,
        scrollController: controllers[2],
        scrollPhysics: physics,
        type: "Hookah",
      ),
    ),
    Section(
        title: 'BOWLS',
        leftColor: Colors.white,
        rightColor: _tomato,
        backgroundAsset: 'images/gear/bowls.jpg',
        child: PipeAccesoryList(
          currentView: currentView,
          onViewChanged: onViewChanged,
          scrollController: controllers[3],
          scrollPhysics: physics,
          type: "Bowl",
        )),
    Section(
        title: 'H.M.D',
        leftColor: Colors.blueAccent,
        rightColor: Colors.blue,
        backgroundAsset: 'images/gear/hms.jpg',
        child: PipeAccesoryList(
          currentView: currentView,
          onViewChanged: onViewChanged,
          scrollController: controllers[4],
          scrollPhysics: physics,
          type: "HeatManagement",
        )),
    Section(
        title: 'COALS',
        leftColor: Colors.black,
        rightColor: Colors.red,
        backgroundAsset: 'images/gear/coals.jpg',
        child: PipeAccesoryList(
          currentView: currentView,
          onViewChanged: onViewChanged,
          scrollController: controllers[5],
          scrollPhysics: physics,
          type: "Coal",
        )),
  ];
}
