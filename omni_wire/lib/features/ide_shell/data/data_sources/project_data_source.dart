abstract class ProjectDataSource {
  void saveProject(Map<String, dynamic> project);
  Map<String, dynamic> loadProject(String projectPath);
}
