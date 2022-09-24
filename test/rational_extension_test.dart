import 'package:decimal/decimal.dart';
import 'package:packages_extensions/packages_extensions.dart';
import 'package:rational/rational.dart';
import 'package:test/test.dart';

import 'throws_assertion_error.dart';

void main() {
  Rational rational1 = Rational.fromInt(5);
  Rational rational2 = Rational.parse('120');
  Rational rational3 = Rational.parse('0.120');

  Rational rational6 =
      Rational.parse('-9.999999999999999999999999999999999E-6144');

  Rational rational11 = Rational.parse('3');
  Rational rational13 = Rational.parse('-2');

  group('Round To Decimal', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Simple integer', () {
      expect(rational1.roundToDecimal(), Decimal.fromInt(5));
      expect(rational1.toDecimal(), Decimal.fromInt(5));
    });
    test('Integer that can be divided by ten', () {
      expect(rational2.roundToDecimal(), Decimal.parse('120'));
      expect(rational2.toDecimal(), Decimal.parse('120'));
    });
    test('Decimal < 1', () {
      expect(rational3.roundToDecimal(), Decimal.parse('0.12'));
      expect(rational3.roundToDecimal(scaleOnInfinitePrecision: 1),
          Decimal.parse('0.12'));
      expect(rational3.roundToDecimal(scaleOnInfinitePrecision: 0),
          Decimal.parse('0.12'));

      expect(rational3.toDecimal(), Decimal.parse('0.12'));
      expect(rational3.toDecimal(scaleOnInfinitePrecision: 1),
          Decimal.parse('0.12'));
      expect(rational3.toDecimal(scaleOnInfinitePrecision: 0),
          Decimal.parse('0.12'));
    });
    test('Infinite', () {
      expect((rational13 / rational11).roundToDecimal(),
          Decimal.parse('-0.6666666667'));
      expect(
          (rational13 / rational11).roundToDecimal(scaleOnInfinitePrecision: 5),
          Decimal.parse('-0.66667'));
      expect(
          (rational13 / rational11).roundToDecimal(scaleOnInfinitePrecision: 0),
          -Decimal.one);

      expect(() {
        (rational13 / rational11).toDecimal();
      }, throwsAssertionError);
      expect((rational13 / rational11).toDecimal(scaleOnInfinitePrecision: 5),
          Decimal.parse('-0.66666'));
      expect((rational13 / rational11).toDecimal(scaleOnInfinitePrecision: 0),
          Decimal.zero);
    });

    test('Very Small Negative Number', () {
      expect(rational6.roundToDecimal(scaleOnInfinitePrecision: 3),
          Decimal.parse('-9.999999999999999999999999999999999E-6144'));
      expect(rational6.toDecimal(scaleOnInfinitePrecision: 3),
          Decimal.parse('-9.999999999999999999999999999999999E-6144'));
    });
  });
}
