import 'package:app/app/app.dart';
import 'package:app/components/Media/media.widget.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class Extensions {
  static String getPlaceImage(PlaceSimpleDto? place, MediaSize size) {
    var image = place?.media?.path;
    if (image == null) {
      return 'https://${App.baseUri}/Content/Placeholder/place.jpg';
    }
    return 'https://${App.baseUri}$image${MediaWidget.getSize(size)}';
  }

  static String getFullPlaceImage(PlaceDto? place, MediaSize size) {
    var image = place?.medias?.first.path;
    if (image == null) {
      return 'https://${App.baseUri}/Content/Placeholder/place.jpg';
    }
    return 'https://${App.baseUri}${MediaWidget.getSize(size)}';
  }

  static String adress(AddressDto? adress) {
    return '${adress?.street ?? ''} ${adress?.number ?? ''} ${adress?.city ?? ''}';
  }

  static Widget accesoryPicture(PipeAccesorySimpleDto accesory) {
    if (accesory.picture != null) {
      return defaultAccesoryPicture(accesory);
      return CachedNetworkImage(
          fit: BoxFit.fill,
          fadeOutDuration: Duration(milliseconds: 0),
          fadeInCurve: Curves.linear,
          imageUrl: 'https://${App.baseUri}${accesory.picture}',
          errorWidget: (context, url, error) => defaultAccesoryPicture(accesory),
          placeholder: (context, url) => defaultAccesoryPicture(accesory));
    }
    return defaultAccesoryPicture(accesory);
  }

  static String getAbsoluteurl(String? relativeUrl) {
    if (relativeUrl != null) {
      return 'https://${App.baseUri}$relativeUrl';
    }
    return "";
  }

  static Widget brandPicture(BrandGroup brand) {
    if (brand.picture != null) {
      return CachedNetworkImage(
          fit: BoxFit.fill,
          fadeOutDuration: Duration(milliseconds: 0),
          fadeInCurve: Curves.linear,
          imageUrl: 'https://${App.baseUri}${brand.picture}');
    }
    return Container();
  }

  static Widget defaultAccesoryPicture(PipeAccesorySimpleDto accesory) {
    return defaultTypePicture(accesory.type!);
  }

  static Widget defaultTypePicture(String type) {
    var imgPath = '';
    switch (type.toLowerCase()) {
      case 'bowl':
        imgPath = 'images/types/bowl.png';
        break;
      case 'coal':
        imgPath = 'images/types/coal.png';
        break;
      case 'coals':
        imgPath = 'images/types/coal.png';
        break;
      case 'heatmanagement':
        imgPath = 'images/types/heatmanagment.png';
        break;
      case 'heatmanagment':
        imgPath = 'images/types/heatmanagment.png';
        break;
      case 'h.m.s':
        imgPath = 'images/types/heatmanagment.png';
        break;
      case 'hmd':
        imgPath = 'images/types/heatmanagment.png';
        break;
      case 'tobacco':
        imgPath = 'images/types/tobacco.png';
        break;
      case 'hookah':
        imgPath = 'images/types/hookah.png';
        break;
      case 'pipe':
        imgPath = 'images/types/hookah.png';
        break;
    }
    return Image.asset(imgPath);
  }

  static String deviceVersion(int version) {
    var minor = version % 1000;
    version = version ~/ 1000;
    var major = version % 1000;
    version = version ~/ 1000;
    var whole = version;

    return "$whole.$major.$minor";
  }

  static String devicePicture(DeviceSimpleDtoTypeEnum? type) {
    switch (type) {
      case DeviceSimpleDtoTypeEnum.number13:
        return 'images/devices/wood.jpg';
      case DeviceSimpleDtoTypeEnum.number12:
        return 'images/devices/wood.jpg';
      case DeviceSimpleDtoTypeEnum.number11:
        return 'images/devices/black.jpg';
      case DeviceSimpleDtoTypeEnum.number10:
        return 'images/devices/white.jpg';
    }
    return 'images/devices/prototype.jpg';
  }

  static List<Color> deviceAccentColor(DeviceSimpleDtoTypeEnum? type) {
    switch (type) {
      case DeviceSimpleDtoTypeEnum.number13:
        return [
          Colors.transparent,
          Colors.blue,
        ];
      case DeviceSimpleDtoTypeEnum.number12:
        return [
          Colors.transparent,
          Colors.orangeAccent,
        ];
      case DeviceSimpleDtoTypeEnum.number11:
        return [
          Colors.transparent,
          Colors.grey,
        ];
      case DeviceSimpleDtoTypeEnum.number10:
        return [
          Colors.transparent,
          Colors.indigoAccent,
        ];
    }

    return [
      Colors.transparent,
      Colors.amber,
    ];
  }
}

class Convertor {
  static PipeAccesorySimpleDto getPipeAccesory(TobaccoSimpleDto tobacco) {
    return PipeAccesorySimpleDto(
      brand: tobacco.brand,
      brandId: tobacco.brandId,
      id: tobacco.id,
      name: tobacco.name,
      type: "Tobacco",
    );
  }
}
