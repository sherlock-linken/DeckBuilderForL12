import 'package:deck_builder_for_l12/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('renders home scaffold', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: DeckBuilderApp()));
    await tester.pumpAndSettle();

    expect(find.text('L12'), findsWidgets);
    expect(find.text('三大核心入口'), findsOneWidget);
    expect(find.text('浏览全卡表'), findsOneWidget);
  });
}
