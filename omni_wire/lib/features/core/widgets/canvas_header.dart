import "package:omni_wire/features/core/themeing/themes.dart";
import "package:omni_wire/features/ide_shell/presentation/ide_shell_viewmodel.dart";
import "package:state_shell/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:state_shell/state_shell.dart";

Widget buildCanvasHeader(IdeShellViewmodel vm) {
  return Container(
    height: 48,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurStyle: BlurStyle.solid,
          blurRadius: 7,
          offset: Offset(0, 1.0),
          color: EnterpriseColors.selected,
        ),
      ],
      borderRadius: BorderRadius.circular(20),
      color: EnterpriseColors.surface,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: EnterpriseColors.bg,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: EnterpriseColors.panel),
              ),
              child: Observer(
                notifier: vm.tabsState,
                builder: () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTabBtn(
                      'Visual Canvas',
                      Icons.account_tree,
                      vm.tabsState.data[0],
                      vm.viewEmbeddedCodeBuilder,
                    ),

                    _buildTabBtn(
                      'App Builder',
                      Icons.construction,
                      vm.tabsState.data[1],
                      vm.viewAppBuilder,
                    ),
                    _buildTabBtn(
                      'Visual Canvas',
                      Icons.account_tree,
                      vm.tabsState.data[2],
                      () {},
                    ),
                    _buildTabBtn(
                      'Generated Dart',
                      Icons.code,
                      vm.tabsState.data[3],
                      () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Top Header Action Buttons
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: EnterpriseColors.triggerAccent,
            side: BorderSide(color: EnterpriseColors.triggerAccent),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
          onPressed: () {},
          icon: const Icon(Icons.add, size: 20),
          label: Text(
            'New Workflow',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: EnterpriseColors.operatorAnd,
            // foregroundColor: EnterpriseColors.textPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          onPressed: () {},
          icon: const Icon(Icons.play_arrow, size: 20),
          label: Text(
            'Upload',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildTabBtn(
  String label,
  IconData icon,
  bool active,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child:
          Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: active
                      ? EnterpriseColors.selected
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      size: 18,
                      color: active ? Colors.white : EnterpriseColors.textMuted,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 11,
                        color: active
                            ? Colors.white
                            : EnterpriseColors.textMuted,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              )
              .animate(key: UniqueKey())
              .animateWhere(
                condition: active,
                animation: ((animate) => animate.scaleXY(
                  duration: 100.milliseconds,
                  begin: 1,
                  end: 1.05,
                )),
              ),
    ),
  );
}
