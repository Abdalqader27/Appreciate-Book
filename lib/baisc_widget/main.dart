import 'package:apprentice_training/baisc_widget/fooderlich_theme%20.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

void main() {
  // 1
  runApp(const Fooderlich());
}

class Fooderlich extends StatefulWidget {
  // 2
  const Fooderlich({Key? key}) : super(key: key);

  @override
  _FooderlichState createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const Card1(),

    const Card2(),
    // TODO: Replace with Card3
    const Card3()  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      home: Scaffold(
        appBar: AppBar(title: Text('Fooderlich', style: theme.textTheme.headline6)),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card'),
            const BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card2'),
            const BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card3'),
          ],
        ),
      ),
    );
  }
}
