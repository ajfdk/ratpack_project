import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PointsStorage {
  static const double startingPoints = 500;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/points.txt');
  }

  Future<double> readPoints() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return double.parse(contents);
    } catch (e) {
      // If encountering an error, return starting points
      return startingPoints;
    }
  }

  Future<File> writePoints(double points) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$points');
  }

  Future<void> deleteDocumentsDirectory() async {
    final docDir = await getApplicationDocumentsDirectory();

    if (docDir.existsSync()) {
      docDir.deleteSync(recursive: true);
    }

    debugPrint("debug: deleted documents directory");
  }
}