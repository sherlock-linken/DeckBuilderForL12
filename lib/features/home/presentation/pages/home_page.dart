import 'package:deck_builder_for_l12/features/cards/presentation/pages/card_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home';
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8F3E7), Color(0xFFF1E6D1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 1100;
              final horizontalPadding = isCompact ? 20.0 : 28.0;
              final verticalPadding = isCompact ? 20.0 : 28.0;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: isCompact
                    ? _CompactHomeLayout(theme: theme)
                    : _DesktopHomeLayout(theme: theme),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _DesktopHomeLayout extends StatelessWidget {
  const _DesktopHomeLayout({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 284, child: _BrandSidebar()),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopNavBar(),
              const SizedBox(height: 22),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _HeroPanel(),
                      SizedBox(height: 22),
                      _FeatureEntrySection(),
                      SizedBox(height: 22),
                      _LowerDashboardSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CompactHomeLayout extends StatelessWidget {
  const _CompactHomeLayout({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _CompactBrandHeader(),
          SizedBox(height: 18),
          _TopNavBar(compact: true),
          SizedBox(height: 18),
          _HeroPanel(compact: true),
          SizedBox(height: 18),
          _FeatureEntrySection(compact: true),
          SizedBox(height: 18),
          _LowerDashboardSection(compact: true),
        ],
      ),
    );
  }
}

class _BrandSidebar extends StatelessWidget {
  const _BrandSidebar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: MediaQuery.sizeOf(context).height - 56,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F4E9),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFD7BF90)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A6B4F19),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'L12',
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: 66,
              height: 0.92,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF16304C),
              letterSpacing: -2.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '卡牌构筑工具',
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0xFF5E4A24),
              fontWeight: FontWeight.w600,
              letterSpacing: 2.6,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF173A5E),
              borderRadius: BorderRadius.circular(999),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3342668B),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Text(
              'NEW WEB VERSION',
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                color: const Color(0xFFF7E5BC),
                fontWeight: FontWeight.w700,
                letterSpacing: 2.2,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            '构筑由你定义\n策略因你而生',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: const Color(0xFF2F2414),
              height: 1.45,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          const _SidebarActionCard(
            icon: Icons.shield_outlined,
            title: '全卡数据',
            subtitle: '完整收录，精确检索',
          ),
          const SizedBox(height: 14),
          const _SidebarActionCard(
            icon: Icons.inventory_2_outlined,
            title: '智能构筑',
            subtitle: '规则校验，实时提示',
          ),
          const SizedBox(height: 14),
          const _SidebarActionCard(
            icon: Icons.upload_file_outlined,
            title: '导入导出',
            subtitle: '一键分享，便捷同步',
          ),
          const Spacer(),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: const LinearGradient(
                colors: [Color(0xFFEEE0C3), Color(0xFFF8F2E5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(color: const Color(0xFFD7C39B)),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 18,
                  child: Container(
                    height: 124,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF38516F), Color(0xFF18293D)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 42,
                  top: 18,
                  child: Icon(
                    Icons.castle_outlined,
                    size: 124,
                    color: const Color(0xFFB28A43).withValues(alpha: 0.75),
                  ),
                ),
                Positioned(
                  bottom: 28,
                  left: 24,
                  child: Text(
                    '王城视野',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CompactBrandHeader extends StatelessWidget {
  const _CompactBrandHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F4E9),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFD7BF90)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'L12',
            style: theme.textTheme.displaySmall?.copyWith(
              fontSize: 52,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF16304C),
              letterSpacing: -1.8,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '卡牌构筑助手',
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0xFF5D4922),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '构筑由你定义，策略因你而生',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF5F5036),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopNavBar extends StatelessWidget {
  const _TopNavBar({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 16 : 18,
        vertical: compact ? 12 : 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7EE),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE1CFAC)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12664C1F),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: compact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _TopBrandMark(),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    _NavTextChip(label: '首页', active: true),
                    _NavTextChip(label: '全卡表'),
                    _NavTextChip(label: '我的牌库'),
                  ],
                ),
                const SizedBox(height: 14),
                const _SearchStub(),
              ],
            )
          : Row(
              children: [
                const _TopBrandMark(),
                const SizedBox(width: 18),
                const _NavTextChip(label: '首页', active: true),
                const SizedBox(width: 10),
                const _NavTextChip(label: '全卡表'),
                const SizedBox(width: 10),
                const _NavTextChip(label: '我的牌库'),
                const Spacer(),
                const SizedBox(width: 280, child: _SearchStub()),
                const SizedBox(width: 14),
                Icon(
                  Icons.notifications_none,
                  color: const Color(0xFF26374A),
                  size: 20,
                ),
                const SizedBox(width: 14),
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF213D60), Color(0xFFBB9450)],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'S',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 22 : 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFD8C299)),
        gradient: const LinearGradient(
          colors: [Color(0xFFF8F1E1), Color(0xFFEEDAB6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: compact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroCopy(theme: theme, compact: compact),
                const SizedBox(height: 20),
                const _HeroVisual(compact: true),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 7,
                  child: _HeroCopy(theme: theme, compact: compact),
                ),
                const SizedBox(width: 24),
                const Expanded(flex: 5, child: _HeroVisual()),
              ],
            ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.theme, required this.compact});

  final ThemeData theme;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.82),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: const Color(0xFFD7C08F)),
          ),
          child: Text(
            '欢迎使用 L12',
            style: theme.textTheme.labelLarge?.copyWith(
              color: const Color(0xFF17375C),
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          '构筑由你定义\n策略因你而生',
          style: theme.textTheme.displaySmall?.copyWith(
            fontSize: compact ? 34 : 46,
            height: 1.08,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF24190E),
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            '专业的 L12 牌库构筑工具。先完成快速浏览，再逐步接入构筑规则、收藏同步与导入导出能力。',
            style: theme.textTheme.titleMedium?.copyWith(
              color: const Color(0xFF5F4F34),
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _HeroTag(label: '桌面优先'),
            _HeroTag(label: '本地优先'),
            _HeroTag(label: '快速构筑'),
          ],
        ),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: compact ? 1.45 : 1.18,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: const LinearGradient(
            colors: [Color(0xFF2B4B70), Color(0xFF101E31)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x44172A43),
              blurRadius: 22,
              offset: Offset(0, 14),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -18,
              top: 18,
              child: Icon(
                Icons.auto_awesome,
                size: compact ? 84 : 112,
                color: const Color(0xFFF1C879).withValues(alpha: 0.78),
              ),
            ),
            Positioned(
              left: 26,
              top: 24,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                child: const Icon(
                  Icons.castle,
                  color: Color(0xFFF5D18A),
                  size: 28,
                ),
              ),
            ),
            Positioned(
              left: 26,
              right: 26,
              bottom: 28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '王城视野',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '从全卡检索到牌库管理，先把最核心的构筑工作流跑通。',
                    style: TextStyle(
                      color: Color(0xFFE5EAF1),
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureEntrySection extends StatelessWidget {
  const _FeatureEntrySection({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final cards = [
      _EntryCardData(
        title: '浏览全卡表',
        subtitle: '按费用、阵营与类型快速筛选',
        buttonLabel: '前往浏览',
        icon: Icons.style_outlined,
        onTap: () => context.pushNamed(CardListPage.routeName),
      ),
      _EntryCardData(
        title: '新建牌库',
        subtitle: '从主宰与阵营规则开始构筑',
        buttonLabel: '开始构筑',
        icon: Icons.add_box_outlined,
        onTap: () => context.pushNamed(DeckEditorPage.routeName),
      ),
      _EntryCardData(
        title: '导入牌库',
        subtitle: '从代码文本或分享文本快速恢复',
        buttonLabel: '立即导入',
        icon: Icons.download_for_offline_outlined,
        onTap: () => context.pushNamed(ImportExportPage.routeName),
      ),
    ];

    return _SectionFrame(
      title: '三大核心入口',
      subtitle: '把最常用的首页操作收敛到一屏内，先完成浏览与构筑起手。',
      child: compact
          ? Column(
              children: [
                for (var i = 0; i < cards.length; i++) ...[
                  _FeatureEntryCard(data: cards[i]),
                  if (i != cards.length - 1) const SizedBox(height: 14),
                ],
              ],
            )
          : Row(
              children: [
                for (var i = 0; i < cards.length; i++) ...[
                  Expanded(child: _FeatureEntryCard(data: cards[i])),
                  if (i != cards.length - 1) const SizedBox(width: 14),
                ],
              ],
            ),
    );
  }
}

class _LowerDashboardSection extends StatelessWidget {
  const _LowerDashboardSection({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final recentDecks = const _RecentDecksCard();
    final quickHelp = const _QuickHelpCard();
    final highlights = const _HighlightsCard();

    if (compact) {
      return Column(
        children: [
          recentDecks,
          const SizedBox(height: 16),
          quickHelp,
          const SizedBox(height: 16),
          highlights,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: recentDecks),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child: Column(
            children: [quickHelp, SizedBox(height: 16), highlights],
          ),
        ),
      ],
    );
  }
}

class _SectionFrame extends StatelessWidget {
  const _SectionFrame({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7EE),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFDFCBA5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x126D4D1F),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF221A10),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF64543A),
              height: 1.55,
            ),
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class _FeatureEntryCard extends StatelessWidget {
  const _FeatureEntryCard({required this.data});

  final _EntryCardData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCF5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE4D2AE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF173A5E),
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x2D18365D),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Icon(data.icon, color: const Color(0xFFF4D28C), size: 28),
          ),
          const SizedBox(height: 18),
          Text(
            data.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0xFF20170D),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF6D5A38),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          FilledButton(
            onPressed: data.onTap,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF9A6A1A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(data.buttonLabel),
          ),
        ],
      ),
    );
  }
}

