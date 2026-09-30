import 'package:omni_wire/data/data_sources/project_data_source.dart';
import 'package:omni_wire/data/models/project_model.dart';
import 'package:omni_wire/domain/entities/project.dart';
import 'package:omni_wire/domain/repositories/project_repo.dart';

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
