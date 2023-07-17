import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  final name;
  final mail;
  final number;
  Info({required this.name, required this.mail, required this.number});

  void call() async {
    await FlutterPhoneDirectCaller.callNumber(number);
    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 241, 241),
        appBar: AppBar(
          title: Text('User Info'),
          backgroundColor: Color.fromARGB(210, 62, 62, 62),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(
                child: Text(
                  name[0].toString().toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                radius: 80,
              ),
            ),
            Divider(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                            onPressed: () {
                              call();
                              // print('object');
                            },
                            icon: Icon(Icons.call))),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                            onPressed: () {
                              // print('$mail');
                              launch('sms:$number');
                            },
                            icon: Icon(Icons.sms))),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                            onPressed: () {
                              launch('mailto:$mail');
                            },
                            icon: Icon(Icons.mail))),
                  ],
                )),
            Divider(),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [Text('name')],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [Text('mail')],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [Text('number')],
                ),
              ),
            )
          ],
        ));
  }
}
