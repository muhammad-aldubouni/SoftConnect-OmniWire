import 'package:omni_wire/shared/domain/entities/component.dart';
import 'package:omni_wire/shared/domain/entities/condition_group.dart';
import 'package:omni_wire/shared/domain/entities/workflow.dart';
import 'package:omni_wire/features/embedded_code_builder/domain/use_cases/get_components_usecase.dart';
import 'package:state_shell/state_shell.dart';

class EmbeddedCodeBuilderViewmodel {
  Notifier<List<Component>> components = Notifier([]);
  Notifier<List<Component>> addedComponents = Notifier([]);
  Notifier<List<Workflow>> workflows = Notifier([
    Workflow(actions: [], conditions: ConditionGroup(), name: "workflow"),
    Workflow(actions: [], conditions: ConditionGroup(), name: "workflow"),
    Workflow(actions: [], conditions: ConditionGroup(), name: "workflow"),
  ]);

  final GetComponentsUsecase getComponentUsecase;
  var isReady = false.toNotifier<bool>();
  EmbeddedCodeBuilderViewmodel(this.getComponentUsecase) {
    init();
  }

  void addComponent(Component comp) =>
      addedComponents.update((value) => [...value, comp.getCopy("")]);

  Future<void> init() async {
    await Future.delayed(.5.seconds);
    components.data = await getComponentUsecase();
    components.notifyChange();
    isReady.update((data) => true);
  }
}
