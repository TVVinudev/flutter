
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: todoList(),
  ));
}

List data = [];
List values = [];
final _controller = TextEditingController();

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}

class _todoListState extends State<todoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]),
            leading: Checkbox(
                value: values[index],
                onChanged: ((bool? value) {
                  setState(() {
                    values[index] = !values[index];
                  });
                })),
            trailing: IconButton(onPressed: () {
              if(values[index] == true){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    actions: [
                      Container(
                        child: TextField(
                          controller: _controller,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  if (_controller.text.isNotEmpty) {
                                 data[index] = _controller.text;
                                    values.add(false);
                                    _controller.clear();
                                  }
                                });
                              },
                              child: Text('Add'))
                        ],
                      ),
                    ],
                  );
                });
              }


            }, icon: Icon(Icons.update)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actions: [
                      Container(
                        child: TextField(
                          controller: _controller,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  if (_controller.text.isNotEmpty) {
                                    data.add(_controller.text);
                                    values.add(false);
                                    _controller.clear();
                                  }
                                });
                              },
                              child: Text('Add'))
                        ],
                      ),
                    ],
                  );
                });
          }),
    );
  }
}


