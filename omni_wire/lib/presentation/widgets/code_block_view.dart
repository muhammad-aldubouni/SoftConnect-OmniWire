import 'package:state_shell/material.dart';
import 'package:omni_wire/core/themeing/themes.dart';
import 'package:omni_wire/domain/entities/code_block.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeBlockView extends StatelessWidget {
  final void Function() onPressed;
  final CodeBlock codeBlock;
  const CodeBlockView({
    super.key,
    required this.onPressed,
    required this.codeBlock,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: EnterpriseColors.panel,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 70) {
                  return const SizedBox(height: 40);
                }

                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: Icon(
                        color: EnterpriseColors.green,
                        Icons.data_object,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      constraints: const BoxConstraints.tightFor(
                        width: 40,
                        height: 40,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        size: 18,
                        color: EnterpriseColors.textBright,
                      ),
                    ),
                  ],
                );
              },
            ),

            ...() {
              var widgetList = <Widget>[];
              for (var selection in codeBlock.selections) {
                widgetList.add(
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 3,
                      children: [
                        Text(
                          "${selection.name} --> ",
                          style: GoogleFonts.jetBrainsMono(
                            color: EnterpriseColors.paramColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        Text(
                          "{selection.value}",
                          style: GoogleFonts.jetBrainsMono(
                            color: EnterpriseColors.equalColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return widgetList;
            }(),
            const Padding(padding: EdgeInsetsGeometry.only(bottom: 10)),
          ],
        ),
      ),
    );
  }
}
