

import 'package:flutter_modular/flutter_modular.dart';
import 'package:jot_timer/app/services/projects/detail/project_detail_page.dart';

class ProjectDetailModule extends Module {
  
@override
  // TODO: implement routes
  List<ModularRoute> get routes => [ ChildRoute('/', child: (context, args) => ProjectDetailPage())];
}