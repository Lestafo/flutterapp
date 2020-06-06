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

    void _addTodoItem() {
      setState(() {
        int index = _todoItems.length;
        _todoItems.add('Item' + index.toString());
      });
    }

    Widget _buildTodoList(){
      return new ListView.builder(itemBuilder:(context,index){
        if(index < _todoItems.length){
          return _buildTodoItem(_todoItems[index]);
      }

      });
    }

    Widget _buildTodoItem(String todoText){
      return new ListTile(title: new Text(todoText));
    }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('assim')),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(onPressed: _addTodoItem, tooltip: 'Add Task',child: new Icon(Icons.add),)
    );
  }

}