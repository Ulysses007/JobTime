import 'package:jot_timer/app/entities/project.dart';
import 'package:jot_timer/app/entities/project_status.dart';
import 'package:jot_timer/app/repositories/projects/project_repository.dart';
import 'package:jot_timer/app/view_models/project_model.dart';

import './project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectRepository;

  ProjectServiceImpl({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;
    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStaus(ProjectStatus status) async {
    final projects = await _projectRepository.findByStaus(status);
    return projects.map(ProjectModel.fromEntity).toList();
  }
}
