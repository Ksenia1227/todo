import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/controllers/toDoController.dart';
import 'package:task2/screens/toDoView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ToDoController todoController = Get.put(ToDoController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('To Do List'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: SizedBox(
                          width: 80,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(ToDoView());
                              }, child: const Text("Add")))),
                  SizedBox(
                    width: 20,
                  ),
                  Container(width: double.infinity,
    height: 300,
                    child: Obx(() => ListView.builder(
                          itemCount: todoController.tasks.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(todoController.tasks[index].text),
                            leading: Checkbox(
                              value: todoController.tasks[index].done,
                              onChanged: (v) {
                                var changed = todoController.tasks[index];
                                changed.done = v ?? false;
                                todoController.tasks[index] = changed;

                              },
                            ),
                            trailing: IconButton(onPressed: (){
                              Get.to(ToDoView(index: index));
                            }, icon: Icon(Icons.edit))
                          ),
                          
                        )),
                  )
                ])));
  }
}
