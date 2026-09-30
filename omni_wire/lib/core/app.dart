import "package:omni_wire/core/services/di/services_registeration.dart";
import "package:omni_wire/presentation/views/ide_shell_screen.dart";
import "package:state_shell/app_shell.dart";
import "package:state_shell/material.dart";

void startApp() async {
  registerServices();
  App app = serviceContainer.get();

  app.darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 57, 7, 99),
    ),
  );
  app.run(
    appRoot: () => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: Scaffold(body: IDEShell()),
    ),
  );
  app.useSystemTheme();
}
