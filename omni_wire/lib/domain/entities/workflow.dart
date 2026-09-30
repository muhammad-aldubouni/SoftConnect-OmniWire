import 'package:omni_wire/domain/entities/code_block.dart';
import 'package:omni_wire/domain/entities/condition_group.dart';

class Workflow {
  final List<CodeBlock> actions;
  final ConditionGroup conditions;

  String _name = '';
  String get name => _name;
  String get id => name + hashCode.toString();

  Workflow({
    required this.actions,
    required this.conditions,
    required this._name,
  });
  void setName(String newName) => _name = newName;
}
