// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Raw data for the animation demo.

import 'dart:math';

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

  static List<SectionDetail> generateRandomBrands() {
    var brands = [
      "0815",
      "187 Strassenbande",
      "2.0",
      "360° Black Snow",
      "7 Days",
      "7 Nights",
      "Absolem",
      "Achi",
      "Adalya",
      "Adlin",
      "Aeon",
      "Afzal",
      "Al Ajamy",
      "Al Amir",
      "Al Fakher",
      "Al Jazeera",
      "Al Kashmir",
      "Al Mahmood",
      "Al Rayan",
      "Al Safwa",
      "Al Shamim",
      "Al Tawareg",
      "Al Waha",
      "Aladin",
      "Alchemist",
      "Alisha",
      "Alpa",
      "Alpaca bowl",
      "Amazing",
      "Ambrosia",
      "Amok",
      "Amy ",
      "Amy Gold",
      "Apple on Top",
      "Argelini",
      "art hookah",
      "Assal",
      "Ayam Zaman",
      "Babos",
      "Bang Bang",
      "Bazhookah",
      "Black Lava",
      "Blue Horse",
      "Brodator",
      "Cascade",
      "Catwalk",
      "Cavalier",
      "Chaos",
      "CHCUnderground",
      "Chillma",
      "Cloud 9",
      "CoAla",
      "Colonial",
      "Copy Smoke",
      "Crystal Smoke",
      "CWP",
      "Czech Hookah",
      "CzechHookahClub",
      "d",
      "Daily Hookah",
      "Darkside",
      "Desvall",
      "Diamon",
      "Doobacco",
      "Dookah",
      "Dreamlike",
      "Dschinni",
      "Dýmkařův koutek",
      "Egeglas",
      "Egyptian",
      "El Maallem",
      "Elegans",
      "Emagine",
      "Emperor",
      "Escobar",
      "Essah",
      "Fantasia",
      "Fibdis",
      "Flamenco",
      "Flocky",
      "Fly",
      "Frankfurter Klasse",
      "Freestyle",
      "Fruit bowl",
      "Fucker",
      "Fumari",
      "Funk you",
      "Funky Flav",
      "GalaxyHookah",
      "Gama",
      "Ginis",
      "GKU",
      "Gold star",
      "Golden Crown",
      "Golden Pipe",
      "Habayeb",
      "Haifa",
      "Hangover",
      "Hardwood",
      "Hashtag",
      "Hasso",
      "Haze",
      "HC",
      "Headshot",
      "Heavenleaf ",
      "Holster",
      "Hookafina",
      "Hookah Freak",
      "Hookah Stone",
      "HookaH-HookaH",
      "HookahJohn",
      "Hookaps",
      "Hydrogen",
      "Illegal",
      "Infinity Molasses",
      "Inhale",
      "insahAR",
      "iSmoke",
      "Jafar",
      "KaaHoo",
      "kaloud",
      "Karma Hookah",
      "Kaya Shisha",
      "Kentucky Fire",
      "Khalil Maamoon",
      "Khalil Mamon",
      "Kismet Noir",
      "Lady Smoke",
      "Lavoo",
      "Layalina",
      "Laziza",
      "Like",
      "Loop",
      "Lule",
      "Magic Smoke",
      "Manapipes",
      "Maridan",
      "Marvin Smoke",
      "Mason Shishaware ",
      "Mazaya",
      "Medite",
      "Miami Chill",
      "MIG",
      "Milano",
      "Mond",
      "Nakhla",
      "Nameless",
      "Nanosmoke",
      "Nice",
      "Nirvana Super Shisha",
      "nubes",
      "Oduman",
      "OmniWorks",
      "Oneway",
      "Oscars",
      "Ottaman",
      "OwnBrand",
      "Pain",
      "Petes Stoff",
      "Pirates Breath",
      "Predator",
      "Prototype",
      "Pure",
      "Px1",
      "RAPTobacco",
      "Rauchgold",
      "Red Poppy",
      "RHookah",
      "Romman",
      "Rosanna",
      "Rosh",
      "Royal Tobacco",
      "Rozana",
      "RS Bowls ",
      "Sams",
      "Saphire",
      "Savacco",
      "Savu",
      "Score",
      "Serbetli",
      "Shine",
      "Shisha King",
      "Shisha Original",
      "ShishaBucks",
      "Shishaix",
      "Sindbad",
      "Sinned",
      "SK Shisha King",
      "Skull",
      "Smile",
      "Smoke Crazy",
      "Smoke Star",
      "Smokeclouds",
      "SmokeLab",
      "Smokeys",
      "Smokin Ace",
      "Smoking Hot",
      "Social Smoke",
      "Star Smokers",
      "Starbuzz",
      "Start Now",
      "Startaste",
      "Steamulation",
      "Strongly",
      "Student",
      "Sweet Smoke",
      "Taboo",
      "Tangiers",
      "Taori",
      "TickTock",
      "Titanium",
      "Tobaccobana",
      "Tombacco",
      "Trifecta",
      "True Passion",
      "Tubacco",
      "Ugly Hookah",
      "Ultimate",
      "UPG",
      "V.I.P",
      "VDK",
      "Vegas Flavor",
      "Victory Hookah",
      "Vidavi",
      "VZ Hookah",
      "Wanted",
      "Werkbund ",
      "Wookah",
      "WTO",
      "Xanti",
      "Xracher",
      "Ya Layl",
      "Zahrah",
      "Zain",
      "Zomo",
    ];

    var random = new Random();
    return brands
        .map((b) => new SectionDetail(
            title: b, subtitle: "${random.nextInt(20)} items"))
        .toList();
  }
}

