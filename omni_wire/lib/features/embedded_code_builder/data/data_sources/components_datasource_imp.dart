import 'dart:convert';
import 'dart:io';

import 'package:omni_wire/features/embedded_code_builder/data/data_sources/components_datasource.dart';

class ComponentsDatasourceImp implements ComponentsDatasource {
  @override
  Future<List<Map<String, dynamic>>> fetchComponents() async {
    List<Map<String, dynamic>> components = [];
    var file = File(
      "/home/muhammad/Documents/SoftConnect-OmniWire/component_file.json",
    );
    components.add(jsonDecode(file.readAsStringSync()) as Map<String, dynamic>);
    return components;
  }
}
