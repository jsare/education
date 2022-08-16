import 'package:flutter/material.dart';

class ValueKeyExample2 extends StatefulWidget {
  const ValueKeyExample2({Key? key}) : super(key: key);

  @override
  State<ValueKeyExample2> createState() => _ValueKeyExample2State();
}

class _ValueKeyExample2State extends State<ValueKeyExample2> {
  bool showEmail = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('VlaueKey Example 2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showEmail)
              const TextField(
                key: ValueKey('email'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            SizedBox(height: 10),
            const TextField(
              key: ValueKey('username'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.people),
                labelText: 'Username',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: Colors.grey,
          textStyle: TextStyle(fontSize: 20),
        ),
        icon: Icon(Icons.visibility_off),
        label: Text('Remove Email'),
        onPressed: () => setState(() => showEmail = false),
      ),
    );
  }
}
