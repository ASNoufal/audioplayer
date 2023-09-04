import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileNotifier extends StateNotifier<File?> {
  FileNotifier() : super(null);

  void getfiledata(String filepath) {
    final file = File(filepath);
    state = file;
  }
}
