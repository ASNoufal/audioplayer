import 'dart:io';
import 'package:hive/hive.dart';

class FileTypeAdapter extends TypeAdapter<File> {
  @override
  final typeId = 100; // Assign a unique typeId

  @override
  File read(BinaryReader reader) {
    // Read your data from the binary reader
    // For example:
    final filePath = reader.read();
    return File(filePath);
  }

  @override
  void write(BinaryWriter writer, File obj) {
    // Write your data to the binary writer
    // For example:
    writer.write(obj.path);
  }
}
