# Project coding standards

This section list coding patterns promoted in the project.

## Class constructor parameters

Prefer using named parameters. The advantages are:

- usage becomes self explained
- no need to order parameters

#### :x: avoid

```dart
class MyRange {
    int min;
    int max;
    MyRange(this.min, this.max);
}

final props = MyRange(4, 10);
```

#### :white_check_mark: prefer

```dart
class MyRange {
    int min;
    int max;
    MyRange({required this.min, required this.max});
}

final explicitAndSelfExplained = MyRange(min: 4,  max: 10);
final noNeedOfParamsOrdering = MyRange(max: 10,  min: 4);
```




## Theme primary color usage

Prefer using `Theme.of(context).colorScheme.xxxxxx` for theme related colors

#### :x: avoid

```dart
FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.orange.withOpacity(fadingAnim.value),
      child: const MyChild(),
);
```

#### :white_check_mark: prefer

```dart
FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(fadingAnim.value),
      child: const MyChild(),
);
```


## Classic callback definitions

Prefer using explicit typed known functions like `VoidCallback` for common callbacks

#### :x: avoid

```dart
class GameFabWidget extends StatefulWidget {
  final void Function() onPressed;
  . . .
```

#### :white_check_mark: prefer

```dart
class GameFabWidget extends StatefulWidget {
  final VoidCallback onPressed;
  . . .
```


## Calling optional functions

Use the `?.call()` for running a nullable callback function

#### :x: avoid

```dart
  Future<void> kickOffAnimation() async {
    await _animController.forward(from: 0);
    if (widget.onAnimationComplete != null) {
      widget.onAnimationComplete!();
    }
  }
```

#### :white_check_mark: prefer

```dart
  Future<void> kickOffAnimation() async {
    await _animController.forward(from: 0);
    widget.onAnimationComplete?.call();
  }
```


## Conditional child widgets

Instead of building a `List<Widgets>` before the `build` method, prefer usage of conditional expression widget. Also bear in mind to extract logic of complex `if/else` statement into dedicated method like `canIKickIt()` below to promote template readability.

#### :x: avoid

```dart
  List<Widgets> buildWithSomeLogic() {
    List<Widgets> widgets = [];

    widgets.add(oneItem);

    if (canIKickIt()) {
        widgets.add(kickTheCan);
    }

    for (item in items) {
        Text(item)
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ...buildWithSomeLogic()
```

#### :white_check_mark: prefer

```dart
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          oneItem,
          if (canIKickIt()) // the condition here should remaine a one liner simple to read expression
            kickTheCan
          for (item in items)
            Text(item)
```
