import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onSlidePressed;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged,
      required this.onSlidePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: onSlidePressed,
            icon: Icons.delete,
            backgroundColor: const Color.fromARGB(225, 252, 99, 88),
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
            child: Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: Color.fromARGB(255, 50, 89, 244),
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 121, 147, 251),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(25)),
      ),
    );
  }
}
