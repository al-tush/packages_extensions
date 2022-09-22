import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

extension RationalExtensionBase on Rational {
  /// Converts a Rational to a Decimal safely using the rounding priciple
  ///
  /// This methos uses a rounding principle if needed instead of a truncation
  /// like the standard one does.
  /// If the scaleOnInfinitePrecision parameter is passed, both finite and
  /// infinite values are rounded to the required scale.
  /// Otherwise finite values are left as they are and infinite are truncated
  /// at the tenth decimal.
  Decimal roundToDecimal({int? scaleOnInfinitePrecision}) => toDecimal(
      scaleOnInfinitePrecision:
          scaleOnInfinitePrecision ?? (hasFinitePrecision ? null : 10),
      toBigInt: (value) => value.round());
}
