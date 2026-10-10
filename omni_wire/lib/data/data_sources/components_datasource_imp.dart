import 'dart:convert';
import 'dart:io';

import 'package:omni_wire/data/data_sources/components_datasource.dart';

class ComponentsDatasourceImp implements ComponentsDatasource {
  String componentPath =
      "/home/muhammad/Documents/SoftConnect-OmniWire/components/";
  @override
  Future<List<Map<String, dynamic>>> fetchComponents() async {
    List<Map<String, dynamic>> components = [];
    var componentFiles = Directory(componentPath);
    componentFiles.listSync().forEach((file) {
      if (file is File) {
        components.add(
          jsonDecode(file.readAsStringSync()) as Map<String, dynamic>,
        );
      }
    });

    return components;
  }
}
