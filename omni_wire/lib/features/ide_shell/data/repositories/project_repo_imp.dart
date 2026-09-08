import 'package:omni_wire/features/ide_shell/data/data_sources/project_data_source.dart';
import 'package:omni_wire/features/ide_shell/data/models/project_model.dart';
import 'package:omni_wire/shared/domain/entities/project.dart';
import 'package:omni_wire/features/ide_shell/domain/repositories/project_repo.dart';

class ProjectRepoImp implements ProjectRepo {
  final ProjectDataSource dataSource;

  ProjectRepoImp({required this.dataSource});

  @override
  Project loadProject(String projectPath) {
    var data = dataSource.loadProject(projectPath);
    return ProjectModel.fromJson(data).toEntity();
  }

  @override
  void saveProject(Project project) =>
      dataSource.saveProject(ProjectModel.fromEntity(project).toJson());
}
