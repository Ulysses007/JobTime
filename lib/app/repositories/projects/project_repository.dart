import 'package:jot_timer/app/entities/project.dart';
import 'package:jot_timer/app/entities/project_status.dart';
import 'package:jot_timer/app/entities/project_task.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStaus(ProjectStatus status);
  Future<Project> findById(int projectId);
  Future<Project> addTask(int projectId, ProjectTask task);
}
