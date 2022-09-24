import 'package:decimal/decimal.dart';
import 'package:packages_extensions/packages_extensions.dart';
import 'package:rational/rational.dart';

void main() {
  Rational rationalInfinite = Rational.one / Rational.fromInt(3);

  Decimal dec1 = Decimal.parse('-19037.0045');

  // Ratiobal
  print(rationalInfinite.roundToDecimal()); // 0.333333333
  // Decimal
  print(dec1.isNegative); // true
  print(dec1.significandString); // 190370045
  print(dec1.scaleFast); // 4
  print(dec1.precisionFast); // 9
  print(dec1.toStringAsPrecision(7)); // -19037.00
}
