import 'package:omni_wire/domain/entities/component.dart';

abstract class ComponentsDataRepo {
  Future<List<Component>> getComponents();
}
