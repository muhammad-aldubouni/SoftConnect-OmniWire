import 'package:omni_wire/shared/domain/entities/code_block.dart';
import 'package:omni_wire/shared/domain/entities/component.dart';
import 'package:omni_wire/shared/domain/entities/workflow.dart';

class Project {
  final String name;
  final String path;
  final List<Component> components;
  final List<Workflow> workflows;
  final List<CodeBlock> controls;
  final List<String> sections;

  Project({
    required this.name,
    required this.path,
    required this.components,
    required this.workflows,
    required this.controls,
    required this.sections,
  });

  Project copyWith({
    required String name,
    required String path,
    required List<Component> components,
    required List<Workflow> workflows,
  }) {
    return Project(
      name: name,
      path: path,
      components: components,
      workflows: workflows,
      controls: controls,
      sections: sections,
    );
  }
}
