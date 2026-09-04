import 'package:omni_wire/features/embedded_code_builder/data/models/code_block_model.dart';
import 'package:omni_wire/features/embedded_code_builder/data/models/condition_group_model.dart';
import 'package:omni_wire/shared/domain/entities/workflow.dart';

class WorkflowModel {
  final List<CodeBlockModel> actions;
  final ConditionGroupModel conditions;
  final String name;
  final String id;

  WorkflowModel({
    required this.actions,
    required this.conditions,
    required this.name,
    required this.id,
  });

  static WorkflowModel fromJson(Map<String, dynamic> json) => WorkflowModel(
    actions:
        (json['actions'] as List<dynamic>?)
            ?.map(
              (item) => CodeBlockModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        [],
    conditions: ConditionGroupModel.fromJson(
      json['conditions'] as Map<String, dynamic>? ?? {},
    ),
    name: json['name'] as String,
    id: json['id'] as String,
  );

  static WorkflowModel fromEntity(Workflow workflow) => WorkflowModel(
    actions: workflow.actions
        .map((action) => CodeBlockModel.fromEntity(action))
        .toList(),
    conditions: ConditionGroupModel.fromEntity(workflow.conditions),
    name: workflow.name,
    id: workflow.id,
  );

  Workflow toEntity() => Workflow(
    actions: actions.map((action) => action.toEntity()).toList(),
    conditions: conditions.toEntity(),
    name: name,
  );

  Map<String, dynamic> toJson() => {
    'actions': actions.map((action) => action.toJson()).toList(),
    'conditions': conditions.toJson(),
    'name': name,
    'id': id,
  };
}
