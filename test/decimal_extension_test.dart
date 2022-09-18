import 'package:decimal/decimal.dart';
import 'package:packages_extensions/packages_extensions.dart';
import 'package:test/test.dart';

import '../performance/decimal_classes/scale.dart';
import '../performance/decimal_classes/significand_string_original.dart';

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
      expect(scaleAdv(dec1), 0);
      expect(dec1.scaleExt, 0);
      expect(dec1.scale, 0);
    });
    test('Integer that can be divided by ten', () {
      expect(scaleAdv(dec2), -1);
      expect(dec2.scaleExt, 0);
      expect(dec2.scale, 0);
    });
    test('Decimal < 1', () {
      expect(scaleAdv(dec3), 2);
      expect(dec3.scaleExt, 2);
      expect(dec3.scale, 2);
    });
    test('Decimal > 1', () {
      expect(scaleAdv(dec4), 3);
      expect(dec4.scaleExt, 3);
      expect(dec4.scale, 3);
    });
    test('Decimal > 1 with leading and trailing zeros', () {
      expect(scaleAdv(dec5), 3);
      expect(dec5.scaleExt, 3);
      expect(dec5.scale, 3);
    });
    test('Very Small Number', () {
      expect(scaleAdv(dec6), 6177);
      expect(dec6.scaleExt, 6177);
      expect(dec6.scale, 6177);
    });
    test('Very High Number with decimal mantissa', () {
      expect(scaleAdv(dec7), -6111);
      expect(dec7.scaleExt, 0);
      expect(dec7.scale, 0);
    });

    test('Very High Number with integer mantissa', () {
      expect(scaleAdv(dec8), -6144);
      expect(dec8.scaleExt, 0);
      expect(dec8.scale, 0);
    });
    test('Very small negative Number', () {
      expect(scaleAdv(dec9), 6177);
      expect(dec9.scaleExt, 6177);
      expect(dec9.scale, 6177);
    });

    test('Negative Integer that can be divided by ten', () {
      expect(scaleAdv(dec10), -1);
      expect(dec10.scaleExt, 0);
      expect(dec10.scale, 0);
    });
    test('Negative Integer less than ten', () {
      expect(scaleAdv(dec11), 0);
      expect(dec11.scaleExt, 0);
      expect(dec11.scale, 0);
    });
    test('Zero', () {
      expect(scaleAdv(dec12), 0);
      expect(dec12.scaleExt, 0);
      expect(dec12.scale, 0);
    });
    test('-1', () {
      expect(scaleAdv(dec13), 0);
      expect(dec13.scaleExt, 0);
      expect(dec13.scale, 0);
    });
    test('negative Decimal > 1 with leading and trailing zeros', () {
      expect(scaleAdv(dec14), 3);
      expect(dec14.scaleExt, 3);
      expect(dec14.scale, 3);
    });
  });
}
