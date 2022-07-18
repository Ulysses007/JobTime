import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jot_timer/app/entities/project_status.dart';
import 'package:jot_timer/app/services/projects/project_service.dart';
import 'package:jot_timer/app/view_models/project_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  ProjectService _projectService;

  HomeController({required ProjectService projectService})
      : _projectService = projectService,
        super(HomeState.initial());

  Future<void> loadProjects() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final projects = await _projectService.findByStaus(state.projectFilter);
      emit(state.copyWith(status: HomeStatus.complete, projects: projects));
    } catch (e, s) {
      log('Erros ao buscar projetos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> filterStatus(ProjectStatus status) async {
    emit(
      state.copyWith(status: HomeStatus.loading, projects: []),
    );
    final projects = await _projectService.findByStaus(status);
    emit(
      state.copyWith(
        status: HomeStatus.complete,
        projects: projects,
        projectFilter: status,
      ),
    );
  }
}
