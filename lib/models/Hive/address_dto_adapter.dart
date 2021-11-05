import 'dart:convert';

import 'package:openapi/api.dart';
import 'package:hive/hive.dart';

class AddressDtoAdapter extends TypeAdapter<AddressDto> {
  @override
  final typeId = 1;

  @override
  AddressDto read(BinaryReader reader) {
    return AddressDto.fromJson(json.decode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, AddressDto obj) {
    writer.write(json.encode(obj.toJson()));
  }
}
