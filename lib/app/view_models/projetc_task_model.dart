// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jot_timer/app/entities/project_task.dart';

class ProjetcTaskModel {
  int? id;
  String name; 
 int duration; 
  ProjetcTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });
factory ProjetcTaskModel.fromEntity(ProjectTask task){
  return ProjetcTaskModel(id: task.id,name: task.name, duration: task.duration);
}
}