class Section {
  const Section({
    this.title,
    this.backgroundAsset,
    this.backgroundAssetPackage,
    this.leftColor,
    this.rightColor,
    this.details,
  });
  final String title;
  final String backgroundAsset;
  final String backgroundAssetPackage;
  final Color leftColor;
  final Color rightColor;
  final List<SectionDetail> details;

  @override
  bool operator ==(Object other) {
    if (other is! Section) return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

// TODO(hansmuller): replace the SectionDetail images and text. Get rid of
// the const vars like _eyeglassesDetail and insert a variety of titles and
// image SectionDetails in the allSections list.

const SectionDetail _eyeglassesDetail = SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _eyeglassesImageDetail = SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
);

const SectionDetail _seatingDetail = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _seatingImageDetail = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
);

const SectionDetail _decorationDetail = SectionDetail(
  imageAsset: 'products/earrings.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _decorationImageDetail = SectionDetail(
  imageAsset: 'products/earrings.png',
  imageAssetPackage: _kGalleryAssetsPackage,
);

const SectionDetail _protectionDetail = SectionDetail(
  imageAsset: 'products/hat.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _protectionImageDetail = SectionDetail(
  imageAsset: 'products/hat.png',
  imageAssetPackage: _kGalleryAssetsPackage,
);

final List<Section> allSections = <Section>[
  const Section(
    title: 'MY GEAR',
    leftColor: _mediumPurple,
    rightColor: _mariner,
    backgroundAsset: 'images/gear/mygear.jpg',
    backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _eyeglassesDetail,
      _eyeglassesImageDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
    ],
  ),
  Section(
      title: 'TOBACCO',
      leftColor: _tomato,
      rightColor: _mediumPurple,
      backgroundAsset: 'images/gear/tobacco.jpg',
      backgroundAssetPackage: _kGalleryAssetsPackage,
      details: SectionDetail.generateRandomBrands()),
  const Section(
    title: 'HOOKAH',
    leftColor: _mySin,
    rightColor: _tomato,
    backgroundAsset: 'images/gear/hookah.jpg',
    backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _decorationDetail,
      _decorationImageDetail,
      _decorationDetail,
      _decorationDetail,
      _decorationDetail,
      _decorationDetail,
    ],
  ),
  const Section(
    title: 'BOWLS',
    leftColor: Colors.white,
    rightColor: _tomato,
    backgroundAsset: 'images/gear/bowls.jpg',
    backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _protectionDetail,
      _protectionImageDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
    ],
  ),
  const Section(
    title: 'HMS',
    leftColor: Colors.blueAccent,
    rightColor: Colors.blue,
    backgroundAsset: 'images/gear/hms.jpg',
    backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
    ],
  ),
  const Section(
    title: 'COALS',
    leftColor: Colors.black,
    rightColor: Colors.red,
    backgroundAsset: 'images/gear/coals.jpg',
    backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
    ],
  ),
];
