import 'dart:ffi';

import 'package:flutter/material.dart';

    void main(){
      runApp(new Apee());
    }

    class Apee extends StatelessWidget{
      @override
      Widget build(BuildContext context) {
        return new MaterialApp(
          title: 'Todo List',
          home: new TodoList()
              );
      }
      
    }
    class TodoList extends StatefulWidget{

  @override
  TodoListState createState() {
    return new TodoListState();
  }}

  class TodoListState extends State<TodoList> {
    List<String> _todoItems = [];

    void _addTodoItem(String task) {
      if(task.length > 0){
        setState(()=>_todoItems.add(task));
      }
    }
    Widget build(BuildContext context){
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Todo List'),
        ),
        body: _buildTodoList(),
        floatingActionButton: new FloatingActionButton(
            onPressed: _pushAddTodoScreen,
            tooltip: 'Add Task',
            child: new Icon(Icons.add)
        ),
      );
    }
    void _pushAddTodoScreen(){
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (context){
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Add new Task'),
          ),
             body: new TextField(
              autofocus: true,
              onSubmitted: (val){
                _addTodoItem(val);
                Navigator.pop(context);
            },
    decoration: new InputDecoration(
      hintText: 'Enter Something',
      contentPadding: const EdgeInsets.all(16.0)
    ),
    ),
          );
    })
        );
  }
    void _removeTodoItem(int index){
      setState(() => _todoItems.removeAt(index));
    }

    void _promptRemoveTodoItem(int index){
      showDialog(context: context,builder: (BuildContext context){
        return new AlertDialog(title: new Text('Mark "${_todoItems[index]}" as done?'),actions: <Widget>[
          new FlatButton(onPressed: ()=>Navigator.of(context).pop(), child: new Text('Cancel')),
          new FlatButton(onPressed: (){_removeTodoItem(index);Navigator.of(context).pop();}, child: new Text('mark as done'))
        ]);
      }
      );
    }

    Widget _buildTodoList(){
      return new ListView.builder(itemBuilder:(context,index){
        if(index < _todoItems.length){
          return _buildTodoItem(_todoItems[index],index);
      }

      });
    }

    Widget _buildTodoItem(String todoText, int index){
      return new ListTile(title: new Text(todoText), onLongPress: ()=> _promptRemoveTodoItem(index));
    }



  /*Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('assim')),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(onPressed: _addTodoItem, tooltip: 'Add Task',child: new Icon(Icons.add),)
    );
  }*/

}