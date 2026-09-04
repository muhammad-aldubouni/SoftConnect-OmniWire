import 'package:omni_wire/features/ide_shell/domain/entries/project.dart';

abstract class ProjectRepo {
  Project loadProject(String projectPath);
  void saveProject(Project project);
}
