import 'package:isar/isar.dart';
import 'package:jot_timer/app/entities/converts/project_status_converter.dart';
import 'package:jot_timer/app/entities/project_status.dart';
import 'package:jot_timer/app/entities/project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
@Id()  
int? id;

late String name;
late int estimate;

@ProjectStatusConverter()
late ProjectStatus status;

final tasks = IsarLinks<ProjectTask>();
}