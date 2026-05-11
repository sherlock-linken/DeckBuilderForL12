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
          label: const Text('示例详情'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DemoHeroBanner(
            icon: Icons.style_outlined,
            title: '卡牌浏览中心',
            description: '先用框架页打通搜索、筛选、列表和详情跳转。',
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
                    subtitle: '后续接阵营分布、类型分布和筛选命中数',
                    lines: ['当前命中：36', '军团：18', '战术：11', '主宰：2'],
                  ),
                  SizedBox(height: 16),
                  DemoBlock(
                    title: '当前编辑上下文',
                    icon: Icons.edit_note,
                    subtitle: '后续从牌库编辑页带着上下文进入全卡表',
                    lines: ['牌库名：奥丁中速试作', '阵营：阿斯加德', '已选张数：27 / 40'],
                  ),
                ],
              );

              final mainColumn = Column(
                children: [
                  const DemoBlock(
                    title: '搜索与筛选区',
                    icon: Icons.tune,
                    subtitle: '这里后续接搜索框、阵营、类型、费用和排序条件',
                    lines: ['关键词：奥丁', '阵营：天廷 / 太阳城 / 彼界', '类型：军团 / 战术 / 主宰'],
                  ),
                  const SizedBox(height: 16),
                  DemoBlock(
                    title: '卡牌列表区',
                    icon: Icons.view_agenda_outlined,
                    subtitle: '列表项点击后进入卡牌详情',
                    footer: '当前为 demo 数据骨架',
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
            description: '这里后续展示单卡完整资料、卡图、效果文本和构筑提示。',
            chips: ['天廷阵营', '军团', '费用 3'],
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 980;
              const imageBlock = DemoBlock(
                title: '卡图展示区',
                icon: Icons.image_outlined,
                subtitle: '正式接入图片资源后，这里显示大图和缩略图',
                lines: ['图片占位框', '版本 / 稀有度', '来源包信息'],
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
            description: '这里后续承接新建牌库、固定卡生成、卡位统计和保存草稿。',
            chips: ['阵营：阿斯加德', '主宰：奥丁', '可抽取 27 / 40'],
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 1080;
              final mainColumn = Column(
                children: [
                  const DemoBlock(
                    title: '牌库基础信息区',
                    icon: Icons.badge_outlined,
                    subtitle: '名称、阵营、主宰、草稿状态',
                    lines: ['牌库名：奥丁中速试作', '状态：草稿', '更新时间：刚刚'],
                  ),
                  const SizedBox(height: 16),
                  const DemoBlock(
                    title: '固定卡牌区',
                    icon: Icons.push_pin_outlined,
                    subtitle: '后续按规则生成，不作为手填真值',
                    lines: ['主城：英灵圣殿', '主宰：奥丁', '天灾：诸神黄昏'],
                  ),
                  const SizedBox(height: 16),
                  DemoBlock(
                    title: '可抽取卡牌区',
                    icon: Icons.layers_outlined,
                    subtitle: '后续接删卡、调数、跳详情、继续加卡',
                    footer: '当前 demo：3 张示例卡',
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
                    title: '统计与校验区',
                    icon: Icons.rule_folder_outlined,
                    subtitle: '后续接类型统计、合法性提醒和错误提示',
                    lines: ['军团：14', '战术：9', '超限项：0', '缺失张数：13'],
                  ),
                  const SizedBox(height: 16),
                  DemoBlock(
                    title: '操作区',
                    icon: Icons.task_alt_outlined,
                    subtitle: '先把主要流程跳转打通',
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
                          onPressed: () =>
                              context.pushNamed(ImportExportPage.routeName),
                          icon: const Icon(Icons.import_export),
                          label: const Text('打开弹窗页'),
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
          onPressed: () => context.pushNamed(DeckEditorPage.routeName),
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
            description: '这里后续展示已保存牌库、状态、更新时间和管理操作。',
            chips: ['共 6 套', '最近编辑', '草稿 / 已完成'],
          ),
          const SizedBox(height: 20),
          const DemoBlock(
            title: '筛选与搜索区',
            icon: Icons.filter_list,
            subtitle: '后续支持按名称、阵营、状态过滤',
            lines: ['关键词：奥丁', '状态：全部', '排序：按更新时间'],
          ),
          const SizedBox(height: 16),
          DemoBlock(
            title: '牌库列表区',
            icon: Icons.view_list_outlined,
            subtitle: '点击查看详情或继续编辑',
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
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DemoHeroBanner(
            icon: Icons.inventory_2_outlined,
            title: '奥丁中速试作',
            description: '详情页偏展示，后续支持导出、删除和转入编辑。',
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
            subtitle: '后续接张数、类型统计、合法性结论',
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
            title: '导入导出弹窗页骨架',
            description: '当前先用独立页面模拟弹窗结构，后续可再替换为真实 dialog。',
            chips: ['文本导入', '解析反馈', '导出文本'],
          ),
          SizedBox(height: 20),
          DemoBlock(
            title: '文本输入区',
            icon: Icons.text_snippet_outlined,
            subtitle: '后续接粘贴牌表文本和导入按钮',
            lines: ['示例：', '奥丁中速试作', '主宰：奥丁', '圣枪巡礼者 x2'],
          ),
          SizedBox(height: 16),
          DemoBlock(
            title: '解析结果区',
            icon: Icons.fact_check_outlined,
            subtitle: '展示成功项、未知项、错误项',
            lines: ['已识别：24 项', '未知行：1', '错误：主宰缺失'],
          ),
          SizedBox(height: 16),
          DemoBlock(
            title: '导出文本区',
            icon: Icons.outbox_outlined,
            subtitle: '后续接复制、导出和保存草稿',
            lines: ['当前导出文本占位', '牌库名 / 主宰 / 卡牌行列表'],
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
