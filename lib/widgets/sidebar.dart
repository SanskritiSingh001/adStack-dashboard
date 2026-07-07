import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

// This is the left sidebar with logo, profile and menu items.
// I made it a StatefulWidget because it needs to keep track of
// which menu item is currently selected.
class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Home", "icon": Icons.home_rounded},
    {"title": "Employees", "icon": Icons.people_alt_rounded},
    {"title": "Attendance", "icon": Icons.event_available_rounded},
    {"title": "Summary", "icon": Icons.bar_chart_rounded},
    {"title": "Information", "icon": Icons.info_outline_rounded},
  ];

  final List<String> workspaces = ["Adstacks", "Finance"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: AppColors.sidebarBackground,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(),
              const SizedBox(height: 24),
              _buildProfile(),
              const SizedBox(height: 24),
              // menu list
              Column(
                children: List.generate(menuItems.length, (index) {
                  return _buildMenuItem(
                    icon: menuItems[index]["icon"],
                    title: menuItems[index]["title"],
                    index: index,
                  );
                }),
              ),
              const SizedBox(height: 20),
              Text(
                "WORKSPACES",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textGrey,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              ...workspaces.map((w) => _buildWorkspaceItem(w)),
              const SizedBox(height: 30),
              _buildBottomItem(Icons.settings_outlined, "Setting"),
              const SizedBox(height: 8),
              _buildBottomItem(Icons.logout_rounded, "Logout"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.dashboard_rounded,
              color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        Text(
          "Adstacks",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }

  Widget _buildProfile() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.purple,
          child: Icon(Icons.person, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          "Pooja Mishra",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.purple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "Admin",
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: AppColors.purple,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    bool isSelected = selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.purple : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected ? Colors.white : AppColors.textGrey,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWorkspaceItem(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down_rounded,
              size: 18, color: AppColors.textGrey),
        ],
      ),
    );
  }

  Widget _buildBottomItem(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.textGrey),
          const SizedBox(width: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
