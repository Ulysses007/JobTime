// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jot_timer/app/entities/project.dart';
import 'package:jot_timer/app/entities/project_status.dart';
import 'package:jot_timer/app/view_models/projetc_task_model.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjetcTaskModel> tasks;
  ProjectModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });
  factory ProjectModel.fromEntity(Project project) {
    project.tasks.loadSync();
    return ProjectModel(
        id: project.id,
        name: project.name,
        estimate: project.estimate,
        status: project.status,
        tasks: project.tasks.map(ProjetcTaskModel.fromEntity).toList());
  }
}
