import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';
import '../utils/responsive_helper.dart';

class CodePracticesSection extends StatelessWidget {
  const CodePracticesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: theme.colorScheme.surface,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Development Practices',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.displayLarge?.color,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 60),
              ResponsiveHelper(
                desktop: _buildPractices(context, crossAxisCount: 3),
                tablet: _buildPractices(context, crossAxisCount: 2),
                mobile: _buildPractices(context, crossAxisCount: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPractices(BuildContext context, {required int crossAxisCount}) {
    final theme = Theme.of(context);
    final practices = [
      {'title': 'Clean Architecture', 'desc': 'Separation of concerns using data, domain, and presentation layers.'},
      {'title': 'Repository Pattern', 'desc': 'Abstracting data sources to provide a clean API for the rest of the app.'},
      {'title': 'SOLID Principles', 'desc': 'Following standard principles for robust and maintainable software design.'},
      {'title': 'Modular Code Structure', 'desc': 'Dividing the app into independent, reusable modules.'},
      {'title': 'Scalable Structure', 'desc': 'Project structure designed for growth and multiple contributors.'},
      {'title': 'Unit Testing', 'desc': 'Ensuring code reliability through automated testing coverage.'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: practices.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        final practice = practices[index];
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.light ? AppColors.backgroundLight : AppColors.backgroundDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                practice['title']!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                practice['desc']!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
