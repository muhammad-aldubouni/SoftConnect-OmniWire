import 'package:flutter/widgets.dart';
import 'package:omni_wire/features/core/themeing/themes.dart';

class AppBuilder extends StatefulWidget {
  const AppBuilder({super.key});

  @override
  State<AppBuilder> createState() => _AppBuilderState();
}

class _AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: EnterpriseColors.bg));
  }
}
