import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/design_tokens/app_colors.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void _toggleMenu() {
    if (_isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        // Ana Navbar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha:0.1),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: FontAwesomeIcons.house,
                label: 'Anasayfa',
                isActive: widget.currentIndex == 0,
                onTap: () => widget.onItemSelected(0),
              ),
              _NavItem(
                icon: FontAwesomeIcons.boxOpen,
                label: 'Paketler',
                isActive: widget.currentIndex == 1,
                onTap: () => widget.onItemSelected(1),
              ),
              GestureDetector(
                onTap: _toggleMenu,
                child: const _AddButton(),
              ),
              _NavItem(
                icon: FontAwesomeIcons.screwdriverWrench,
                label: 'Hizmetler',
                isActive: widget.currentIndex == 2,
                onTap: () => widget.onItemSelected(2),
              ),
              _NavItem(
                icon: FontAwesomeIcons.gear,
                label: 'Ayarlar',
                isActive: widget.currentIndex == 3,
                onTap: () => widget.onItemSelected(3),
              ),
            ],
          ),
        ),

        // Açılan Menü
        if (_isExpanded)
          Positioned(
            bottom: 70,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final items = [
                  {'icon': FontAwesomeIcons.gear, 'label': "Settings", 'alignRight': true},
                  {'icon': FontAwesomeIcons.screwdriverWrench, 'label': "Services", 'alignRight': false},
                  {'icon': FontAwesomeIcons.boxOpen, 'label': "Packages", 'alignRight': true},
                  {'icon': FontAwesomeIcons.house, 'label': "Home", 'alignRight': false},
                ];

                return Column(
                  children: items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;

                    final intervalStart = index * 0.1;
                    final curved = CurvedAnimation(
                      parent: _controller,
                      curve: Interval(intervalStart, 1.0, curve: Curves.easeOutBack),
                    );

                    return FadeTransition(
                      opacity: curved,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.3),
                          end: Offset.zero,
                        ).animate(curved),
                        child: GestureDetector(
                          onTap: () {
                            // Floating menu itemlarına tıklanınca da navigation yapsın
                            if (item['label'] == "Home") {
                              widget.onItemSelected(0);
                            } else if (item['label'] == "Packages") {
                              widget.onItemSelected(1);
                            } else if (item['label'] == "Services") {
                              widget.onItemSelected(2);
                            } else if (item['label'] == "Settings") {
                              widget.onItemSelected(3);
                            }
                            _toggleMenu(); // Menu'yu kapat
                          },
                          child: _FloatingMenuItem(
                            icon: item['icon'] as IconData,
                            label: item['label'] as String,
                            alignRight: item['alignRight'] as bool,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              color: isActive ? AppColors.primary : Colors.black54,
              size: 20,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.primary : Colors.black54,
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary,
          width: 2.5,
        ),
      ),
      child: Icon(
        FontAwesomeIcons.plus,
        color: AppColors.primary,
        size: 20,
      ),
    );
  }
}

class _FloatingMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool alignRight;

  const _FloatingMenuItem({
    required this.icon,
    required this.label,
    this.alignRight = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12,
        left: alignRight ? 40 : 0,
        right: alignRight ? 0 : 40,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
