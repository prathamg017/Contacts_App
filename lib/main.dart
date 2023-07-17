import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  // await Hive.openBox("MyBox");
  var box = await Hive.openBox("mybox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyContacts App',
      color: Color.fromARGB(255, 100, 100, 100),
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
