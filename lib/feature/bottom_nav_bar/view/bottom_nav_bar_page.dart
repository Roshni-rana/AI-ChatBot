import 'package:AIChatBot/feature/bottom_nav_bar/bloc/bottom_nav_bloc.dart';
import 'package:AIChatBot/feature/bottom_nav_bar/bloc/bottom_nav_event.dart';
import 'package:AIChatBot/feature/bottom_nav_bar/bloc/bottom_nav_state.dart';
import 'package:AIChatBot/feature/bottom_nav_bar/widget/nav_custom_painter.dart';
import 'package:AIChatBot/feature/history/pages/history_page.dart';
import 'package:AIChatBot/feature/home/view/home_page.dart';
import 'package:AIChatBot/feature/news/pages/news_page.dart';
import 'package:AIChatBot/feature/settings/pages/setting_page.dart';
import 'package:AIChatBot/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  final List<String> icons = const [
    Assets.iconsHomeicon,
    Assets.iconsClockicons,
    Assets.iconsNewsIcons,
    Assets.iconsSettingsicons,
  ];

  final List<String> labels = const ['Home', 'History', 'News', 'Setting'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        final selectedIndex = state.selectedIndex;

        return Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: selectedIndex,
            children: const [
              HomePage(),
              HistoryPage(),
              NewsPage(),
              SettingPage(),
            ],
          ),
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                painter: NavCustomPainter(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  height: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavItem(context, 0, selectedIndex),
                      _buildNavItem(context, 1, selectedIndex),
                      const SizedBox(width: 50),
                      _buildNavItem(context, 2, selectedIndex),
                      _buildNavItem(context, 3, selectedIndex),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -25,
                left: MediaQuery.of(context).size.width / 2 - 35,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(Assets.iconsBottomIcon),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, int index, int selectedIndex) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        context.read<BottomNavBloc>().add(BottomNavItemSelected(index));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icons[index],
            color: isSelected
                ? const Color(0xFF00C58D)
                : Colors.black.withOpacity(0.8),
            height: 35,
          ),
          const SizedBox(height: 4),
          Text(
            labels[index],
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF00C58D)
                  : Colors.black.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
