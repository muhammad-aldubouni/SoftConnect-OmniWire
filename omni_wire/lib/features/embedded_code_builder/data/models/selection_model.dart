import 'package:omni_wire/shared/domain/entities/selection.dart';

class SelectionModel {
  final String name;
  final String replace;
  final String inputType;
  final String? range;
  final List<(String, String)>? items;
  final String value;

  SelectionModel({
    required this.name,
    required this.replace,
    required this.inputType,
    required this.range,
    required this.items,
    required this.value,
  });

  static SelectionModel fromJson(Map<String, dynamic> json) => SelectionModel(
    name: json['name'] as String,
    replace: json['replace'] as String,
    inputType: json['input_type'] as String,
    range: json['range'] as String?,
    items: (json['items'] as List<dynamic>?)?.map((entry) {
      final list = entry as List<dynamic>;
      return (list[0] as String, list[1] as String);
    }).toList(),
    value: json["value"] as String,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'replace': replace,
    'input_type': inputType,
    'range': range,
    'items': items?.map((entry) => [entry.$1, entry.$2]).toList(),
    'value': value,
  };

  Selection toEntity() => Selection(
    name: name,
    replace: replace,
    inputType: inputType,
    range: range,
    items: items,
    value: value,
  );

  factory SelectionModel.fromEntity(Selection selection) => SelectionModel(
    name: selection.name,
    replace: selection.replace,
    inputType: selection.inputType,
    range: selection.range,
    items: selection.items,
    value: selection.value,
  );
}
