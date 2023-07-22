// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:emeklilik/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
 // <-- Proje adınıza göre düzenleyin

void main() {
  testWidgets('Emeklilik yaşını doğru şekilde hesaplıyor mu', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final ageTextFieldFinder = find.byType(TextField);
    final calculateButtonFinder = find.text('Emeklilik Yaşını Hesapla');

    expect(ageTextFieldFinder, findsOneWidget);
    expect(calculateButtonFinder, findsOneWidget);

    await tester.enterText(ageTextFieldFinder, '30'); // Test için yaş girin
    await tester.tap(calculateButtonFinder);
    await tester.pump();

    final resultTextFinder = find.text('Emeklilik Yaşınız: 35');
    expect(resultTextFinder, findsOneWidget);
  });
}
