import 'package:isar/isar.dart';
import 'package:jot_timer/app/entities/project_status.dart';

class ProjectStatusConverter extends TypeConverter<ProjectStatus, int> {
  const ProjectStatusConverter();

  @override
  ProjectStatus fromIsar(int object) {
    return ProjectStatus.values[object];
  }

  @override
  int toIsar(ProjectStatus object) {
    return object.index;
  }
}
