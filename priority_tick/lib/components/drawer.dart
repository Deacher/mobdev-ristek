import 'package:flutter/material.dart';

import 'package:priority_tick/screens/listpage.dart';
import 'package:priority_tick/screens/aboutpage.dart';

import 'package:priority_tick/components/status.dart';

/// Flutter code sample for [NavigationBar].

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  static const IconData task_outlined = IconData(0xf429, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            Status.currentPageIndex = index;
            Status.pointerPageIndex = index;
          });
        },
        selectedIndex: Status.pointerPageIndex,
        indicatorColor: Color.fromARGB(255, 64, 183, 181),
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(task_outlined),
            icon: Icon(task_outlined),
            label: 'Tasks',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body:  _getPage(Status.currentPageIndex),
    );
  }
  Widget _getPage(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = ListPage(); // Catalog Page
        break;
      case 1:
        page = AboutPage(); // Recommendation page
        break;
      default:
        page = Container(
          child: Center(
            child: Text('Error loading page'),
          ),
        );
    }
    return page;
  }
  
}

class SampleHomePage extends StatelessWidget {
  const SampleHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Home page',
            style: theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
