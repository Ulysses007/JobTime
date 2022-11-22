import 'package:flutter/material.dart';
import 'package:jot_timer/app/core/ui/job_time_icons_.dart';
import 'package:jot_timer/app/services/projects/detail/widgets/project_detail_appbar.dart';
import 'package:jot_timer/app/services/projects/detail/widgets/project_pie_chart.dart';
import 'package:jot_timer/app/services/projects/detail/widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: ProjectPieChart(),
              ),
              ProjectTaskTile(),
              ProjectTaskTile(),
              ProjectTaskTile(),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(JobTimeIcons.ok),
                  label: Text('Finalizar projeto'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
