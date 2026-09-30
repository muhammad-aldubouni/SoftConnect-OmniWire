import 'package:omni_wire/domain/entities/project.dart';

abstract class ProjectRepo {
  Project loadProject(String projectPath);
  void saveProject(Project project);
}
