import 'package:state_shell/state_shell.dart';

class IdeShellViewmodel {
  var tabsState = [false, false, false, false].toNotifier<List<bool>>();

  void viewEmbeddedCodeBuilder() => tabsState.update((value) {
    List<bool> newList = List.from(value.map((ele) => ele = false).toList());
    newList[0] = true;
    return newList;
  });

  void viewAppBuilder() => tabsState.update((value) {
    List<bool> newList = List.from(value.map((ele) => ele = false).toList());
    newList[1] = true;
    return newList;
  });
}
