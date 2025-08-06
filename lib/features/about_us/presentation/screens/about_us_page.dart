
import 'package:flutter/material.dart';
import '../presentation.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Title Section
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'About Us',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              background: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                alignment: Alignment.center,
                child: Icon(
                  Icons.group_outlined, // Or a custom logo icon
                  size: 80,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),

          // Introduction Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'We are a passionate team building the future of open-source tools.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Team Section Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
              child: Text(
                'Meet the Team',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Team Members Grid/List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return AnimatedTeamMemberCard(
                    member: teamMembers[index],
                    index: index,
                  );
                },
                childCount: teamMembers.length,
              ),
            ),
          ),

          // Tools Section Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
              child: Text(
                'Our Tech Stack',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Tools Badges Grid
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.5,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return AnimatedBadge(
                    toolName: tools[index],
                    index: index,
                  );
                },
                childCount: tools.length,
              ),
            ),
          ),

          // Footer Spacing
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }

  // Static Team Data
  static const List<Map<String, String>> teamMembers = [
    {
      'name': 'Erick',
      'role': 'CEO',
      'description': 'Architecting infrastructure at scale',
    },
    {
      'name': 'Baraka',
      'role': 'DevOps/CFO',
      'description': 'DevOps, backend, and all things ruthless',
    },
    {
      'name': 'Eugene',
      'role': 'CTO',
      'description': 'Bridging design and systems elegantly',
    },
    {
      'name': 'Jess',
      'role': 'COO',
      'description': 'Builds intuitive and delightful UX',
    },
    {
      'name': 'Sam',
      'role': 'Vice CEO',
      'description': 'Flutter specialist, Material 3 wizard',
    },
    {
      'name': 'Prince',
      'role': 'Chief of staff',
      'description': 'Breaks everything before users do',
    },
  ];

  // Static Tools Data
  static const List<String> tools = [
    'Flutter',
    'Go',
    'Python',
    'Java',
    'BLoC',
    'Equatable',
  ];
}