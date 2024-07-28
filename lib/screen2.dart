
import 'package:flutter/material.dart';
import 'package:tamagotchi/main.dart';

class Screen2 extends StatefulWidget{
  @override
  _Screen2State createState() => _Screen2State();
}

enum GOAL {incomplete, done, failed}

class _ListObject {
  late String task;
  late GOAL taskStatus;
  late DateTime taskTime;
  late int taskPoints;
}

class _Screen2State extends State<Screen2> {
  final todolist = <_ListObject>[];
  var todolistPrint = <String?>[];
  int itemNum = 0;
  void _timeCheck(_ListObject listObject) {
    setState(() {
      var now = DateTime.now();
      if (listObject.taskTime.isBefore(now)) {
        listObject.taskStatus = GOAL.failed;
      }
    });
  }

  void _listAdd() {
    setState(() {
      var newObject = _ListObject();
      var now = DateTime.now();
      newObject.task = itemNum.toString();
      newObject.taskStatus = GOAL.incomplete;
      newObject.taskTime = now.add(const Duration(days: 1));
      newObject.taskPoints = 100;
      todolist.add(newObject);
      todolistPrint.add(newObject.task + ". Status: " + newObject.taskStatus.toString()
          + ", Complete by: " + newObject.taskTime.toString() + ", Points: " + newObject.taskPoints.toString() +"\n");
      //this print statement is temporary until the point and time-keeping systems are implemented.
      itemNum++;
    });
  }

  void _listRemove() {
    setState(() {
      todolist.removeLast();
      todolistPrint.removeLast();
      itemNum--;
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('To Do List'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The current list:',
            ),
            Text(
              '$todolistPrint',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
                onPressed: _listRemove,
                child: const Text('Remove item')
            ),
            TextButton(
                onPressed: _listAdd,
                child: const Text('Add item')
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
