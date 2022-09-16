import 'package:flutter/material.dart';

class ProjectTaskTile extends StatelessWidget {
  const ProjectTaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Row(
        children: [
          Text(
            'Ulysses Martins',
            style: TextStyle(color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
