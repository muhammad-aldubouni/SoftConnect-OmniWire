import 'package:omni_wire/core/services/di/services_registeration.dart';
import 'package:omni_wire/core/themeing/themes.dart';
import 'package:omni_wire/presentation/viewmodels/embedded_code_builder_viewmodel.dart';
import "package:state_shell/material.dart";
import 'package:omni_wire/presentation/widgets/side_bar.dart';
import 'package:omni_wire/presentation/widgets/workflow_canvas.dart';
import 'package:state_shell/state_management.dart';

class EmbeddedCodeBuilder extends StatefulWidget {
  const EmbeddedCodeBuilder({super.key});
  @override
  State<EmbeddedCodeBuilder> createState() => _EmbeddedCodeBuilderState();
}

class _EmbeddedCodeBuilderState extends State<EmbeddedCodeBuilder> {
  late final EmbeddedCodeBuilderViewmodel vm;
  @override
  void initState() {
    super.initState();
    vm = serviceContainer.get();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        notifier: vm.isReady,
        builder: () => vm.isReady.data
            ? Row(
                mainAxisAlignment: .center,
                children: [
                  // Center Panel: Visual Logic Canvas OR Generated Dart Code

                  Expanded(child: workflowCanvas(vm)),

                  // Right Panel: Inspector Properties & Simulator Console
                  Visibility(visible: true, child: buildRightSidebar(context)),
                  //  buildRightSidebar1(),
                ],
              )
            : Center(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: EnterpriseColors.textBright,
                  ),
                ),
              ),
      ),
    );
  }
}
