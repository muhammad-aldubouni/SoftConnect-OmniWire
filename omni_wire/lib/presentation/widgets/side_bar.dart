import "package:omni_wire/core/themeing/themes.dart";
import "package:omni_wire/presentation/widgets/blurred_container.dart";
import "package:omni_wire/presentation/widgets/resizeable_container.dart";
import "package:state_shell/material.dart";
import "package:google_fonts/google_fonts.dart";

Widget buildRightSidebar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: ResizableContainer(
      decoration: BoxDecoration(
        color: EnterpriseColors.surface,
        boxShadow: [
          BoxShadow(
            color: EnterpriseColors.selected.withAlpha(60),
            offset: const Offset(0, 8),
            blurStyle: .normal,
            blurRadius: 30,
            spreadRadius: 1.5,
          ),
        ],

        border: Border.all(style: .solid, color: EnterpriseColors.selected),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        child: Column(
          children: [
            // Inspector Title Header
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: EnterpriseColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.tune,
                    size: 16,
                    color: EnterpriseColors.textBright,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Action Panel',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 14,
                      color: EnterpriseColors.textBright,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.4,
                          maxWidth: MediaQuery.of(context).size.width * 0.6,
                        ),
                        builder: (context) => BlurredContainer(
                          blurStrength: 2.5,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                          child: Center(child: Text("data")),
                        ),
                        // .animate(
                        //   onComplete: (controller) =>
                        //       controller.repeat(reverse: true),
                        // )
                        // .shimmer(
                        //   duration: 15.seconds,
                        //   color: EnterpriseColors.isDark
                        //       ? EnterpriseColors.panel.withAlpha(170)
                        //       : EnterpriseColors.textMuted.withAlpha(
                        //           50,
                        //         ),
                        // ),
                      );
                    },
                    icon: Icon(Icons.close, color: EnterpriseColors.textBright),
                  ),
                ],
              ),
            ),

            // Inspector Property Form Body
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: EnterpriseColors.bg,
                  borderRadius: BorderRadius.circular(20),
                ),
                // replace with actual content,
              ),
            ),

            Divider(height: 1, color: EnterpriseColors.border),
          ],
        ),
      ),
    ),
  );
}
