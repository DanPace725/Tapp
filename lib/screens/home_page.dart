import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<String> _textList = [];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to the Home Page!',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter some text',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _textList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_textList[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _textList.add(_textEditingController.text);
            _textEditingController.clear();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
