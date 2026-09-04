import 'package:omni_wire/features/embedded_code_builder/data/data_sources/components_datasource.dart';
import 'package:omni_wire/features/embedded_code_builder/data/data_sources/components_datasource_imp.dart';
import 'package:omni_wire/features/embedded_code_builder/data/repositories/components_data_repo_imp.dart';
import 'package:omni_wire/features/embedded_code_builder/domain/repositories/components_data_repo.dart';
import 'package:omni_wire/features/embedded_code_builder/domain/use_cases/get_components_usecase.dart';
import 'package:omni_wire/features/embedded_code_builder/presentation/embedded_code_builder_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:omni_wire/features/ide_shell/presentation/ide_shell_viewmodel.dart';
import 'package:state_shell/app_shell.dart';

final GetIt serviceContainer = GetIt.instance;

void registerServices() async {
  serviceContainer.registerLazySingleton(() => const App());
  serviceContainer.registerLazySingleton<ComponentsDatasource>(
    () => ComponentsDatasourceImp(),
  );
  serviceContainer.registerLazySingleton<ComponentsDataRepo>(
    () => ComponentsDataRepoImp(datasource: serviceContainer.get()),
  );
  serviceContainer.registerLazySingleton<IdeShellViewmodel>(
    () => IdeShellViewmodel(),
  );
  serviceContainer.registerLazySingleton<GetComponentsUsecase>(
    () => GetComponentsUsecase(repo: serviceContainer.get()),
  );
  serviceContainer.registerLazySingleton<EmbeddedCodeBuilderViewmodel>(
    () => EmbeddedCodeBuilderViewmodel(serviceContainer.get()),
  );
}
