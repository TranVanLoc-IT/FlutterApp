import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyProductList(title: "Product page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// statefull: edit, update, dynamic widget
class MyProductList extends StatefulWidget {
  const MyProductList({super.key,required this.title});
  final String title;
 
 @override
 State<MyProductList> createState() => _MyProductListState();
}
// vì dùng statefull cho productlist nên phải có class state cho nó
class _MyProductListState extends State<MyProductList>
{
  int _counter = 0;
  double calculateTotalPrice()=> this._counter*54000000;
  void incrementCounter(){
    setState(() {
      _counter += 1;
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: <Widget>[
          MyProductBox(productName: "Iphone 15 promax", price: 54000000, description: "Sang chảnh, quí phái"),
          MyProductBox(productName: "Iphone 15 promax", price: 54000000, description: "Sang chảnh, quí phái"),
          MyProductBox(productName: "Iphone 15 promax", price: 54000000, description: "Sang chảnh, quí phái"),
          MyProductBox(productName: "Iphone 15 promax", price: 54000000, description: "Sang chảnh, quí phái"),
          MyProductBox(productName: "Iphone 15 promax", price: 54000000, description: "Sang chảnh, quí phái"),
          Center(
            child: Text("Total products: ${this._counter} - Total price: ${this.calculateTotalPrice()}"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: Icon(Icons.add),
        tooltip: "Add product"
      ),
    );
  }
}
// stateless: immutable, phần tử không thay đổi trạng thái, tĩnh
class MyProductBox extends StatelessWidget{
  const MyProductBox({super.key, required this.productName, required this.price, required this.description});

  final String description;
  final double price;
  final String productName;
  @override 
  Widget build(BuildContext context)
  {
      return Container(
  padding: EdgeInsets.all(5),

  height: 120,
  child: Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset("ip15.jpg"), // Make sure the path is correct
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.productName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                Text(this.price.toString(), style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black)),
                Text(this.description)
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
        title: Text(widget.title),
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
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'Đây là text',
              // decrease the Alpha value from 0 -> 255 to see the text
              style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 95, 95, 221)),
              textDirection: TextDirection.ltr,
              
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.home),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
