import 'package:flutter/material.dart';
import 'package:stateful/util/util_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback saveTask;
  DialogBox({super.key, required this.controller, required this.saveTask});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 100, 128, 240),
      content: Container(
          height: 150,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Add a new task"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UtilButton(
                    text: "Add",
                    onPressed: saveTask,
                  ),
                  UtilButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                      controller.clear();
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}
