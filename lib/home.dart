import 'package:flutter/material.dart';
import 'package:walltest/widgets.dart';
import 'package:walltest/tabs/home_tab.dart';
import 'package:walltest/tabs/explore_tab.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _currentIndex = 0;
  final tabs = [
    const Center(
          child: HomeTab()
    ),
    const Center(
      child: MyHomePage(title: '',)
    ),
     Center(
      child: Container(
        color: Colors.red,
      ),
    ),
    Center(
      child: Container(
        color: Colors.orange,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Category'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('About'),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
