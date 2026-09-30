import 'dart:convert';
import 'dart:io';

import 'package:omni_wire/data/data_sources/project_data_source.dart';

class ProjectDataSourceMockImp extends ProjectDataSource {
  @override
  void saveProject(Map<String, dynamic> project) {
    File file = File('./project-example.json');
    String projectData = jsonEncode(project);
    file.writeAsStringSync(projectData);
  }

  @override
  Map<String, dynamic> loadProject(String projectPath) {
    return {};
  }
}