class _RecentDecksCard extends StatelessWidget {
  const _RecentDecksCard();

  @override
  Widget build(BuildContext context) {
    return _SectionFrame(
      title: '最近编辑的牌库',
      subtitle: '继续上次未完成的构筑，或者快速回到最近调过的套牌。',
      child: Column(
        children: [
          _RecentDeckRow(
            title: '北境狂战士 · 控制流',
            subtitle: '更新于 10 分钟前',
            metric: '60/60',
            onTap: () => context.pushNamed(DeckDetailPage.routeName),
          ),
          const SizedBox(height: 12),
          _RecentDeckRow(
            title: '帝国弓兵换血士',
            subtitle: '更新于 2 小时前',
            metric: '62/60',
            onTap: () => context.pushNamed(DeckDetailPage.routeName),
          ),
          const SizedBox(height: 12),
          _RecentDeckRow(
            title: '精灵快攻构筑',
            subtitle: '更新于 3 天前',
            metric: '58/60',
            onTap: () => context.pushNamed(DeckListPage.routeName),
          ),
        ],
      ),
    );
  }
}

class _QuickHelpCard extends StatelessWidget {
  const _QuickHelpCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _SectionFrame(
      title: '快捷帮助',
      subtitle: '规则和使用提示先放首页，减少第一次上手阻力。',
      child: Column(
        children: [
          _MiniActionTile(
            icon: Icons.history_edu_outlined,
            title: '牌库推进',
            subtitle: '先从识别可抽卡位开始',
            onTap: () => context.pushNamed(DeckEditorPage.routeName),
          ),
          const SizedBox(height: 12),
          _MiniActionTile(
            icon: Icons.help_outline,
            title: '常见问题',
            subtitle: '稍后写成完整说明页',
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '常见问题页暂未接入，当前先保留入口。',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HighlightsCard extends StatelessWidget {
  const _HighlightsCard();

  @override
  Widget build(BuildContext context) {
    return _SectionFrame(
      title: '当前阶段目标',
      subtitle: '首页已经进入正式视觉阶段，后续重点开始替换真实数据。',
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HighlightLine(text: '首页已切到正式布局基线'),
          SizedBox(height: 10),
          _HighlightLine(text: '页面主流程跳转已打通'),
          SizedBox(height: 10),
          _HighlightLine(text: '下一步接首页真实牌库数据'),
        ],
      ),
    );
  }
}

class _NavTextChip extends StatelessWidget {
  const _NavTextChip({required this.label, this.active = false});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF173A5E) : const Color(0xFFF7EFDE),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: active ? const Color(0xFF173A5E) : const Color(0xFFDCC79F),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? const Color(0xFFF4E0B0) : const Color(0xFF56452A),
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _TopBrandMark extends StatelessWidget {
  const _TopBrandMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF173A5E),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        'L12',
        style: TextStyle(
          color: Color(0xFFF3E1B6),
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.6,
        ),
      ),
    );
  }
}

