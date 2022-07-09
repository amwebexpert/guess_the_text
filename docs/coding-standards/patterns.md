# React Components

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

#### :heavy_check_mark: prefer

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

#### :heavy_check_mark: prefer

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

#### :heavy_check_mark: prefer

```dart
  Future<void> kickOffAnimation() async {
    await _animController.forward(from: 0);
    widget.onAnimationComplete?.call();
  }
```
