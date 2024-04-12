import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список дел'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('xelo'),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/todo');
              },
              child: Text('перейти в список дел'))
        ],
      ),
    );
  }
}
