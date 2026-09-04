import 'package:omni_wire/shared/domain/entities/component.dart';
import 'package:omni_wire/features/embedded_code_builder/domain/repositories/components_data_repo.dart';

class GetComponentsUsecase {
  final ComponentsDataRepo repo;
  GetComponentsUsecase({required this.repo});
  Future<List<Component>> call() => repo.getComponents();
}
