# React Components

## Theme primary color usage

Prefer using `Theme.of(context).colorScheme.xxxxxx` for theme related colors

#### :x: Avoid

```dart
return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.orange.withOpacity(fadingAnim.value),
      child: const MyChild(),
);
```

#### :white_check_mark: Prefer

```dart
return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(fadingAnim.value),
      child: const MyChild(),
);
```
