import 'package:omni_wire/features/embedded_code_builder/data/data_sources/components_datasource.dart';
import 'package:omni_wire/features/embedded_code_builder/data/models/component_model.dart';
import 'package:omni_wire/shared/domain/entities/component.dart';
import 'package:omni_wire/features/embedded_code_builder/domain/repositories/components_data_repo.dart';

class ComponentsDataRepoImp implements ComponentsDataRepo {
  final ComponentsDatasource datasource;

  ComponentsDataRepoImp({required this.datasource});

  @override
  Future<List<Component>> getComponents() async {
    List<Component> components = [];
    List<Map<String, dynamic>> mapList = await datasource.fetchComponents();
    components = mapList
        .map((ele) => ComponentModel.fromJson(ele).toEntity())
        .toList();
    return components;
  }
}
