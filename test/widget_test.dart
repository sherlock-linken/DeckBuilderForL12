import 'package:deck_builder_for_l12/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('renders home scaffold', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: DeckBuilderApp()));
    await tester.pumpAndSettle();

    expect(find.text('DeckBuilder For L12'), findsOneWidget);
    expect(find.text('v100 工程骨架已就绪'), findsOneWidget);
  });
}
