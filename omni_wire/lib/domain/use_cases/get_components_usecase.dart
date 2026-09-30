import 'dart:developer';

import 'package:omni_wire/domain/entities/component.dart';
import 'package:omni_wire/domain/repositories/components_data_repo.dart';

class GetComponentsUsecase {
  final ComponentsDataRepo repo;
  GetComponentsUsecase({required this.repo});
  Future<List<Component>> call() async {
    try {
      return await repo.getComponents();
    } catch (e) {
      log("Error(0) --> ${e.toString()}");
      return [];
    }
  }
}
