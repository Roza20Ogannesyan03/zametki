import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todo = [];
  String _userToDo = "";

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('menu'),
          ),
          body: Row(
            //Padding(padding: EdgeInsets.all(30));

            children: [
              Padding(padding: EdgeInsets.all(30)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Text('главная')),
              Padding(padding: EdgeInsets.all(30)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/todo', (route) => false);
                  },
                  child: Text('список'))
            ],
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    todo.addAll(['milk', 'coffee', 'bread']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список дел'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        actions: [IconButton(onPressed: _menuOpen, icon: Icon(Icons.menu))],
      ),
      body: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (BuildContext context, int ind) {
          return Dismissible(
            key: UniqueKey(),
            child: Card(
              child: ListTile(
                title: Text(todo[ind]),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.auto_awesome_outlined,
                    color: Colors.deepPurple,
                  ),
                  onPressed: () {
                    setState(() {
                      todo.removeAt(ind);
                    });
                  },
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                todo.removeAt(ind);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add element'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todo.add(_userToDo);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
