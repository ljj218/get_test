/*
 * @Author: Long_jj
 * @Date: 2021-09-02 21:46:38
 * @LastEditTime: 2021-09-02 22:47:34
 * @LastEditors: Long_jj
 * @Description: 
 * @FilePath: /getx/lib/main.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${c.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.snackbar(
                  'title',
                  'message',
                  snackPosition: SnackPosition.BOTTOM,
                );
                // Get.rawSnackbar(title: "ssssssss", message: "sasdadsasd");
              },
              child: Text('snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog();
              },
              child: Text('defaultDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.pink[100],
                ));
              },
              child: Text('bottomSheet'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
