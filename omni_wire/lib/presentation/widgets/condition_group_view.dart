import 'package:state_shell/material.dart';
import 'package:omni_wire/core/enums/logical_operation.dart';
import 'package:omni_wire/core/themeing/themes.dart';
import 'package:omni_wire/presentation/widgets/button.dart';
import 'package:google_fonts/google_fonts.dart';

class ConditionGroupView extends StatelessWidget {
  final List<Widget> childs;
  final void Function() onPressed;
  final LogicalOperation operation;
  final bool isRoot;
  const ConditionGroupView({
    super.key,
    this.isRoot = false,
    required this.onPressed,
    required this.operation,
    required this.childs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          width: 2.5,
          color: operation == .and
              ? EnterpriseColors.operatorAnd
              : EnterpriseColors.operatorOr,
        ),
        borderRadius: BorderRadius.circular(20),
        color: EnterpriseColors.bg,
      ),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 10,

              crossAxisAlignment: .start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      operation == .and
                          ? EnterpriseColors.operatorAnd
                          : EnterpriseColors.operatorOr,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    operation == .and ? "AND" : "OR",
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.white,
                      fontWeight: .w900,
                    ),
                  ),
                ),
                const Spacer(),
                Button(label: 'Add Condition', onPressed: () {}),
                Button(label: 'Add Group', onPressed: () {}),
                Visibility(
                  visible: !isRoot,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.close),
                    color: EnterpriseColors.textBright,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(spacing: 10, children: childs),
          ),
        ],
      ),
    );
  }
}
