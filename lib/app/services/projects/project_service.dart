import 'package:jot_timer/app/entities/project_status.dart';
import 'package:jot_timer/app/view_models/project_model.dart';

abstract class ProjectService {
 Future<void>register( ProjectModel projectModel);
Future<List<ProjectModel>> findByStaus(ProjectStatus status);
}