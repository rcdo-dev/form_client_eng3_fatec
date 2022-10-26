import 'dart:io';

import 'package:flutter/widgets.dart';

class FileCreation {
  Future<void> createFile() async {
    final file = File('db.txt');
    await file.create();
    debugPrint('Arquivo criado: $file');
  }
}
