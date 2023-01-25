import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jot_timer/app/core/ui/job_time_icons_.dart';
import 'package:jot_timer/app/view_models/project_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectTile({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/project/detail', arguments: projectModel);
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: 90),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueAccent, width: 4),
        ),
        child: Column(
          children: [
            _ProjectName(projectModel: projectModel),
            _ProjectProgress(projectModel: projectModel),
          ],
        ),
      ),
    );
  }
}

class _ProjectName extends StatelessWidget {
  final ProjectModel projectModel;
  const _ProjectName({required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(projectModel.name),
          Icon(
            JobTimeIcons.arrow_right,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class _ProjectProgress extends StatelessWidget {
  final ProjectModel projectModel;

  const _ProjectProgress({required this.projectModel});

  @override
  Widget build(BuildContext context) {
    final totalTasks = projectModel.tasks.fold<int>(
        0, ((previousValue, element) => previousValue += element.duration));

    var percent = 0.0;

    if (totalTasks > 0) {
      percent = totalTasks / projectModel.estimate;
    }
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: percent,
                backgroundColor: Colors.blueAccent[100],
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${projectModel.estimate}h'),
            ),
          ],
        ),
      ),
    );
  }
}
