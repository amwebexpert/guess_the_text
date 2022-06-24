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