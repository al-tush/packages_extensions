import 'package:decimal/decimal.dart';
import 'package:packages_extensions/src/decimal_extension_base.dart';
import 'package:power_extensions/big_int_extension.dart';
import 'package:rational/rational.dart';

Rational ten = Rational.fromInt(10);

int scaleAdv(Decimal d) {
  if (d.toRational().denominator == BigInt.one) {
    return d.toRational().numerator.scale;
  }
  return d.scaleExt;
}
