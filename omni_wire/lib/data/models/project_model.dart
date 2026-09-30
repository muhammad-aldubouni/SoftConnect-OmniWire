import 'package:omni_wire/data/models/code_block_model.dart';
import 'package:omni_wire/data/models/component_model.dart';
import 'package:omni_wire/data/models/workflow_model.dart';
import 'package:omni_wire/domain/entities/project.dart';
import 'package:omni_wire/domain/entities/code_block.dart';

class ProjectModel {
  final String name;
  final String path;
  final List<ComponentModel> components;
  final List<WorkflowModel> workflows;
  final List<CodeBlockModel> controls;
  final List<List<CodeBlockModel>> sections;

  ProjectModel({
    required this.name,
    required this.path,
    required this.components,
    required this.workflows,
    required this.controls,
    required this.sections,
  });

  static ProjectModel fromJson(Map<String, dynamic> json) => ProjectModel(
    name: json['name'] as String,
    path: json['path'] as String,
    components:
        (json['components'] as List<dynamic>?)
            ?.map(
              (item) => ComponentModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        [],
    workflows:
        (json['workflows'] as List<dynamic>?)
            ?.map(
              (item) => WorkflowModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        [],
    controls:
        (json['controls'] as List<dynamic>?)
            ?.map(
              (item) => CodeBlockModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        [],
    sections:
        (json['sections'] as List<List<dynamic>>?)
            ?.map(
              (section) => section
                  .map((codeBlock) => CodeBlockModel.fromJson(codeBlock))
                  .toList(),
            )
            .toList() ??
        [],
  );

  static ProjectModel fromEntity(Project project) => ProjectModel(
    name: project.name,
    path: project.path,
    components: project.components
        .map((component) => ComponentModel.fromEntity(component))
        .toList(),
    workflows: project.workflows
        .map((workflow) => WorkflowModel.fromEntity(workflow))
        .toList(),
    controls: project.controls
        .map((control) => CodeBlockModel.fromEntity(control))
        .toList(),
    sections: List<List<CodeBlockModel>>.from(
      project.sections.map(
        (section) =>
            section.map((codeBlock) => CodeBlockModel.fromEntity(codeBlock)),
      ),
    ),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'path': path,
    'components': components.map((component) => component.toJson()).toList(),
    'workflows': workflows.map((workflow) => workflow.toJson()).toList(),
    'controls': controls.map((control) => control.toJson()).toList(),
    'sections': sections
        .map(
          (section) =>
              section.map((codeBlockModel) => codeBlockModel.toJson()).toList(),
        )
        .toList(),
  };

  Project toEntity() => Project(
    name: name,
    path: path,
    components: components.map((component) => component.toEntity()).toList(),
    workflows: workflows.map((workflow) => workflow.toEntity()).toList(),
    controls: controls.map((control) => control.toEntity()).toList(),
    sections: List<List<CodeBlock>>.from(
      sections
          .map(
            (section) => section
                .map((codeBlockModel) => codeBlockModel.toEntity())
                .toList(),
          )
          .toList(),
    ),
  );
}
