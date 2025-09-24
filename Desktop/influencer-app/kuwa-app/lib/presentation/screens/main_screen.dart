import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kuwa_app/presentation/screens/home/home_screen.dart';
import 'package:kuwa_app/presentation/screens/services/packages_screen.dart';
import 'package:kuwa_app/presentation/screens/services/services_screen.dart';
import 'package:kuwa_app/presentation/screens/profile/profile_screen.dart';
import 'package:kuwa_app/presentation/widgets/custom_bottom_nav.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    PackagesScreen(),
    ServicesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            IndexedStack(
              index: _currentIndex,
              children: _pages,
            ),

            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CustomBottomNav(
                currentIndex: _currentIndex,
                onItemSelected: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
