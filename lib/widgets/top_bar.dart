import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';

// Top bar with search field, some icons and profile avatar.
// On mobile the search field takes the full row and we show
// a menu button to open the drawer.
class TopBar extends StatelessWidget {
  final VoidCallback? onMenuTap;

  const TopBar({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (isMobile)
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu_rounded, color: AppColors.textDark),
            ),
          if (!isMobile)
            Text(
              "Home",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: GoogleFonts.poppins(
                          color: AppColors.textGrey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.search_rounded,
                      color: AppColors.textGrey, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          if (!isMobile) ...[
            _topIcon(Icons.mail_outline_rounded),
            const SizedBox(width: 12),
            _topIcon(Icons.notifications_none_rounded),
            const SizedBox(width: 12),
            _topIcon(Icons.power_settings_new_rounded),
            const SizedBox(width: 16),
          ],
          const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.purple,
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _topIcon(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: AppColors.textDark, size: 20),
    );
  }
}
