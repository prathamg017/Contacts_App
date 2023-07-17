import 'package:contacts_app/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';

// import 'package:project/add.dart';
// import 'package:project/db.dart';

import 'add.dart';
import 'info.dart';

class homepage extends StatefulWidget {
  const homepage();

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final Box = Hive.box("mybox");
  ContactsBase db = ContactsBase();

  final _name = TextEditingController();
  final _mail = TextEditingController();
  final _number = TextEditingController();
  // ContactsBase db = ContactsBase();
  void Dosave() {
    setState(() {
      db.lst.add([_name.text, _mail.text, _number.text]);
      db.update();
    });
    Navigator.of(context).pop();
    _name.clear();
    _mail.clear();
    _number.clear();
  }

  void delete(int index) {
    setState(() {
      db.lst.removeAt(index);
      db.update();
    });
  }

  // List search = [];
  @override
  void initState() {
    // search = Box.get("CONTACTS");

    if (Box.get("CONTACTS") == null) {
      db.Default();
    } else {
      db.load();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 241, 241),
      appBar: AppBar(
        title: Text("Your Contacts"),
        backgroundColor: Color.fromARGB(210, 62, 62, 62),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TextField(
          //   decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: ListView.builder(
                    itemCount: db.lst.length,
                    itemBuilder: ((context, index) => Card(
                        elevation: 6,
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) => delete(index),
                                icon: Icons.delete,
                                borderRadius: BorderRadius.circular(12),
                                backgroundColor: Colors.red,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Info(
                                              name: db.lst[index][0],
                                              mail: db.lst[index][1],
                                              number: db.lst[index][2],
                                            ))));
                              },
                              title: Text(db.lst[index][0]),
                              leading: CircleAvatar(
                                backgroundColor: Colors.amber,
                                child: Text(
                                    db.lst[index][0][0]
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                              // subtitle: Text(lst[index][2]),
                            ),
                          ),
                        )))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              tooltip: 'Add Contact',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(
                              name: _name,
                              mIl: _mail,
                              number: _number,
                              Save: Dosave,
                            )));
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
