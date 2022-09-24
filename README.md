# packages_extensions

This is a collection of extension methods fro classes that are not part of the core Dart language.
At present we have extensions for Decimal and Rational classes.

## Features

### Decimal

The DecimalExtensionsBase class contains the following methods:

- isNegative
- isZero
- significand
- significandLength
- significandString
- scaleFast
- scaleAdv
- precisionFast
- toStringAsPrecisionFast

### Rational

The StringExtensionBase class contains the following methods:

- roundToDecimal

## Getting started

Simply import the package and use the packages_extensions libray or area ones.

## Usage

```dart
Decimal.from(-1000000001).isNegative;
```

See the example folder for more examples

## Additional information

File issues on the [github repository](https://github.com/giorgiofran/packages_extensions/issues)
