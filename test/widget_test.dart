import 'package:flutter_test/flutter_test.dart';
import 'package:nutrivision/app/app.dart';

void main() {
  testWidgets('App renders splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const NutriVisionApp());

    expect(find.text('NutriVision'), findsOneWidget);
    expect(find.text('تغذيتك الذكية بلمسة عربية'), findsOneWidget);
  });
}
