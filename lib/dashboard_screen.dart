import 'package:flutter/material.dart';
import 'package:flutterproject/widgets/calender_card.dart';
import 'constants/app_colors.dart';
import 'models/project_model.dart';
import 'models/creator_model.dart';
import 'utils/responsive.dart';
import 'widgets/sidebar.dart';
import 'widgets/top_bar.dart';
import 'widgets/hero_banner.dart';
import 'widgets/project_card.dart';
import 'widgets/creator_card.dart';
import 'widgets/performance_chart.dart';
import 'widgets/birthday_card.dart';
import 'widgets/anniversary_card.dart';
import 'widgets/section_card.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.background,

      drawer: isMobile ? const Drawer(child: Sidebar()) : null,
      body: Row(
        children: [
          // Sidebar is shown directly on tablet and desktop.
          if (!isMobile) const Sidebar(),
          Expanded(
            child: Column(
              children: [
                TopBar(
                  onMenuTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: isTablet
                        ? _buildTabletLayout()
                        : (isMobile
                        ? _buildMobileLayout()
                        : _buildDesktopLayout()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Desktop: main content (2/3) + right panel (1/3) side by side.
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildMainContent(),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: _buildRightPanel(),
        ),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildMainContent(),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: _buildRightPanel(),
        ),
      ],
    );
  }


  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildMainContent(),
        const SizedBox(height: 20),
        _buildRightPanel(),
      ],
    );
  }

  Widget _buildMainContent() {
    bool stackProjectsAndCreators =
        Responsive.isMobile(context) || Responsive.isTablet(context);

    Widget projectsCreatorsRow = stackProjectsAndCreators
        ? Column(
      children: [
        _buildProjectsCard(),
        const SizedBox(height: 16),
        _buildCreatorsCard(),
      ],
    )
        : Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildProjectsCard()),
        const SizedBox(width: 16),
        Expanded(child: _buildCreatorsCard()),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeroBanner(),
        const SizedBox(height: 20),
        projectsCreatorsRow,
        const SizedBox(height: 20),
        SectionCard(
          title: "Over All Performance The Years",
          child: const PerformanceChart(),
        ),
      ],
    );
  }

  Widget _buildProjectsCard() {
    return SectionCard(
      title: "All Projects",
      child: Column(
        children: List.generate(dummyProjects.length, (index) {
          return ProjectCard(
            project: dummyProjects[index],
            isHighlighted: index == 0,
          );
        }),
      ),
    );
  }

  Widget _buildCreatorsCard() {
    return SectionCard(
      title: "Top Creators",
      child: Column(
        children: dummyCreators
            .map((creator) => CreatorCard(creator: creator))
            .toList(),
      ),
    );
  }

  Widget _buildRightPanel() {
    return Column(
      children: const [
        CalendarCard(),
        SizedBox(height: 16),
        BirthdayCard(),
        SizedBox(height: 16),
        AnniversaryCard(),
      ],
    );
  }
}
