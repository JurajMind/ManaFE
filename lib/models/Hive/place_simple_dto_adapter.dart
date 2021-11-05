import 'dart:convert';

import 'package:openapi/api.dart';
import 'package:hive/hive.dart';

class PlaceSimpleDtoAdapter extends TypeAdapter<PlaceSimpleDto> {
  @override
  final typeId = 0;

  @override
  PlaceSimpleDto read(BinaryReader reader) {
    return PlaceSimpleDto.fromJson(json.decode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, PlaceSimpleDto obj) {
    writer.write(json.encode(obj.toJson()));
  }
}
