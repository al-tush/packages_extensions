import 'package:decimal/decimal.dart';
import 'package:power_extensions/power_extensions.dart';

int scaleAlt(Decimal d) {
  if (d.isInteger) {
    return 0;
  }
  var s = d.toString();
  var t = s.trimRightChar('0');
  int g = t.substring(s.indexOf('.') + 1, t.length).length;
  return g;
}
