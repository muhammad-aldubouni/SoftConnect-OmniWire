import 'package:flutter/widgets.dart';
import 'package:omni_wire/core/themeing/themes.dart';
import 'package:omni_wire/presentation/widgets/side_bar.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return buildAppBuilderCanvas(context);
  }
}

Widget buildAppBuilderCanvas(BuildContext context) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: EnterpriseColors.bg,
      ),
      child: Row(children: [const Spacer(), buildRightSidebar(context)]),
    ),
  );
}
