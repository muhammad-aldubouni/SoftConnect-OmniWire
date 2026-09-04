import 'package:omni_wire/shared/domain/entities/selection.dart';

class CodeBlock {
  final String name;
  final List<String> code;
  final List<Selection> selections;

  CodeBlock({required this.name, required this.code, required this.selections});

  CodeBlock getCopy(String id) => CodeBlock(
    name: name.replaceAll('<id>', id),
    code: code.map((value) => value.replaceAll('<id>', id)).toList(),
    selections: selections.map((selection) => selection.getCopy(id)).toList(),
  );
}
