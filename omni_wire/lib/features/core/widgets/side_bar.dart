import "package:omni_wire/features/core/themeing/themes.dart";
import "package:omni_wire/features/core/widgets/blurred_container.dart";
import "package:omni_wire/features/core/widgets/resizeable_container.dart";
import "package:state_shell/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:state_shell/state_shell.dart";

Widget buildRightSidebar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: ResizableContainer(
      decoration: BoxDecoration(
        color: EnterpriseColors.surface,
        boxShadow: [
          BoxShadow(
            color: EnterpriseColors.selected,
            blurStyle: .solid,
            blurRadius: 4,
            offset: Offset(-.45, 0),
          ),
        ],

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
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.8,
                          maxWidth: MediaQuery.of(context).size.width * 0.95,
                        ),
                        builder: (context) =>
                            BlurredContainer(
                                  blurStrength: 2,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40),
                                  ),
                                  child: Center(child: Text("data")),
                                )
                                .animate(
                                  onComplete: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .shimmer(
                                  duration: 15.seconds,
                                  color: EnterpriseColors.isDark
                                      ? EnterpriseColors.panel.withAlpha(170)
                                      : EnterpriseColors.textMuted.withAlpha(
                                          50,
                                        ),
                                ),
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
                color: EnterpriseColors.bg,
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
