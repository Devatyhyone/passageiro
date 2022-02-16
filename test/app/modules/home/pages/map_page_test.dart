import 'package:passageiro/app/modules/home/pages/map_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

main() {
  group('MapPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(MapPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}