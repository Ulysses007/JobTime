
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jot_timer/app/view_models/project_model.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {

ProjectDetailController(): super(ProjectDetailState.initial());

void setProject(ProjectModel projectModel){
emit(state.copyWith(projectModel: projectModel, status: ProjectDetailStatus.loading));
}
  
}