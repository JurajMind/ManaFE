import 'dart:convert';

import 'package:openapi/api.dart';
import 'package:hive/hive.dart';

class TobaccoMixSimpleDtoAdapter extends TypeAdapter<TobaccoMixSimpleDto> {
  @override
  final typeId = 2;

  @override
  TobaccoMixSimpleDto read(BinaryReader reader) {
    return TobaccoMixSimpleDto.fromJson(json.decode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, TobaccoMixSimpleDto obj) {
    writer.write(json.encode(obj.toJson()));
  }
}
