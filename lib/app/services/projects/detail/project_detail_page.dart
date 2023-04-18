import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jot_timer/app/core/ui/job_time_icons_.dart';
import 'package:jot_timer/app/entities/project_status.dart';
import 'package:jot_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:jot_timer/app/services/projects/detail/controller/project_detail_controller.dart';
import 'package:jot_timer/app/services/projects/detail/widgets/project_detail_appbar.dart';
import 'package:jot_timer/app/services/projects/detail/widgets/project_pie_chart.dart';
import 'package:jot_timer/app/services/projects/detail/widgets/project_task_tile.dart';
import 'package:jot_timer/app/view_models/project_model.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;
  const ProjectDetailPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectRegisterStatus.failure) {
            AsukaSnackbar.alert('Erro interno');
          }
        },
        builder: (context, state) {
          final projectModel = state.projectModel;

          switch (state.status) {
            case ProjectDetailStatus.initial:
              return const Center(
                child: const Text('Carregando Projeto'),
              );
            case ProjectDetailStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProjectDetailStatus.complete:
              if (projectModel != null) {
                return _bildProjectDetail(context, projectModel);
              }
              return const Center(
                child: Text('Erro ao carregar projeto'),
              );
            case ProjectDetailStatus.failure:
              if (projectModel != null) {
                return _bildProjectDetail(context, projectModel);
              }
              return const Center(
                child: Text('Erro ao carregar projeto'),
              );
          }
        },
      ),
    );
  }

  Widget _bildProjectDetail(BuildContext context, ProjectModel projectModel) {
    final totalTasks = projectModel.tasks.fold<int>(0, (totalValue, task) {
      return totalValue += task.duration;
    });
    return CustomScrollView(
      slivers: [
        ProjectDetailAppbar(
          projectModel: projectModel,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
              child: ProjectPieChart(
                  projectEstimate: projectModel.estimate,
                  totalTasks: totalTasks),
            ),
            ...projectModel.tasks
                .map((task) => ProjectTaskTile(
                      task: task,
                    ))
                .toList(),
          ]),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Visibility(
                visible: projectModel.status != ProjectStatus.finalizado,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.finishProject();
                  },
                  icon: Icon(JobTimeIcons.ok),
                  label: Text('Finalizar projeto'),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
