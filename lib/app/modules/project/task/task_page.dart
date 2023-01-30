import 'package:flutter/material.dart';
import 'package:jot_timer/app/modules/project/task/controller/task_controller.dart';

class TaskPage extends StatelessWidget {

  final TaskController controller;

  const TaskPage({ super.key , required this.controller}); 

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Criar nova Task'),),
           body: Container(),
       );
  }
}