import 'package:decimal/decimal.dart';
import 'package:packages_extensions/packages_extensions.dart';
import 'decimal_classes/scale.dart';
import 'milliseconds_performance.dart';
import 'decimal_classes/significand_string_original.dart';

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

void main(List<String> args) {
  millisecondsPerformance('Init method', () {
    dec1.significandString;
    dec2.significandString;
    dec3.significandString;
    dec4.significandString;
    dec5.significandString;
    dec6.significandString;
    dec7.significandString;
    dec8.significandString;
    dec9.significandString;
    dec10.significandString;
  });

  millisecondsPerformance('significandString Standard', () {
    for (int i = 0; i < 100; i++) {
      dec1.significandString;
      dec2.significandString;
      dec3.significandString;
      dec4.significandString;
      dec5.significandString;
      dec6.significandString;
      dec7.significandString;
      dec8.significandString;
      dec9.significandString;
      dec10.significandString;
    }
  });

  millisecondsPerformance('significandString Original', () {
    for (int i = 0; i < 100; i++) {
      significandStringOriginal(dec1);
      significandStringOriginal(dec2);
      significandStringOriginal(dec3);
      significandStringOriginal(dec4);
      significandStringOriginal(dec5);
      significandStringOriginal(dec6);
      significandStringOriginal(dec7);
      significandStringOriginal(dec8);
      significandStringOriginal(dec9);
      significandStringOriginal(dec10);
    }
  });

  millisecondsPerformance('scale Standard', () {
    for (int i = 0; i < 30; i++) {
      dec1.scale;
      dec2.scale;
      dec3.scale;
      dec4.scale;
      dec5.scale;
      dec6.scale;
      dec7.scale;
      dec8.scale;
      dec9.scale;
      dec10.scale;
    }
  });

  millisecondsPerformance('scale Ext', () {
    for (int i = 0; i < 30; i++) {
      dec1.scaleExt;
      dec2.scaleExt;
      dec3.scaleExt;
      dec4.scaleExt;
      dec5.scaleExt;
      dec6.scaleExt;
      dec7.scaleExt;
      dec8.scaleExt;
      dec9.scaleExt;
      dec10.scaleExt;
    }
  });
  millisecondsPerformance('scale Adv', () {
    for (int i = 0; i < 30; i++) {
      scaleAdv(dec1);
      scaleAdv(dec2);
      scaleAdv(dec3);
      scaleAdv(dec4);
      scaleAdv(dec5);
      scaleAdv(dec6);
      scaleAdv(dec7);
      scaleAdv(dec8);
      scaleAdv(dec9);
      scaleAdv(dec10);
    }
  });
}
