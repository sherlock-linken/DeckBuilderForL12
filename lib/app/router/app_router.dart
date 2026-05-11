import 'package:deck_builder_for_l12/features/cards/presentation/pages/card_list_page.dart';
import 'package:deck_builder_for_l12/features/home/presentation/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomePage.routePath,
    routes: [
      GoRoute(
        path: HomePage.routePath,
        name: HomePage.routeName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: CardListPage.routePath,
        name: CardListPage.routeName,
        builder: (context, state) => const CardListPage(),
      ),
      GoRoute(
        path: CardDetailPage.routePath,
        name: CardDetailPage.routeName,
        builder: (context, state) => const CardDetailPage(),
      ),
      GoRoute(
        path: DeckEditorPage.routePath,
        name: DeckEditorPage.routeName,
        builder: (context, state) => const DeckEditorPage(),
      ),
      GoRoute(
        path: DeckListPage.routePath,
        name: DeckListPage.routeName,
        builder: (context, state) => const DeckListPage(),
      ),
      GoRoute(
        path: DeckDetailPage.routePath,
        name: DeckDetailPage.routeName,
        builder: (context, state) => const DeckDetailPage(),
      ),
      GoRoute(
        path: ImportExportPage.routePath,
        name: ImportExportPage.routeName,
        builder: (context, state) => const ImportExportPage(),
      ),
    ],
  );
});
