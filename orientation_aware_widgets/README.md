# Orientation aware widgets

Collection of usefull widgets having responsive behaviors depending on device orientation

[![made-with-Markdown](https://img.shields.io/badge/Made%20with-Flutter-1389FD.svg)](http://flutter.dev) ![GitHub last commit](https://img.shields.io/github/last-commit/amwebexpert/guess_the_text) ![GitHub](https://img.shields.io/github/license/amwebexpert/guess_the_text)

## Features

- `ResponsiveNavigationRailOrBar` switch between a `BottomNavigationBar` (portrait) and a `NavigationRail` (landscape)

## Getting started

The `ResponsiveNavigationRailOrBar` is a `StatelessWidget` so you need to manage yourself the state of the user selection and displayed content widget. The simplest way is using a `StatefullWidget` like the `MyHomePage` below.

## Demo

### ResponsiveNavigationRailOrBar

Android device | MacBook (macOS)
-------------- | ----------------
<img src="https://github.com/amwebexpert/guess_the_text/raw/master/orientation_aware_widgets/doc/images/ResponsiveNavigationRailOrBar-demo.gif" /> | <img src="https://github.com/amwebexpert/guess_the_text/raw/master/orientation_aware_widgets/doc/images/ResponsiveNavigationRailOrBar-demo-macOS.gif" />



## Usage


```dart
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
        return const Center(child: Text('Cloud is REMOTE'));
      case 1:
        return const Center(child: Text('Device is LOCAL'));

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
```

## Additional information

* [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html)
* [NavigationRail](https://api.flutter.dev/flutter/material/NavigationRail-class.html)

## Contributing

We accept the following contributions:

* Documentation improvements
* Fixing bugs
* Reporting issues
* Suggestions

