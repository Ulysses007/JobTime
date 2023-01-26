import 'package:flutter_modular/flutter_modular.dart';
import 'package:jot_timer/app/services/projects/detail/controller/project_detail_controller.dart';
import 'package:jot_timer/app/services/projects/detail/project_detail_page.dart';
import 'package:jot_timer/app/view_models/project_model.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ProjectDetailModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton((i) => ProjectDetailController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) {
          final ProjectModel projectModel = args.data;

          return ProjectDetailPage(
            controller: Modular.get()..setProject(projectModel),
          );
        })
      ];
}
