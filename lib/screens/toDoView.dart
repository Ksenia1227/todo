import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/controllers/toDoController.dart';
import 'package:task2/models/todo.dart';


class ToDoView extends StatelessWidget {
  final ToDoController todoController = Get.find();
  final int? index;

  ToDoView({this.index});

  

  @override
  Widget build(BuildContext context){
    String text="";
    if(index!=null){
      text = todoController.tasks[index].text;
    }
    TextEditingController textEditingController = TextEditingController(text: text);
    return Scaffold(
      body:  Container(color: Color.fromARGB(255, 234, 232, 232), padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
              Center(
                child: Container(width: double.infinity,
    height: 100,
                  child: TextField(
                    controller: textEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Your task',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  maxLines: 50,
                      ),
              
                ),
              ),
              
            SizedBox(height: 40,),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [  SizedBox(width: 90,height: 40, child: ElevatedButton(onPressed: (){Get.back();}, 
              child:  Text('Cancel'),style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 241, 61, 124),)),
                ),
                SizedBox(width: 20,),
                SizedBox(width: 60,height: 40,child:ElevatedButton(onPressed: (){
                  if(this.index.isNull){
                  todoController.tasks.add(ToDo(text: textEditingController.text));}
                  else{
                    var editing =todoController.tasks[index];
                    editing.text=textEditingController.text;
                    todoController.tasks[index]=editing;
                  }
                  Get.back();
                }, 
                child:  Text((this.index.isNull)?"Add":"Edit") , style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 168, 55, 213)))),]

    
        )]
                ),
    ));
  }
}