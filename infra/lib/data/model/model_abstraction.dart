import '../../infra.dart';

abstract class Model {
  Model fromJson(Map<String, dynamic> json);
  Map<String, dynamic> get toJson;
  Entity get toEntity;
}
