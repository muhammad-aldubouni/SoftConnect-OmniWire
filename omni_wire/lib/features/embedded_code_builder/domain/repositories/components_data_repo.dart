import 'package:omni_wire/shared/domain/entities/component.dart';

abstract class ComponentsDataRepo {
  Future<List<Component>> getComponents();
}
