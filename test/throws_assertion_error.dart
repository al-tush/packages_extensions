import 'package:test/test.dart';

/// A matcher for functions that throw ArgumentError.
///
/// See [throwsA] for objects that this can be matched against.
Matcher throwsAssertionError = throwsA(isA<AssertionError>());
