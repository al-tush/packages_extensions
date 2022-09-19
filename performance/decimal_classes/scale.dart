import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

Rational ten = Rational.fromInt(10);

String trimRightChar(String s, String c) {
  int i = s.length - 1;
  for (; i >= 0 && s[i] == c; i--) {}
  return s.substring(0, i + 1);
}

main() {
  print(trimRightChar('abgdfty', 'y'));
  print(trimRightChar('ab000', '0'));
  print(trimRightChar('00000', '0'));
}

int scaleAlt(Decimal d) {
  if (d.isInteger) {
    return 0;
  }
  var s = d.toString();
  var t = trimRightChar(s, '0');
  int g = t.substring(s.indexOf('.') + 1, t.length).length;
  return g;
}
