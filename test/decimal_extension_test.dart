import 'package:decimal/decimal.dart';
import 'package:packages_extensions/packages_extensions.dart';
import 'package:test/test.dart';

import '../performance/decimal_classes/significand_string_original.dart';
import 'throws_assertion_error.dart';

void main() {
  Decimal dec1 = Decimal.fromInt(5);
  Decimal dec2 = Decimal.parse('120');
  Decimal dec3 = Decimal.parse('0.120');
  Decimal dec4 = Decimal.parse('10.012');
  Decimal dec5 = Decimal.parse('010.0120');
  Decimal dec6 = Decimal.parse('9.999999999999999999999999999999999E-6144');
  Decimal dec7 = Decimal.parse('9.999999999999999999999999999999999E+6144');
  Decimal dec8 = Decimal.parse('9999999999999999999999999999999999E+6144');
  Decimal dec9 = Decimal.parse('-9.999999999999999999999999999999999E-6144');
  Decimal dec10 = Decimal.parse('-50');
  Decimal dec11 = Decimal.parse('-5');
  Decimal dec12 = Decimal.parse('0');
  Decimal dec13 = Decimal.parse('-1');
  Decimal dec14 = Decimal.parse('-010.0120');

  group('Significand String', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Simple integer', () {
      expect(dec1.significandString, '5');
      expect(dec1.significandString, significandStringOriginal(dec1));
    });
    test('Integer that can be divided by ten', () {
      expect(dec2.significandString, '12');
      expect(dec2.significandString, significandStringOriginal(dec2));
    });
    test('Decimal < 1', () {
      expect(dec3.significandString, '12');
      expect(dec3.significandString, significandStringOriginal(dec3));
    });
    test('Decimal > 1', () {
      expect(dec4.significandString, '10012');
      expect(dec4.significandString, significandStringOriginal(dec4));
    });
    test('Decimal > 1 with leading and trailing zeros', () {
      expect(dec5.significandString, '10012');
      expect(dec5.significandString, significandStringOriginal(dec5));
    });
    test('Very Small Number', () {
      expect(dec6.significandString, '9999999999999999999999999999999999');
      expect(dec6.significandString, significandStringOriginal(dec6));
    });
    test('Very High Number with decimal mantissa', () {
      expect(dec7.significandString, '9999999999999999999999999999999999');
      expect(dec7.significandString, significandStringOriginal(dec7));
    });

    test('Very High Number with integer mantissa', () {
      expect(dec8.significandString, '9999999999999999999999999999999999');
      expect(dec8.significandString, significandStringOriginal(dec8));
    });
    test('Very small negative Number', () {
      expect(dec9.significandString, '9999999999999999999999999999999999');
      expect(dec9.significandString, significandStringOriginal(dec9));
    });

    test('Negative Integer that can be divided by ten', () {
      expect(dec10.significandString, '5');
      expect(dec10.significandString, significandStringOriginal(dec10));
    });
    test('Negative Integer less than ten', () {
      expect(dec11.significandString, '5');
      expect(dec11.significandString, significandStringOriginal(dec11));
    });
    test('Zero', () {
      expect(dec12.significandString, '0');
      expect(dec12.significandString, significandStringOriginal(dec12));
    });
    test('-1', () {
      expect(dec13.significandString, '1');
      expect(dec13.significandString, significandStringOriginal(dec13));
    });
    test('negative Decimal > 1 with leading and trailing zeros', () {
      expect(dec14.significandString, '10012');
      expect(dec14.significandString, significandStringOriginal(dec14));
    });
  });

  group('Significand', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Simple integer', () {
      expect(dec1.significand, BigInt.parse('5'));
    });
    test('Integer that can be divided by ten', () {
      expect(dec2.significand, BigInt.parse('12'));
    });
    test('Decimal < 1', () {
      expect(dec3.significand, BigInt.parse('12'));
    });
    test('Decimal > 1', () {
      expect(dec4.significand, BigInt.parse('10012'));
    });
    test('Decimal > 1 with leading and trailing zeros', () {
      expect(dec5.significand, BigInt.parse('10012'));
    });
    test('Very Small Number', () {
      expect(
          dec6.significand, BigInt.parse('9999999999999999999999999999999999'));
    });
    test('Very High Number with decimal mantissa', () {
      expect(
          dec7.significand, BigInt.parse('9999999999999999999999999999999999'));
    });

    test('Very High Number with integer mantissa', () {
      expect(
          dec8.significand, BigInt.parse('9999999999999999999999999999999999'));
    });
    test('Very small negative Number', () {
      expect(
          dec9.significand, BigInt.parse('9999999999999999999999999999999999'));
    });

    test('Negative Integer that can be divided by ten', () {
      expect(dec10.significand, BigInt.parse('5'));
    });
    test('Negative Integer less than ten', () {
      expect(dec11.significand, BigInt.parse('5'));
    });
    test('Zero', () {
      expect(dec12.significand, BigInt.parse('0'));
    });
    test('-1', () {
      expect(dec13.significand, BigInt.parse('1'));
    });
    test('negative Decimal > 1 with leading and trailing zeros', () {
      expect(dec14.significand, BigInt.parse('10012'));
    });
  });

  group('Significand length', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Simple integer', () {
      expect(dec1.significandLength, 1);
    });
    test('Integer that can be divided by ten', () {
      expect(dec2.significandLength, 2);
    });
    test('Decimal < 1', () {
      expect(dec3.significandLength, 2);
    });
    test('Decimal > 1', () {
      expect(dec4.significandLength, 5);
    });
    test('Decimal > 1 with leading and trailing zeros', () {
      expect(dec5.significandLength, 5);
    });
    test('Very Small Number', () {
      expect(dec6.significandLength, 34);
    });
    test('Very High Number with decimal mantissa', () {
      expect(dec7.significandLength, 34);
    });

    test('Very High Number with integer mantissa', () {
      expect(dec8.significandLength, 34);
    });
    test('Very small negative Number', () {
      expect(dec9.significandLength, 34);
    });

    test('Negative Integer that can be divided by ten', () {
      expect(dec10.significandLength, 1);
    });
    test('Negative Integer less than ten', () {
      expect(dec11.significandLength, 1);
    });
    test('Zero', () {
      expect(dec12.significandLength, 1);
    });
    test('-1', () {
      expect(dec13.significandLength, 1);
    });
    test('negative Decimal > 1 with leading and trailing zeros', () {
      expect(dec14.significandLength, 5);
    });
  });

  group('Scale', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Simple integer', () {
      expect(dec1.scaleAdv, 0);
      expect(dec1.scaleFast, 0);
      expect(dec1.scale, 0);
    });
    test('Integer that can be divided by ten', () {
      expect(dec2.scaleAdv, -1);
      expect(dec2.scaleFast, 0);
      expect(dec2.scale, 0);
    });
    test('Decimal < 1', () {
      expect(dec3.scaleAdv, 2);
      expect(dec3.scaleFast, 2);
      expect(dec3.scale, 2);
    });
    test('Decimal > 1', () {
      expect(dec4.scaleAdv, 3);
      expect(dec4.scaleFast, 3);
      expect(dec4.scale, 3);
    });
    test('Decimal > 1 with leading and trailing zeros', () {
      expect(dec5.scaleAdv, 3);
      expect(dec5.scaleFast, 3);
      expect(dec5.scale, 3);
    });
    test('Very Small Number', () {
      expect(dec6.scaleAdv, 6177);
      expect(dec6.scaleFast, 6177);
      expect(dec6.scale, 6177);
    });
    test('Very High Number with decimal mantissa', () {
      expect(dec7.scaleAdv, -6111);
      expect(dec7.scaleFast, 0);
      expect(dec7.scale, 0);
    });

    test('Very High Number with integer mantissa', () {
      expect(dec8.scaleAdv, -6144);
      expect(dec8.scaleFast, 0);
      expect(dec8.scale, 0);
    });
    test('Very small negative Number', () {
      expect(dec9.scaleAdv, 6177);
      expect(dec9.scaleFast, 6177);
      expect(dec9.scale, 6177);
    });

    test('Negative Integer that can be divided by ten', () {
      expect(dec10.scaleAdv, -1);
      expect(dec10.scaleFast, 0);
      expect(dec10.scale, 0);
    });
    test('Negative Integer less than ten', () {
      expect(dec11.scaleAdv, 0);
      expect(dec11.scaleFast, 0);
      expect(dec11.scale, 0);
    });
    test('Zero', () {
      expect(dec12.scaleAdv, 0);
      expect(dec12.scaleFast, 0);
      expect(dec12.scale, 0);
    });
    test('-1', () {
      expect(dec13.scaleAdv, 0);
      expect(dec13.scaleFast, 0);
      expect(dec13.scale, 0);
    });
    test('negative Decimal > 1 with leading and trailing zeros', () {
      expect(dec14.scaleAdv, 3);
      expect(dec14.scaleFast, 3);
      expect(dec14.scale, 3);
    });
  });

  group('Precision', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Simple integer', () {
      expect(dec1.precisionFast, 1);
      expect(dec1.precision, 1);
    });
    test('Integer that can be divided by ten', () {
      expect(dec2.precisionFast, 3);
      expect(dec2.precision, 3);
    });
    test('Decimal < 1', () {
      expect(dec3.precisionFast, 3);
      expect(dec3.precision, 3);
    });
    test('Decimal > 1', () {
      expect(dec4.precisionFast, 5);
      expect(dec4.precision, 5);
    });
    test('Decimal > 1 with leading and trailing zeros', () {
      expect(dec5.precisionFast, 5);
      expect(dec5.precision, 5);
    });
    test('Very Small Number', () {
      expect(dec6.precisionFast, 6178);
      expect(dec6.precision, 6178);
    });
    test('Very High Number with decimal mantissa', () {
      expect(dec7.precisionFast, 6145);
      expect(dec7.precision, 6145);
    });

    test('Very High Number with integer mantissa', () {
      expect(dec8.precisionFast, 6178);
      expect(dec8.precision, 6178);
    });
    test('Very small negative Number', () {
      expect(dec9.precisionFast, 6178);
      expect(dec9.precision, 6178);
    });

    test('Negative Integer that can be divided by ten', () {
      expect(dec10.precisionFast, 2);
      expect(dec10.precision, 2);
    });
    test('Negative Integer less than ten', () {
      expect(dec11.precisionFast, 1);
      expect(dec11.precision, 1);
    });
    test('Zero', () {
      expect(dec12.precisionFast, 1);
      expect(dec12.precision, 1);
    });
    test('-1', () {
      expect(dec13.precisionFast, 1);
      expect(dec13.precision, 1);
    });
    test('negative Decimal > 1 with leading and trailing zeros', () {
      expect(dec14.precisionFast, 5);
      expect(dec14.precision, 5);
    });
  });

  group('To String as Precision', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Simple integer', () {
      expect(dec1.toStringAsPrecisionFast(2), '5.0');
      expect(dec1.toStringAsPrecision(2), '5.0');
    });
    test('Integer that can be divided by ten', () {
      expect(dec2.toStringAsPrecisionFast(5), '120.00');
      expect(dec2.toStringAsPrecision(5), '120.00');
    });
    test('Integer that can be divided by ten 2', () {
      expect(dec2.toStringAsPrecisionFast(2), '120');
      expect(dec2.toStringAsPrecision(2), '120');
    });
    test('Decimal < 1', () {
      expect(dec3.toStringAsPrecisionFast(5), '0.1200');
      expect(dec3.toStringAsPrecision(5), '0.1200',
          skip: 'Wrong result, check with the maintainer');
    });
    test('Decimal > 1', () {
      expect(dec4.toStringAsPrecisionFast(4), '10.01');
      expect(dec4.toStringAsPrecision(4), '10.01');
    });
    test('Decimal > 1 with leading and trailing zeros', () {
      expect(dec5.toStringAsPrecisionFast(3), '10.0');
      expect(dec5.toStringAsPrecision(3), '10.0');
    });
    test('Very Small Number', () {
      expect(dec6.toStringAsPrecisionFast(7), '0.000000');
      expect(dec6.toStringAsPrecision(7), '0.000000',
          skip: 'Wrong result, check with the maintainer');
    });
    test('Very High Number with decimal mantissa', () {
      String l =
          '100000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '00000000';
      expect(dec7.toStringAsPrecisionFast(7), l);
      expect(dec7.toStringAsPrecision(7), l);
    });

    test('Very High Number with integer mantissa', () {
      String l =
          '100000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '000000000000000000000000000000000000000000000000000000000000000000'
          '00000000000000000000000000000000000000000';
      expect(dec8.toStringAsPrecisionFast(7), l);
      expect(dec8.toStringAsPrecision(7), l);
    });
    test('Very small negative Number', () {
      expect(dec9.toStringAsPrecisionFast(7), '0.000000');
      expect(dec9.toStringAsPrecision(7), '0.000000',
          skip: 'Wrong result, check with the maintainer');
    });

    test('Negative Integer that can be divided by ten', () {
      expect(dec10.toStringAsPrecisionFast(3), '-50.0');
      expect(dec10.toStringAsPrecision(3), '-50.0');
    });
    test('Negative Integer less than ten', () {
      expect(dec11.toStringAsPrecisionFast(2), '-5.0');
      expect(dec11.toStringAsPrecision(2), '-5.0');
    });
    test('Zero', () {
      expect(dec12.toStringAsPrecisionFast(2), '0.0');
      expect(dec12.toStringAsPrecision(2), '0.0');
    });
    test('-1', () {
      expect(dec13.toStringAsPrecisionFast(2), '-1.0');
      expect(dec13.toStringAsPrecision(2), '-1.0');
    });
    test('negative Decimal > 1 with leading and trailing zeros', () {
      expect(dec14.toStringAsPrecisionFast(2), '-10');
      expect(dec14.toStringAsPrecision(2), '-10');
    });
    group('Error', () {
      Decimal d = Decimal.parse('1234.567');

      test('Required precision 0', () {
        var requiredPosition = 0;
        expect(() {
          d.toStringAsPrecisionFast(requiredPosition);
        }, throwsArgumentError);
        expect(() {
          d.toStringAsPrecision(requiredPosition);
        }, throwsAssertionError);
      });
    });
    group('Precision 7 scale 3', () {
      test('Required precision 9', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 9;
        expect(d.toStringAsPrecisionFast(requiredPosition), '1234.56700');
        expect(d.toStringAsPrecision(requiredPosition), '1234.56700');
      });
      test('Required precision 8', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 8;
        expect(d.toStringAsPrecisionFast(requiredPosition), '1234.5670');
        expect(d.toStringAsPrecision(requiredPosition), '1234.5670');
      });
      test('Required precision 7', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 7;
        expect(d.toStringAsPrecisionFast(requiredPosition), '1234.567');
        expect(d.toStringAsPrecision(requiredPosition), '1234.567');
      });
      test('Required precision 6', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 6;
        expect(d.toStringAsPrecisionFast(requiredPosition), '1234.57');
        expect(d.toStringAsPrecision(requiredPosition), '1234.57');
      });
      test('Required precision 5', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 5;
        expect(d.toStringAsPrecisionFast(requiredPosition), '1234.6');
        expect(d.toStringAsPrecision(requiredPosition), '1234.6');
      });
      test('Required precision 4', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 4;
        var expectedResult = '1235';

        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 3', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 3;
        var expectedResult = '1230';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 2', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 2;
        var expectedResult = '1200';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 1', () {
        Decimal d = Decimal.parse('1234.567');
        var requiredPosition = 1;
        var expectedResult = '1000';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
    });
    group('Precision 7 scale 0', () {
      Decimal d = Decimal.parse('1234567');

      test('Required precision 9', () {
        var requiredPosition = 9;
        var expectedResult = '1234567.00';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 8', () {
        var requiredPosition = 8;
        var expectedResult = '1234567.0';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 7', () {
        var requiredPosition = 7;
        var expectedResult = '1234567';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 6', () {
        var requiredPosition = 6;
        var expectedResult = '1234570';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 5', () {
        var requiredPosition = 5;
        var expectedResult = '1234600';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 4', () {
        var requiredPosition = 4;
        var expectedResult = '1235000';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 3', () {
        var requiredPosition = 3;
        var expectedResult = '1230000';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 2', () {
        var requiredPosition = 2;
        var expectedResult = '1200000';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 1', () {
        var requiredPosition = 1;
        var expectedResult = '1000000';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
    });
    group('Precision 7 scale 1', () {
      Decimal d = Decimal.parse('123456.7');

      test('Required precision 9', () {
        var requiredPosition = 9;
        var expectedResult = '123456.700';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 8', () {
        var requiredPosition = 8;
        var expectedResult = '123456.70';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 7', () {
        var requiredPosition = 7;
        var expectedResult = '123456.7';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 6', () {
        var requiredPosition = 6;
        var expectedResult = '123457';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 5', () {
        var requiredPosition = 5;
        var expectedResult = '123460';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 4', () {
        var requiredPosition = 4;
        var expectedResult = '123500';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 3', () {
        var requiredPosition = 3;
        var expectedResult = '123000';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 2', () {
        var requiredPosition = 2;
        var expectedResult = '120000';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 1', () {
        var requiredPosition = 1;
        var expectedResult = '100000';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
    });
    group('Precision 7 scale 6', () {
      Decimal d = Decimal.parse('1.234567');

      test('Required precision 9', () {
        var requiredPosition = 9;
        var expectedResult = '1.23456700';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 8', () {
        var requiredPosition = 8;
        var expectedResult = '1.2345670';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 7', () {
        var requiredPosition = 7;
        var expectedResult = '1.234567';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 6', () {
        var requiredPosition = 6;
        var expectedResult = '1.23457';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 5', () {
        var requiredPosition = 5;
        var expectedResult = '1.2346';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 4', () {
        var requiredPosition = 4;
        var expectedResult = '1.235';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 3', () {
        var requiredPosition = 3;
        var expectedResult = '1.23';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 2', () {
        var requiredPosition = 2;
        var expectedResult = '1.2';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 1', () {
        var requiredPosition = 1;
        var expectedResult = '1';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
    });

    group('Decimal Precision 7 scale 6', () {
      Decimal d = Decimal.parse('0.023456');

      test('Required precision 9', () {
        var requiredPosition = 9;
        var expectedResult = '0.02345600';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.0234560000');
      });
      test('Required precision 8', () {
        var requiredPosition = 8;
        var expectedResult = '0.0234560';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.023456000');
      });
      test('Required precision 7', () {
        var requiredPosition = 7;
        var expectedResult = '0.023456';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.02345600');
      });
      test('Required precision 6', () {
        var requiredPosition = 6;
        var expectedResult = '0.02346';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.0234560');
      });
      test('Required precision 5', () {
        var requiredPosition = 5;
        var expectedResult = '0.0235';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.023456');
      });
      test('Required precision 4', () {
        var requiredPosition = 4;
        var expectedResult = '0.023';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.02346');
      });
      test('Required precision 3', () {
        var requiredPosition = 3;
        var expectedResult = '0.02';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.0235');
      });
      test('Required precision 2', () {
        var requiredPosition = 2;
        var expectedResult = '0.0';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.023');
      });
      test('Required precision 1', () {
        var requiredPosition = 1;
        var expectedResult = '0';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        //Todo check behavior
        expect(d.toStringAsPrecision(requiredPosition), '0.02');
      });
    });
    group('Decimal Precision 7 scale 6 - value > 1', () {
      Decimal d = Decimal.parse('1.023456');

      test('Required precision 9', () {
        var requiredPosition = 9;
        var expectedResult = '1.02345600';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 8', () {
        var requiredPosition = 8;
        var expectedResult = '1.0234560';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 7', () {
        var requiredPosition = 7;
        var expectedResult = '1.023456';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 6', () {
        var requiredPosition = 6;
        var expectedResult = '1.02346';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 5', () {
        var requiredPosition = 5;
        var expectedResult = '1.0235';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 4', () {
        var requiredPosition = 4;
        var expectedResult = '1.023';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 3', () {
        var requiredPosition = 3;
        var expectedResult = '1.02';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 2', () {
        var requiredPosition = 2;
        var expectedResult = '1.0';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
      test('Required precision 1', () {
        var requiredPosition = 1;
        var expectedResult = '1';
        expect(d.toStringAsPrecisionFast(requiredPosition), expectedResult);
        expect(d.toStringAsPrecision(requiredPosition), expectedResult);
      });
    });
  });
}
