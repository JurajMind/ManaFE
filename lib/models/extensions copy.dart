import 'package:app/app/app.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class Convertor {

    static PipeAccesorySimpleDto getPipeAccesory(TobaccoSimpleDto tobacco) {
      var result = PipeAccesorySimpleDto();
      result.brand = tobacco.brand;
      result.brandId = tobacco.brandId;
      result.id = tobacco.id;
      result.name = tobacco.name;
      result.type = "Tobacco";
     return result;
  }
}
