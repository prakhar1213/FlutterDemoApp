import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/bottomNavigationController.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Colors.green,
        primaryTextTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
      title: _title,
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  final BottomNavigationController navi = Get.put(BottomNavigationController());
  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    const Text(
      'Get Trained',
    ),
    const Text(
      'Post',
    ),
    const Text("Tools"),
    const Text("More")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: GetX<BottomNavigationController>(
              builder: (_) {
                return _widgetOptions.elementAt(_.navigation.value.index);
              },
            )),
            bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: GetX<BottomNavigationController>(
                  builder: ((controller) {
                    return BottomNavigationBar(
                      items: bottomBar.map((e) {
                        return BottomNavigationBarItem(
                            icon: Icon(e['icon'] as IconData),
                            label: e["label"].toString(),
                            backgroundColor: Colors.black);
                      }).toList(),
                      currentIndex: controller.navigation.value.index,
                      selectedItemColor: Colors.green,
                      onTap: (int index) {
                        navi.updateIndex(index);
                      },
                    );
                  }),
                ))));
  }
}

const bottomBar = [
  {
    "icon": Icons.home,
    "label": "Home",
  },
  {
    "icon": Icons.chat_bubble_outline,
    "label": "Get Trained",
  },
  {
    "icon": Icons.add,
    "label": "Post",
  },
  {
    "icon": Icons.calculate_outlined,
    "label": "Tools",
  },
  {
    "icon": Icons.more_horiz,
    "label": "More",
  },
];
