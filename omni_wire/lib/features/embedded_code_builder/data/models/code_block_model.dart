import 'package:omni_wire/features/embedded_code_builder/data/models/selection_model.dart';
import 'package:omni_wire/shared/domain/entities/code_block.dart';

class CodeBlockModel {
  final String name;
  final List<String> code;
  final List<SelectionModel> selections;
  CodeBlockModel({
    required this.name,
    required this.code,
    required this.selections,
  });

  static CodeBlockModel fromJson(Map<String, dynamic> json) => CodeBlockModel(
    name: json['name'] as String,
    code: (json['code'] as List<dynamic>)
        .map((item) => item.toString())
        .toList(),
    selections:
        (json['selections'] as List<dynamic>?)
            ?.map(
              (item) => SelectionModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        [],
  );

  static CodeBlockModel fromEntity(CodeBlock codeBlock) {
    return CodeBlockModel(
      code: codeBlock.code,
      name: codeBlock.name,
      selections: codeBlock.selections.map(SelectionModel.fromEntity).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'selections': selections.map((selection) => selection.toJson()).toList(),
  };

  CodeBlock toEntity() => CodeBlock(
    name: name,
    code: List<String>.from(code),
    selections: selections.map((selection) => selection.toEntity()).toList(),
  );
}
