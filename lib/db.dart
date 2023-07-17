import 'package:hive/hive.dart';

class ContactsBase {
  //reference our box

  List lst = [];
  final MyBox = Hive.box("mybox");

  void Default() {
    lst = [
      ["name", "mail", '9855'],
      ["pratham", "@", '2661']
    ];
  }

  void load() {
    lst = MyBox.get("CONTACTS");
  }

  void update() {
    MyBox.put("CONTACTS", lst);
  }
}
