import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';
import '../utils/responsive_helper.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsClick;
  final VoidCallback onContactClick;

  const HeroSection({
    super.key,
    required this.onProjectsClick,
    required this.onContactClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ResponsiveHelper(
        desktop: _buildContent(context, isDesktop: true),
        mobile: _buildContent(context, isDesktop: false),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required bool isDesktop}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: isDesktop ? 80 : 60,
          backgroundColor: Colors.white24,
          child: Icon(
            Icons.person_outline,
            size: isDesktop ? 80 : 60,
            color: Colors.white,
          ),
        ).animate().fadeIn(duration: 600.ms).scale(delay: 200.ms),
        const SizedBox(height: 30),
        Text(
          'Sharon K',
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 56 : 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
        Text(
          'Flutter Developer',
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 28 : 20,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.9),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.3),
        const SizedBox(height: 20),
        SizedBox(
          width: 700,
          child: Text(
            'Building high-performance cross-platform mobile applications with Flutter.\n'
            'Experienced in building scalable mobile applications with clean architecture, REST APIs, and offline data handling.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 18 : 16,
              color: Colors.white.withOpacity(0.8),
              height: 1.6,
            ),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _buildButton(
              label: 'View Projects',
              onPressed: onProjectsClick,
              isPrimary: true,
            ),
            _buildButton(
              label: 'Download Resume',
              onPressed: () {},
              isPrimary: false,
            ),
            _buildButton(
              label: 'Contact Me',
              onPressed: onContactClick,
              isPrimary: false,
            ),
          ],
        ).animate().fadeIn(duration: 600.ms, delay: 600.ms).slideY(begin: 0.2),
      ],
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onPressed,
    required bool isPrimary,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.white : Colors.transparent,
        foregroundColor: isPrimary ? AppColors.primary : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        side: isPrimary ? null : const BorderSide(color: Colors.white, width: 2),
        elevation: isPrimary ? 5 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
