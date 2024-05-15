// flutter drive \ --driver=test_driver/integration_test_driver.dart \ --target=integration_test/app_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';
import 'package:sse3401___lab5/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Account Ativation Test", (WidgetTester tester) async {
      const Duration testDuration = Duration(milliseconds: 2000);
      app.main();
      await tester.pumpAndSettle();

      final phNumFormField = find.byType(TextField);
      final checkBox = find.byType(Checkbox);
      final getCodeButton = find.byType(ElevatedButton);
      final otpFormField = find.byType(TextField);
      final activateButton = find.byType(ElevatedButton);

      await tester.pump(testDuration);
      await tester.enterText(phNumFormField, '123456789');
      await tester.tap(checkBox);
      await tester.pumpAndSettle();

      await tester.pump(testDuration);
      await tester.tap(getCodeButton);
      await tester.pumpAndSettle();

      await tester.enterText(otpFormField, '123456');
      await tester.pump(testDuration);
      await tester.tap(activateButton);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Factory 2'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Factory 1'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Factory 2'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Factory 1'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'emily francis');
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).last, '123456789');
      await tester.pumpAndSettle();

      await tester.tap(find.text('submit'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.settings).last);
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();
    });
  });
}

