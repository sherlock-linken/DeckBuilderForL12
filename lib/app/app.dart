import 'package:deck_builder_for_l12/app/router/app_router.dart';
import 'package:deck_builder_for_l12/app/theme/app_theme.dart';
import 'package:deck_builder_for_l12/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeckBuilderApp extends ConsumerWidget {
  const DeckBuilderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
    );
  }
}
