// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/support/m_platform.dart';
import 'package:flutter/material.dart';

import 'sections.dart';

const double kSectionIndicatorWidth = 32.0;

// The card for a single section. Displays the section's gradient and background image.
class SectionCard extends StatelessWidget {
  const SectionCard({Key? key, required this.section})
      : super(key: key);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: section.title!,
      child: new Semantics(
        label: section.title,
        button: true,
        child: Stack(
          children: <Widget>[
            new DecoratedBox(
              decoration: MPlatform.isWeb
                  ? BoxDecoration()
                  : new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          section.leftColor!,
                          section.rightColor!,
                        ],
                      ),
                    ),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: RepaintBoundary(
                  child: new Image.asset(
                    section.backgroundAsset!,
                    color: const Color.fromRGBO(255, 255, 255, 0.545),
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    section.title!,
                    style: Theme.of(context).textTheme.headline4,
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}

// The title is rendered with two overlapping text widgets that are vertically
// offset a little. It's supposed to look sort-of 3D.
class SectionTitle extends StatelessWidget {
  static const TextStyle sectionTitleStyle = TextStyle(
    fontFamily: 'Montserrat',
    inherit: false,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic,
  );

  static final TextStyle sectionTitleShadowStyle = sectionTitleStyle.copyWith(
    color: const Color(0x19000000),
  );

  const SectionTitle({
    Key? key,
    required this.section,
    required this.scale,
    required this.opacity,
  })  : assert(opacity >= 0.0 && opacity <= 1.0),
        super(key: key);

  final Section section;
  final double scale;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return new IgnorePointer(
      child: new Opacity(
        opacity: opacity,
        child: new Transform(
          transform: new Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                top: 4.0,
                child: new Text(section.title!, style: sectionTitleShadowStyle),
              ),
              new Text(section.title!, style: sectionTitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}

// Small horizontal bar that indicates the selected section.
class SectionIndicator extends StatelessWidget {
  const SectionIndicator({Key? key, this.opacity = 1.0}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return new IgnorePointer(
      child: new Container(
        width: kSectionIndicatorWidth,
        height: 3.0,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}

// Display a single SectionDetail.
class SectionDetailView extends StatelessWidget {
  SectionDetailView({Key? key, required this.detail})
      : assert((detail.imageAsset ?? detail.title) != null),
        super(key: key);

  final SectionDetail detail;

  @override
  Widget build(BuildContext context) {
    final Widget image = new DecoratedBox(
      decoration: new BoxDecoration(),
    );

    Widget item;
    if (detail.title == null && detail.subtitle == null) {
      item = new Container(
        height: 240.0,
        padding: const EdgeInsets.all(16.0),
        child: new SafeArea(
          top: false,
          bottom: false,
          child: image,
        ),
      );
    } else {
      item = new ListTile(
        title: new Text(detail.title!),
        subtitle: new Text(detail.subtitle!),
        leading: new SizedBox(width: 32.0, height: 32.0, child: image),
      );
    }

    return new DecoratedBox(
      decoration: new BoxDecoration(color: Colors.black),
      child: item,
    );
  }
}

class BrandGroupWidget extends StatelessWidget {
  final BrandGroup? brandGroup;

  const BrandGroupWidget({Key? key, this.brandGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new DecoratedBox(
        decoration: new BoxDecoration(color: Colors.black),
        child: new ListTile(
          title: new Text(brandGroup!.name!),
          subtitle: new Text(brandGroup!.itemCount.toString()),
          leading:
              new SizedBox(width: 32.0, height: 32.0, child: Placeholder()),
        ));
  }
}
