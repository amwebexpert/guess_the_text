import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:orientation_aware_widgets/orientation_aware_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orientation aware widgets',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late Widget _child;

  @override
  void initState() {
    super.initState();
    _child = _computeChild(_currentIndex);
  }

  Widget _computeChild(int index) {
    switch (index) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.cloud_done_outlined),
            Center(child: Text('Cloud is REMOTE')),
            Icon(Icons.cloud_done_outlined),
          ],
        );
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.save),
            Center(child: Text('Device is LOCAL')),
            Icon(Icons.save),
          ],
        );

      default:
        if (kDebugMode) {
          print('unhandled child index $index, returning default');
        }
        return const Text('REMOTE');
    }
  }

  void _onTap(int index) {
    setState(() {
      _child = _computeChild(index);
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Responsive navigation rail or tabs')),
        body: ResponsiveNavigationRailOrBar(items: [
          NavigationChoices(text: 'Cloud', icon: const Icon(Icons.cloud)),
          NavigationChoices(text: 'Device', icon: const Icon(Icons.save_alt)),
        ], currentIndex: _currentIndex, onTap: _onTap, child: _child));
  }
}
