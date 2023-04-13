//import 'dart:math';

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jot_timer/app/services/projects/project_service.dart';
import 'package:jot_timer/app/view_models/project_model.dart';
import 'package:jot_timer/app/view_models/projetc_task_model.dart';

part 'taks_state.dart';

class TaskController extends Cubit<TaksStatus> {

  late final ProjectModel _projectModel;
   final ProjectService _projectService; 

  TaskController({required ProjectService projectService}) : 
this._projectService = projectService,
super(TaksStatus.initial);

  void setProject(ProjectModel projectModel) => _projectModel = projectModel;


Future<void> register(String nome, int duration) async{
try {
  emit(TaksStatus.loading); 
  final task = ProjetcTaskModel(name: nome, duration: duration);
  await _projectService.addTask(_projectModel.id!, task); 
  emit(TaksStatus.success);
} catch (e , s) {
  log('Error ao salvar tarefa', error: e, stackTrace: s );
  emit(TaksStatus.failure);
}
}

}
