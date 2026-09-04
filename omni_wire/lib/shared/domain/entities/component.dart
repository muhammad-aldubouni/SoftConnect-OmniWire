import 'package:omni_wire/shared/domain/entities/code_block.dart';

class Component {
  final String componentName;
  final List<String> libraries;
  final List<String> includes;
  final List<CodeBlock> globals;
  final CodeBlock setup;
  final List<CodeBlock> actions;
  final List<CodeBlock> triggers;

  Component({
    required this.componentName,
    required this.libraries,
    required this.includes,
    required this.globals,
    required this.setup,
    required this.actions,
    required this.triggers,
  });

  Component getCopy(String id) => Component(
    componentName: componentName.replaceAll('<id>', id),
    libraries: libraries,
    includes: includes,
    globals: globals.map((block) => block.getCopy(id)).toList(),
    setup: setup.getCopy(id),
    actions: actions.map((block) => block.getCopy(id)).toList(),
    triggers: triggers.map((block) => block.getCopy(id)).toList(),
  );
}
