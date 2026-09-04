class Selection {
  final String name;
  final String replace;
  final String inputType;
  final String? range;
  String value;
  final List<(String, String)>? items;

  Selection({
    required this.name,
    required this.replace,
    required this.inputType,
    required this.range,
    required this.items,
    required this.value,
  });

  Selection getCopy(String id) => Selection(
    name: name.replaceAll('<id>', id),
    replace: replace.replaceAll('<id>', id),
    inputType: inputType,
    range: range,
    items: items,
    value: value,
  );
}
