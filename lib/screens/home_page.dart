import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tapp/models/task.dart';
final supabase = Supabase.instance.client;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        backgroundColor: Colors.grey[800], // Set app bar background color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // Set rounded corner radius
          ),
        ),
        title: const Text('Home Page'),
      ),
      backgroundColor: Colors.grey[900], // Set background color
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20,
            ),
            SizedBox(
              width: 250, // Set border radius  of text field
              child: TextField(
                style: const TextStyle(color: Colors.white
                ),
                controller: _textEditingController,                
                decoration: InputDecoration(
                  hintText: 'Enter some text',
                  hintStyle: const TextStyle(color: Colors.white54
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  setState(() {
                    _textList.add(value);
                    _textEditingController.clear();
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _textList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_textList[index]),
                    textColor: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final value = _textEditingController.text;
          try {
            final response =
                await supabase.from('task_table').insert({'description': value});
            // Insert was successful
            if (response.noSuchMethod(invocation)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('Error inserting task: ${response.error!.message}'),
                  backgroundColor: Colors.red,
                ),
              );
            } 
            else {
              setState(() {
                _textList.add(value);
                _textEditingController.clear();
              });
            }
          } 
          catch (e) {
            // Insert failed
            print('Error: $e'); 
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