class _SearchStub extends StatelessWidget {
  const _SearchStub();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2D3B5)),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 18, color: Color(0xFF8A7653)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              '搜索卡牌、牌库...',
              style: TextStyle(color: Color(0xFF9A8865), fontSize: 13),
            ),
          ),
          Icon(Icons.tune, size: 18, color: Color(0xFF8A7653)),
        ],
      ),
    );
  }
}

class _HeroTag extends StatelessWidget {
  const _HeroTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.84),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFDCC690)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF5C4825),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SidebarActionCard extends StatelessWidget {
  const _SidebarActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCF6),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE1D0AC)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF4E7C8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF966B23)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF2E2313),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF79684A),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentDeckRow extends StatelessWidget {
  const _RecentDeckRow({
    required this.title,
    required this.subtitle,
    required this.metric,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String metric;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: const Color(0xFFFFFCF6),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFF173A5E),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.auto_awesome_motion_outlined,
                  color: Color(0xFFF1D18D),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF20180E),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF7A684B),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                metric,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF173A5E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniActionTile extends StatelessWidget {
  const _MiniActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: const Color(0xFFFFFCF6),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1E4C4),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: const Color(0xFF8E6521)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF231A0F),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF7A694B),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF836C46)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HighlightLine extends StatelessWidget {
  const _HighlightLine({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 7),
          child: Icon(Icons.circle, size: 8, color: Color(0xFFB07F2A)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF5F5036),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _EntryCardData {
  const _EntryCardData({
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String buttonLabel;
  final IconData icon;
  final VoidCallback onTap;
}
