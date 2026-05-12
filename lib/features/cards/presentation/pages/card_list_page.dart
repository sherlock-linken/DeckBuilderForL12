import 'package:deck_builder_for_l12/shared/presentation/widgets/app_shell_scaffold.dart';
import 'package:deck_builder_for_l12/shared/presentation/widgets/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardListPage extends StatelessWidget {
  const CardListPage({super.key});

  static const routeName = 'card-list';
  static const routePath = '/cards';

  @override
  Widget build(BuildContext context) {
    return AppShellScaffold(
      title: '全卡表',
      actions: [
        FilledButton.icon(
          onPressed: () => context.pushNamed(CardDetailPage.routeName),
          icon: const Icon(Icons.open_in_new),
          label: const Text('查看详情'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DemoHeroBanner(
            icon: Icons.style_outlined,
            title: '卡牌浏览中心',
            description: '按阵营、费用与类型快速浏览卡牌，并查看卡牌详情。',
            chips: ['共 251 张', '阵营筛选', '费用筛选', '排序'],
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 980;
              const sideColumn = Column(
                children: [
                  DemoBlock(
                    title: '统计信息区',
                    icon: Icons.pie_chart_outline,
                    subtitle: '查看当前筛选结果中的阵营与类型分布。',
                    lines: ['当前命中：36', '军团：18', '战术：11', '主宰：2'],
                  ),
                  SizedBox(height: 16),
                  DemoBlock(
                    title: '当前编辑上下文',
                    icon: Icons.edit_note,
                    subtitle: '在构筑流程中保留当前牌库信息，便于直接加入卡牌。',
                    lines: ['牌库名：奥丁中速试作', '阵营：阿斯加德', '已选张数：27 / 40'],
                  ),
                ],
              );

              final mainColumn = Column(
                children: [
                  const DemoBlock(
                    title: '搜索与筛选区',
                    icon: Icons.tune,
                    subtitle: '按关键字、阵营、类型、费用和排序条件快速定位卡牌。',
                    lines: ['关键词：奥丁', '阵营：天廷 / 太阳城 / 彼界', '类型：军团 / 战术 / 主宰'],
                  ),
                  const SizedBox(height: 16),
                  DemoBlock(
                    title: '卡牌列表区',
                    icon: Icons.view_agenda_outlined,
                    subtitle: '列表项点击后进入卡牌详情',
                    footer: '支持继续浏览、查看详情与加入牌库。',
                    child: Column(
                      children: [
                        _CardRow(
                          name: '圣枪巡礼者',
                          meta: '天廷阵营 · 军团 · 费用 3',
                          onTap: () =>
                              context.pushNamed(CardDetailPage.routeName),
                        ),
                        const SizedBox(height: 12),
                        _CardRow(
                          name: '暮光誓约',
                          meta: '阿斯加德阵营 · 战术 · 费用 2',
                          onTap: () =>
                              context.pushNamed(CardDetailPage.routeName),
                        ),
                        const SizedBox(height: 12),
                        _CardRow(
                          name: '黄泉守门人',
                          meta: '彼界阵营 · 军团 · 费用 5',
                          onTap: () =>
                              context.pushNamed(CardDetailPage.routeName),
                        ),
                      ],
                    ),
                  ),
                ],
              );

              if (isNarrow) {
                return Column(
                  children: [
                    mainColumn,
                    const SizedBox(height: 16),
                    sideColumn,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: mainColumn),
                  const SizedBox(width: 16),
                  const Expanded(flex: 2, child: sideColumn),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({super.key});

  static const routeName = 'card-detail';
  static const routePath = '/cards/detail';

  @override
  Widget build(BuildContext context) {
    return AppShellScaffold(
      title: '卡牌详情',
      actions: [
        OutlinedButton.icon(
          onPressed: () => context.pushNamed(DeckEditorPage.routeName),
          icon: const Icon(Icons.playlist_add),
          label: const Text('加入当前牌库'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DemoHeroBanner(
            icon: Icons.auto_awesome,
            title: '圣枪巡礼者',
            description: '查看卡牌信息、效果说明与构筑参考。',
            chips: ['天廷阵营', '军团', '费用 3'],
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 980;
              const imageBlock = DemoBlock(
                title: '卡图展示区',
                icon: Icons.image_outlined,
                subtitle: '展示卡图、稀有度与所属卡包信息。',
                lines: ['卡图预览', '版本 / 稀有度', '来源包信息'],
              );
              const infoColumn = Column(
                children: [
                  DemoBlock(
                    title: '卡牌信息区',
                    icon: Icons.info_outline,
                    subtitle: '展示名称、类型、费用、阵营、关键字等',
                    lines: ['名称：圣枪巡礼者', '类型：军团', '费用：3', '来源：S01'],
                  ),
                  SizedBox(height: 16),
                  DemoBlock(
                    title: '效果文本区',
                    icon: Icons.notes,
                    subtitle: '展示规则文本、备注和构筑提示',
                    lines: ['效果：登场时，使一个友方单位获得 +1 攻击。', '构筑提示：适合中速和铺场体系。'],
                  ),
                ],
              );

              if (isNarrow) {
                return const Column(
                  children: [imageBlock, SizedBox(height: 16), infoColumn],
                );
              }

              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: imageBlock),
                  SizedBox(width: 16),
                  Expanded(flex: 2, child: infoColumn),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CardRow extends StatelessWidget {
  const _CardRow({required this.name, required this.meta, required this.onTap});

  final String name;
  final String meta;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: const Color(0xFFF7F4EC),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 72,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9DEC7),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.style, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(meta, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class DeckEditorPage extends StatelessWidget {
  const DeckEditorPage({super.key});

  static const routeName = 'deck-editor';
  static const routePath = '/decks/editor';

  @override
  Widget build(BuildContext context) {
    return AppShellScaffold(
      title: '牌库编辑',
      actions: [
        FilledButton.icon(
          onPressed: () => context.pushNamed(ImportExportPage.routeName),
          icon: const Icon(Icons.import_export),
          label: const Text('导入导出'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DemoHeroBanner(
            icon: Icons.auto_fix_high,
            title: '奥丁中速试作',
            description: '在统一工作台内完成构筑、说明、统计与历史查看。',
            chips: ['阵营：阿斯加德', '主宰：奥丁', '构筑中'],
          ),
          const SizedBox(height: 20),
          const _EditorTabStrip(),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 1080;
              final mainColumn = Column(
                children: [
                  const DemoBlock(
                    title: '当前牌库工作区',
                    icon: Icons.badge_outlined,
                    subtitle: '展示牌库名称、阵营、主宰、状态与当前可抽取张数。',
                    lines: ['牌库名：奥丁中速试作', '状态：草稿', '可抽取：27 / 40', '更新时间：刚刚'],
                  ),
                  const SizedBox(height: 16),
                  const DemoBlock(
                    title: '固定卡牌区',
                    icon: Icons.push_pin_outlined,
                    subtitle: '展示按规则确定的固定卡牌内容。',
                    lines: ['主城：英灵圣殿', '主宰：奥丁', '天灾：诸神黄昏'],
                  ),
                  const SizedBox(height: 16),
                  DemoBlock(
                    title: '可抽取卡牌区',
                    icon: Icons.layers_outlined,
                    subtitle: '查看当前牌表中的可抽取卡牌，并直接调整数量。',
                    footer: '支持增减卡牌、删除卡牌与进入卡牌详情。',
                    child: Column(
                      children: [
                        _DeckRow(
                          title: '圣枪巡礼者 x2',
                          subtitle: '军团 · 费用 3',
                          onTap: () =>
                              context.pushNamed(CardDetailPage.routeName),
                        ),
                        const SizedBox(height: 12),
                        _DeckRow(
                          title: '暮光誓约 x3',
                          subtitle: '战术 · 费用 2',
                          onTap: () =>
                              context.pushNamed(CardDetailPage.routeName),
                        ),
                        const SizedBox(height: 12),
                        _DeckRow(
                          title: '天启驭雷者 x1',
                          subtitle: '军团 · 费用 6',
                          onTap: () =>
                              context.pushNamed(CardDetailPage.routeName),
                        ),
                      ],
                    ),
                  ),
                ],
              );

              final sideColumn = Column(
                children: [
                  const DemoBlock(
                    title: '卡池检索与加卡工作区',
                    icon: Icons.rule_folder_outlined,
                    subtitle: '保留当前牌库上下文，快速继续搜索、筛选与补充卡牌。',
                    lines: ['当前模式：带编辑上下文', '已选张数：27 / 40', '默认阵营筛选：阿斯加德'],
                  ),
                  const SizedBox(height: 16),
                  const DemoBlock(
                    title: '实时统计与校验',
                    icon: Icons.query_stats,
                    subtitle: '实时汇总当前张数、类型分布与合法性状态。',
                    lines: ['军团：14', '战术：9', '装备：3', '当前状态：草稿'],
                  ),
                  const SizedBox(height: 16),
                  DemoBlock(
                    title: '快捷操作',
                    icon: Icons.task_alt_outlined,
                    subtitle: '快速进入加卡、详情、保存和导入导出流程。',
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        FilledButton.icon(
                          onPressed: () =>
                              context.pushNamed(CardListPage.routeName),
                          icon: const Icon(Icons.search),
                          label: const Text('去全卡表加卡'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () =>
                              context.pushNamed(DeckDetailPage.routeName),
                          icon: const Icon(Icons.visibility_outlined),
                          label: const Text('查看详情'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.save_outlined),
                          label: const Text('保存草稿'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () =>
                              context.pushNamed(ImportExportPage.routeName),
                          icon: const Icon(Icons.import_export),
                          label: const Text('导入导出'),
                        ),
                      ],
                    ),
                  ),
                ],
              );

              if (isNarrow) {
                return Column(
                  children: [
                    mainColumn,
                    const SizedBox(height: 16),
                    sideColumn,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: mainColumn),
                  const SizedBox(width: 16),
                  Expanded(child: sideColumn),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class DeckInitPage extends StatelessWidget {
  const DeckInitPage({super.key});

  static const routeName = 'deck-init';
  static const routePath = '/decks/new';

  @override
  Widget build(BuildContext context) {
    return AppShellScaffold(
      title: '新建牌库',
      actions: [
        FilledButton.icon(
          onPressed: () => context.pushNamed(DeckEditorPage.routeName),
          icon: const Icon(Icons.arrow_forward),
          label: const Text('确认并进入构筑'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DemoHeroBanner(
            icon: Icons.flag_outlined,
            title: '新建牌库初始化',
            description: '先确认阵营与主宰，再进入正式构筑工作台。',
            chips: ['步骤 1', '阵营优先', '主宰联动'],
          ),
          SizedBox(height: 20),
          DemoBlock(
            title: '构筑前提确认',
            icon: Icons.checklist_rtl_outlined,
            subtitle: '初始化态先完成阵营、主宰与牌库名称确认。',
            lines: ['阵营：阿斯加德', '可选主宰：奥丁 / 索尔 / 洛基', '预生成名称：奥丁中速试作'],
          ),
          SizedBox(height: 16),
          DemoBlock(
            title: '固定卡预览',
            icon: Icons.auto_fix_high_outlined,
            subtitle: '确认阵营与主宰后，系统会自动生成固定卡上下文。',
            lines: ['主城：英灵圣殿', '主宰：奥丁', '天灾：诸神黄昏'],
          ),
          SizedBox(height: 16),
          DemoBlock(
            title: '创建后流向',
            icon: Icons.alt_route_outlined,
            subtitle: '确认后进入牌库编辑页的构筑 Tab，并保留初始化上下文。',
            lines: ['进入：牌库编辑页 / 构筑', '上下文：阵营与主宰同步生效', '固定卡：自动重算并展示'],
          ),
        ],
      ),
    );
  }
}

class DeckListPage extends StatelessWidget {
  const DeckListPage({super.key});

  static const routeName = 'deck-list';
  static const routePath = '/decks';

  @override
  Widget build(BuildContext context) {
    return AppShellScaffold(
      title: '我的牌库',
      actions: [
        FilledButton.icon(
          onPressed: () => context.pushNamed(DeckInitPage.routeName),
          icon: const Icon(Icons.add),
          label: const Text('新建牌库'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DemoHeroBanner(
            icon: Icons.collections_bookmark_outlined,
            title: '历史牌库管理',
            description: '统一查看已保存牌库的状态、更新时间和管理入口。',
            chips: ['共 6 套', '最近编辑', '草稿 / 已完成'],
          ),
          const SizedBox(height: 20),
          const DemoBlock(
            title: '筛选与搜索区',
            icon: Icons.filter_list,
            subtitle: '按名称、阵营和状态快速筛选牌库。',
            lines: ['关键词：奥丁', '状态：全部', '排序：按更新时间'],
          ),
          const SizedBox(height: 16),
          DemoBlock(
            title: '牌库列表区',
            icon: Icons.view_list_outlined,
            subtitle: '支持查看详情、继续编辑、复制与删除操作。',
            child: Column(
              children: [
                _DeckRow(
                  title: '奥丁中速试作',
                  subtitle: '阿斯加德 · 草稿 · 更新于 5 分钟前',
                  onTap: () => context.pushNamed(DeckDetailPage.routeName),
                ),
                const SizedBox(height: 12),
                _DeckRow(
                  title: '高天原速攻',
                  subtitle: '高天原 · 已完成 · 更新于 昨天',
                  onTap: () => context.pushNamed(DeckDetailPage.routeName),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EditorTabStrip extends StatelessWidget {
  const _EditorTabStrip();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        _EditorTabChip(label: '构筑', active: true),
        _EditorTabChip(label: '说明'),
        _EditorTabChip(label: '统计'),
        _EditorTabChip(label: '历史'),
      ],
    );
  }
}

class _EditorTabChip extends StatelessWidget {
  const _EditorTabChip({required this.label, this.active = false});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF173A5E) : const Color(0xFFF6EFDf),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: active ? const Color(0xFF173A5E) : const Color(0xFFD7C49E),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? const Color(0xFFF2E1B7) : const Color(0xFF5F4B27),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class DeckDetailPage extends StatelessWidget {
  const DeckDetailPage({super.key});

  static const routeName = 'deck-detail';
  static const routePath = '/decks/detail';

  @override
  Widget build(BuildContext context) {
    return AppShellScaffold(
      title: '牌库详情',
      actions: [
        FilledButton.icon(
          onPressed: () => context.pushNamed(DeckEditorPage.routeName),
          icon: const Icon(Icons.edit_outlined),
          label: const Text('继续编辑'),
        ),
        OutlinedButton.icon(
          onPressed: () => context.pushNamed(ImportExportPage.routeName),
          icon: const Icon(Icons.import_export),
          label: const Text('导出牌库'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DemoHeroBanner(
            icon: Icons.inventory_2_outlined,
            title: '奥丁中速试作',
            description: '查看牌库完整构成、统计信息与构筑状态。',
            chips: ['阿斯加德', '主宰：奥丁', '状态：草稿'],
          ),
          const SizedBox(height: 20),
          const DemoBlock(
            title: '元信息区',
            icon: Icons.info_outline,
            subtitle: '名称、阵营、主宰、更新时间、备注',
            lines: ['更新时间：2026-05-11 20:30', '备注：针对中速环境调整。'],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 980;
              const pinnedBlock = DemoBlock(
                title: '固定卡牌区',
                icon: Icons.push_pin_outlined,
                subtitle: '展示规则生成的固定卡',
                lines: ['主城：英灵圣殿', '主宰：奥丁', '天灾：诸神黄昏'],
              );
              const listBlock = DemoBlock(
                title: '可抽取卡牌区',
                icon: Icons.view_stream_outlined,
                subtitle: '展示完整牌表和类型分组',
                lines: ['圣枪巡礼者 x2', '暮光誓约 x3', '天启驭雷者 x1'],
              );

              if (isNarrow) {
                return const Column(
                  children: [pinnedBlock, SizedBox(height: 16), listBlock],
                );
              }

              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: pinnedBlock),
                  SizedBox(width: 16),
                  Expanded(flex: 2, child: listBlock),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          const DemoBlock(
            title: '统计信息区',
            icon: Icons.query_stats,
            subtitle: '汇总张数、类型分布与当前合法性状态。',
            lines: ['当前张数：27 / 40', '军团：14', '战术：9', '合法性：未完成'],
          ),
        ],
      ),
    );
  }
}

class ImportExportPage extends StatelessWidget {
  const ImportExportPage({super.key});

  static const routeName = 'import-export';
  static const routePath = '/decks/import-export';

  @override
  Widget build(BuildContext context) {
    return AppShellScaffold(
      title: '导入导出牌库',
      actions: [
        OutlinedButton.icon(
          onPressed: () => context.pushNamed(DeckDetailPage.routeName),
          icon: const Icon(Icons.close),
          label: const Text('返回详情'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DemoHeroBanner(
            icon: Icons.import_export,
            title: '导入导出牌库',
            description: '作为上下文弹窗承接文本导入、导出与解析反馈。',
            chips: ['上下文弹窗', '文本导入', '导出文本'],
          ),
          SizedBox(height: 20),
          DemoBlock(
            title: '当前上下文',
            icon: Icons.layers_clear_outlined,
            subtitle: '可从我的牌库、牌库详情页或牌库编辑页打开，并在完成后回到原上下文。',
            lines: ['来源：牌库编辑页', '当前牌库：奥丁中速试作', '完成后：返回原页面继续处理'],
          ),
          SizedBox(height: 16),
          DemoBlock(
            title: '文本输入区',
            icon: Icons.text_snippet_outlined,
            subtitle: '粘贴牌表文本后即可开始识别与导入。',
            lines: ['牌库名称：奥丁中速试作', '主宰：奥丁', '圣枪巡礼者 x2'],
          ),
          SizedBox(height: 16),
          DemoBlock(
            title: '解析结果区',
            icon: Icons.fact_check_outlined,
            subtitle: '明确展示识别成功项、未知项、错误项与当前规则状态。',
            lines: ['已识别：24 项', '未知行：1', '错误：主宰缺失', '当前状态：可保存为草稿'],
          ),
          SizedBox(height: 16),
          DemoBlock(
            title: '导出文本区',
            icon: Icons.outbox_outlined,
            subtitle: '生成可复制的牌表文本，便于分享与备份。',
            lines: ['牌库名 / 主宰 / 卡牌行列表', '支持复制与导出'],
          ),
        ],
      ),
    );
  }
}

class _DeckRow extends StatelessWidget {
  const _DeckRow({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: const Color(0xFFF7F4EC),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xFFE6D8BE),
                child: Icon(Icons.folder_copy_outlined),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(subtitle, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
