import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jot_timer/app/view_models/project_model.dart';

part 'taks_state.dart';

class TaskController extends Cubit<TaksStatus> {

  late final ProjectModel _projectModel;

  TaskController() : super(TaksStatus.initial);

  void setProject(ProjectModel projectModel) => _projectModel = projectModel;

}
