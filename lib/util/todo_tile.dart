import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskname,
    required this.taskComplete,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [

              //checkbox
              Checkbox(
                value: taskComplete,
                onChanged: onChanged,
                activeColor: Colors.greenAccent,
              ),

              //task name
              Text(
                taskname,
                style: TextStyle(decoration: taskComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
