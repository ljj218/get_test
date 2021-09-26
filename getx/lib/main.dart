/*
 * @Author: Long_jj
 * @Date: 2021-09-02 21:46:38
 * @LastEditTime: 2021-09-26 16:09:39
 * @LastEditors: dragon
 * @Description: 
 * @FilePath: \getx\lib\main.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Other.dart';

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

class User {
  late String name;
  late int age;
  User(this.name, this.age);
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
  var list = [].obs;

  @override
  void onInit() {
    ever(count, (e) {
      print(e);
    });
    ever(list, (e) {
      // print(e);
    });
    super.onInit();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    print('build');
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
            OutlinedButton(
              onPressed: () {
                Get.to(Other());
              },
              child: Text('路由切换'),
            ),
            //局部更新
            GetX<Controller>(builder: (controller) {
              return Column(
                children: [
                  for (var i = 0; i < controller.list.length; i++)
                    Text(
                        '${controller.list[i]["name"]} - ${controller.list[i]["age"]}')
                ],
              );
            }),
            OutlinedButton(
              onPressed: () {
                c.list.add({"name": 'lijie', "age": num++});
              },
              child: Text('数组变化'),
            ),
            OutlinedButton(
              onPressed: () {
                var s = c.list.removeAt(3);
                print(s);
              },
              child: Text('数组变化'),
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
