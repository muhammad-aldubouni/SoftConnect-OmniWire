import 'package:omni_wire/shared/domain/entities/project.dart';

abstract class ProjectRepo {
  Project loadProject(String projectPath);
  void saveProject(Project project);
}
