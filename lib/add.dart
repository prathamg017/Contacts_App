import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final name;
  final mIl;
  final number;
  VoidCallback Save;
  Details(
      {required this.name,
      required this.mIl,
      required this.number,
      required this.Save});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 241, 241),
      appBar: AppBar(
        title: Text('Add Contacts'),
        backgroundColor: Color.fromARGB(210, 62, 62, 62),
        actions: [
          TextButton(
              onPressed: Save,
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  child: Icon(
                    Icons.person,
                    size: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        // focusColor: Color.fromARGB(255, 17, 163, 75),
                        hintText: 'Enter your Name....',
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    controller: mIl,
                    decoration: InputDecoration(
                        hintText: 'Enter your mail...',
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    controller: number,
                    decoration: InputDecoration(
                        hintText: 'Enter your Number...',
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                ),
                // FloatingActionButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => Details()));
                //   },
                //   child: Text('Submit'),
                // )
              ]),
        ),
      ),
    );
  }
}
