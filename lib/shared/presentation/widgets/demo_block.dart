import 'package:flutter/material.dart';

class DemoHeroBanner extends StatelessWidget {
  const DemoHeroBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.chips,
  });

  final IconData icon;
  final String title;
  final String description;
  final List<String> chips;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF3E7C8), Color(0xFFE2D2AF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFD3BE92)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white.withValues(alpha: 0.8),
            child: Icon(icon, size: 28, color: const Color(0xFF7A591D)),
          ),
          const SizedBox(height: 16),
          Text(title, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(description, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: chips
                .map(
                  (chip) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.72),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: const Color(0xFFD6C29B)),
                    ),
                    child: Text(chip),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class DemoBlock extends StatelessWidget {
  const DemoBlock({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
    this.lines = const [],
    this.footer,
    this.child,
  });

  final String title;
  final IconData icon;
  final String subtitle;
  final List<String> lines;
  final String? footer;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFD8CCB6), width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6EFDF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: const Color(0xFF7B5C27)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 2),
                    Text(subtitle, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
          if (lines.isNotEmpty || child != null) const SizedBox(height: 18),
          if (lines.isNotEmpty)
            ...lines.map(
              (line) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Icon(
                        Icons.square,
                        size: 8,
                        color: Color(0xFFB48A3B),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(line, style: theme.textTheme.bodyLarge),
                    ),
                  ],
                ),
              ),
            ),
          ...?child.let((childValue) => [childValue]),
          ...?footer.let(
            (footerText) => [
              const SizedBox(height: 16),
              Text(footerText, style: theme.textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

extension _NullableValueX<T> on T? {
  R? let<R>(R Function(T value) transform) =>
      this == null ? null : transform(this as T);
}
