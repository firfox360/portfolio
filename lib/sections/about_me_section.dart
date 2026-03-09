import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';
import '../utils/responsive_helper.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: theme.scaffoldBackgroundColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ResponsiveHelper(
            desktop: _buildContent(context, isDesktop: true),
            mobile: _buildContent(context, isDesktop: false),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required bool isDesktop}) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'About Me',
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 40 : 32,
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
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDesktop) ...[
              Expanded(
                flex: 1,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(child: Icon(Icons.person, size: 100, color: AppColors.primary)),
                ),
              ),
              const SizedBox(width: 60),
            ],
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Professional Summary',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.headlineMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'I am a passionate Flutter Developer who loves building high-quality, scalable mobile applications. '
                    'With a deep understanding of Dart and the Flutter framework, I focus on creating seamless user experiences '
                    'across both iOS and Android platforms.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: theme.textTheme.bodyLarge?.color,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'My expertise lies in implementing clean architecture to ensure code maintainability and scalability. '
                    'I am highly proficient in state management using BLoC, and I have extensive experience in integrating REST APIs '
                    'and handling offline data storage with SQLite and Hive.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: theme.textTheme.bodyLarge?.color,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
