import 'package:omni_wire/features/embedded_code_builder/data/models/code_block_model.dart';
import 'package:omni_wire/shared/domain/entities/component.dart';

class ComponentModel {
  final String componentName;
  final List<String> libraries;
  final List<String> includes;
  final List<CodeBlockModel> globals;
  final CodeBlockModel setup;
  final List<CodeBlockModel> actions;
  final List<CodeBlockModel> triggers;

  ComponentModel({
    required this.componentName,
    required this.libraries,
    required this.includes,
    required this.globals,
    required this.setup,
    required this.actions,
    required this.triggers,
  });

  static ComponentModel fromJson(Map<String, dynamic> json) => ComponentModel(
    componentName: json['component_name'] as String,
    libraries:
        (json['libraries'] as List<dynamic>?)
            ?.map((item) => item as String)
            .toList() ??
        [],
    includes:
        (json['includes'] as List<dynamic>?)
            ?.map((item) => item as String)
            .toList() ??
        [],
    globals:
        (json['globals'] as List<dynamic>?)
            ?.map(
              (item) => CodeBlockModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        [],
    setup: CodeBlockModel.fromJson(
      json['setup'] as Map<String, dynamic>? ?? {},
    ),

    actions:
        (json['actions'] as List<dynamic>?)
            ?.map(
              (item) => CodeBlockModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        [],
    triggers:
        (json['triggers'] as List<dynamic>?)
            ?.map(
              (item) => CodeBlockModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    'component_name': componentName,
    'libraries': libraries,
    'includes': includes,
    'globals': globals,
    'setup': setup.toJson(),
    'actions': actions.map((block) => block.toJson()).toList(),
    'triggers': triggers.map((block) => block.toJson()).toList(),
  };

  Component toEntity() => Component(
    componentName: componentName,
    libraries: libraries,
    includes: includes,
    globals: globals.map((block) => block.toEntity()).toList(),
    setup: setup.toEntity(),
    actions: actions.map((block) => block.toEntity()).toList(),
    triggers: triggers.map((block) => block.toEntity()).toList(),
  );

  static ComponentModel fromEntity(Component component) => ComponentModel(
    componentName: component.componentName,
    libraries: List<String>.from(component.libraries),
    includes: List<String>.from(component.includes),
    globals: component.globals.map(CodeBlockModel.fromEntity).toList(),
    setup: CodeBlockModel.fromEntity(component.setup),
    actions: component.actions.map(CodeBlockModel.fromEntity).toList(),
    triggers: component.triggers.map(CodeBlockModel.fromEntity).toList(),
  );
}
