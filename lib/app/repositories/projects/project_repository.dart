import 'package:jot_timer/app/entities/project.dart';
import 'package:jot_timer/app/entities/project_status.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStaus(ProjectStatus status);
}
