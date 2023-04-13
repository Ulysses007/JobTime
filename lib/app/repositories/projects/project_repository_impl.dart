import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:jot_timer/app/core/exceptions/failure.dart';
import 'package:jot_timer/app/core/ui/database/database.dart';
import 'package:jot_timer/app/entities/project.dart';
import 'package:jot_timer/app/entities/project_status.dart';
import 'package:jot_timer/app/entities/project_task.dart';

import 'project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl({required Database database}) : _database = database;
  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConnection();

      await connection.writeTxn((isar) {
        return isar.projects.put(project);
      });
    } on IsarError catch (e, s) {
      log('Error ao cadastrar projeto', error: e, stackTrace: s);
      throw Failure(message: 'Error ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findByStaus(ProjectStatus status) async {
    final connection = await _database.openConnection();
    final projects =
        await connection.projects.filter().statusEqualTo(status).findAll();
    return projects;
  }

  @override
  Future<Project> addTask(int projectId, ProjectTask task) async {
    final connection = await _database.openConnection();
    final project = await findById(projectId);

    project.tasks.add(task);

    await connection.writeTxn((isar) => project.tasks.save());

    return project;
  }

  @override
  Future<Project> findById(int projectId) async {
    final connection = await _database.openConnection();
    final project = await connection.projects.get(projectId);

    if (project == null) {
      throw Failure(message: 'Projeto não encontrado');
    }
    return project;
  }
}
