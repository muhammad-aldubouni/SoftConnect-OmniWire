import 'package:omni_wire/core/enums/logical_operation.dart';
import 'package:omni_wire/domain/entities/code_block.dart';
import 'package:omni_wire/data/models/code_block_model.dart';
import 'package:omni_wire/domain/entities/condition_group.dart';

class ConditionGroupModel {
  final LogicalOperation operation;
  final List conditions;

  ConditionGroupModel({
    this.operation = LogicalOperation.and,
    this.conditions = const [],
  });

  static ConditionGroupModel fromJson(Map<String, dynamic> json) {
    final operation = LogicalOperation.values.firstWhere(
      (value) => value.name == json['operation'],
      orElse: () => LogicalOperation.and,
    );

    return ConditionGroupModel(
      operation: operation,
      conditions: _conditionsFromJson(json['conditions'] as List? ?? const []),
    );
  }

  Map<String, dynamic> toJson() => {
    'operation': operation.name,
    'conditions': _conditionsToJson(conditions),
  };

  static ConditionGroupModel fromEntity(ConditionGroup group) =>
      ConditionGroupModel(
        operation: group.operation,
        conditions: group.conditions.map(_valueFromEntity).toList(),
      );

  static List<dynamic> _conditionsFromJson(List<dynamic> conditions) =>
      conditions.map((condition) {
        if (condition is Map<String, dynamic> &&
            condition['conditions'] is List) {
          return ConditionGroupModel.fromJson(condition);
        }

        if (condition is Map<String, dynamic>) {
          return CodeBlockModel.fromJson(condition);
        }

        return condition;
      }).toList();

  List<dynamic> _conditionsToJson(List<dynamic> conditions) =>
      conditions.map((condition) {
        return _valueToJson(condition);
      }).toList();

  dynamic _valueToJson(dynamic value) {
    if (value is ConditionGroupModel) return value.toJson();
    if (value is ConditionGroup) {
      return ConditionGroupModel.fromEntity(value).toJson();
    }
    if (value is CodeBlockModel) return value.toJson();
    if (value is CodeBlock) {
      return CodeBlockModel.fromEntity(value).toJson();
    }
    if (value is List) return value.map(_valueToJson).toList();
    if (value is Map<String, dynamic>) {
      return value.map((key, item) => MapEntry(key, _valueToJson(item)));
    }
    return value;
  }

  ConditionGroup toEntity() => ConditionGroup(
    operation: operation,
    conditions: conditions.map(_valueToEntity).toList(),
  );

  static dynamic _valueFromEntity(dynamic value) {
    if (value is ConditionGroup) {
      return ConditionGroupModel.fromEntity(value);
    }
    if (value is CodeBlock) return CodeBlockModel.fromEntity(value);
    if (value is List) return value.map(_valueFromEntity).toList();
    if (value is Map<String, dynamic>) {
      return value.map((key, item) => MapEntry(key, _valueFromEntity(item)));
    }
    return value;
  }

  static dynamic _valueToEntity(dynamic value) {
    if (value is ConditionGroupModel) return value.toEntity();
    if (value is CodeBlockModel) return value.toEntity();
    if (value is List) return value.map(_valueToEntity).toList();
    if (value is Map<String, dynamic>) {
      return value.map((key, item) => MapEntry(key, _valueToEntity(item)));
    }
    return value;
  }
}
