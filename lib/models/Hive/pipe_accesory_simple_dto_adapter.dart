import 'dart:convert';

import 'package:openapi/api.dart';
import 'package:hive/hive.dart';

class PipeAccesorySimpleDtoAdapter extends TypeAdapter<PipeAccesorySimpleDto> {
  @override
  final typeId = 4;

  @override
  PipeAccesorySimpleDto read(BinaryReader reader) {
    return PipeAccesorySimpleDto.fromJson(json.decode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, PipeAccesorySimpleDto obj) {
    writer.write(json.encode(obj.toJson()));
  }
}
