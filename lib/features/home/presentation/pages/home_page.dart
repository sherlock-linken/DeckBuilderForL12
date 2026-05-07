import 'package:deck_builder_for_l12/core/constants/app_constants.dart';
import 'package:deck_builder_for_l12/shared/presentation/widgets/app_shell_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home';
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppShellScaffold(
      title: AppConstants.appTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('v100 工程骨架已就绪', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 12),
          Text('下一步按开发计划接入卡牌标准化、全卡表和卡牌详情。', style: theme.textTheme.bodyLarge),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _FeatureCard(title: '全局壳', description: '已完成统一主题、路由入口和基础页面容器。'),
              _FeatureCard(
                title: '数据接入',
                description: '待接入 cards.raw.json 和类型标准化映射。',
              ),
              _FeatureCard(title: '首批页面', description: '下一阶段实现首页、全卡表和卡牌详情页。'),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 280,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.titleLarge),
              const SizedBox(height: 10),
              Text(description, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
