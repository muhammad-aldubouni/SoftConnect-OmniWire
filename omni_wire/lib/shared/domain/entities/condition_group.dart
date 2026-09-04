import 'package:omni_wire/shared/domain/entities/logical_operation.dart';

class ConditionGroup {
  LogicalOperation operation;
  List<dynamic> conditions;

  ConditionGroup({
    this.operation = LogicalOperation.and,
    List<dynamic>? conditions,
  }) : conditions = conditions ?? [];
}
