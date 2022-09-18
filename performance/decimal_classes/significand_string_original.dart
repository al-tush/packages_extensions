import 'package:decimal/decimal.dart';
import 'package:power_extensions/big_int_extension.dart';

/// retuns the significand String representation
String significandStringOriginal(Decimal d) {
  var s = _removeTrailingZeros(d);
  var idx = 0;
  for (; idx < s.length; idx++) {
    if (s[idx] != '0') {
      return s.substring(idx, s.length);
    }
  }
  return '0';
}

/// Remove Trailing Zeros
/// -- Private method
/// Returns a normalized string without trailing zeros
String _removeTrailingZeros(Decimal d) {
  String s;
  if (d.toRational().denominator.isPowerOfTen) {
    s = d.toRational().numerator.abs().toString();
  } else {
    s = d.abs().toString().replaceAll('.', '');
  }
  var idx = s.length - 1;
  for (; idx > 0; idx--) {
    if (s[idx] != '0') {
      return s.substring(0, idx + 1);
    }
  }
  return s.substring(0, 1);
}
