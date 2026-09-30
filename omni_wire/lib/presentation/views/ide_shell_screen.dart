import 'package:omni_wire/presentation/views/app_builder.dart';
import 'package:omni_wire/core/services/di/services_registeration.dart';
import 'package:omni_wire/core/themeing/themes.dart';
import 'package:omni_wire/presentation/widgets/navigation_bar.dart';
import 'package:omni_wire/presentation/widgets/canvas_header.dart';
import 'package:omni_wire/presentation/views/embedded_code_builder.dart';
import 'package:omni_wire/presentation/viewmodels/ide_shell_viewmodel.dart';
import 'package:state_shell/material.dart';
import 'package:state_shell/state_management.dart';

class IDEShell extends StatefulWidget {
  const IDEShell({super.key});

  @override
  State<IDEShell> createState() => _IDEShellState();
}

class _IDEShellState extends State<IDEShell> {
  late final IdeShellViewmodel vm;

  @override
  void initState() {
    vm = serviceContainer.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: EnterpriseColors.bg,
        child: Column(
          mainAxisAlignment: .start,
          spacing: 0,
          children: [
            buildTopNavBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildCanvasHeader(vm),
            ),
            const SizedBox(height: 10),
            Observer(
              notifier: vm.tabsState,
              builder: () {
                if (vm.tabsState.data[0]) {
                  return EmbeddedCodeBuilder();
                } else if (vm.tabsState.data[1]) {
                  return AppBuilder();
                } else {
                  return Expanded(
                    child: Center(
                      child: Icon(
                        Icons.construction_outlined,
                        size: 80,
                        color: EnterpriseColors.textBright,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
