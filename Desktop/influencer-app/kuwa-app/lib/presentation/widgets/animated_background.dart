import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../shared/design_tokens/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  
  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _drawAnimations;
  late List<Animation<double>> _rotationAnimations;
  late List<Animation<double>> _scaleAnimations;
  late List<Offset> _positions;
  late List<Color> _colors;
  late List<SocialMediaLogo> _logoTypes;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    const int logoCount = 12;
    _controllers = [];
    _drawAnimations = [];
    _rotationAnimations = [];
    _scaleAnimations = [];
    _positions = [];
    _colors = [];
    _logoTypes = [];

    final random = math.Random();
    final logoOptions = SocialMediaLogo.values;

    for (int i = 0; i < logoCount; i++) {
      // Animation controller with faster duration
      final controller = AnimationController(
        duration: Duration(milliseconds: 2000 + random.nextInt(1000)),
        vsync: this,
      );
      
      // Drawing animation (line by line drawing)
      final drawAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));

      // Rotation animation
      final rotationAnimation = Tween<double>(
        begin: 0,
        end: 2 * math.pi,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ));

      // Scale animation for floating effect
      final scaleAnimation = Tween<double>(
        begin: 0.7,
        end: 1.1,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));

      // Random positions
      _positions.add(Offset(
        0.1 + random.nextDouble() * 0.8, // Keep logos more centered
        0.1 + random.nextDouble() * 0.8,
      ));

      // Figma color variations for social media theme
      final colorVariations = [
        AppColors.primary.withOpacity(0.12), // More visible purple
        AppColors.primaryLight.withOpacity(0.10),
        AppColors.secondary.withOpacity(0.12), // Indigo  
        AppColors.secondaryLight.withOpacity(0.08),
        AppColors.accent.withOpacity(0.08), // Orange accent
        AppColors.primaryDark.withOpacity(0.10),
      ];
      
      _colors.add(colorVariations[random.nextInt(colorVariations.length)]);
      _logoTypes.add(logoOptions[random.nextInt(logoOptions.length)]);

      _controllers.add(controller);
      _drawAnimations.add(drawAnimation);
      _rotationAnimations.add(rotationAnimation);
      _scaleAnimations.add(scaleAnimation);

      // Start animation with shorter random delay
      Future.delayed(Duration(milliseconds: random.nextInt(1000)), () {
        if (mounted) {
          controller.repeat();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Stack(
          children: [
          // Animated Social Media Logos Background
          ...List.generate(_controllers.length, (index) {
            return AnimatedBuilder(
              animation: Listenable.merge([
                _drawAnimations[index],
                _rotationAnimations[index],
                _scaleAnimations[index],
              ]),
              builder: (context, child) {
                return Positioned(
                  left: _positions[index].dx * MediaQuery.of(context).size.width - 60,
                  top: _positions[index].dy * MediaQuery.of(context).size.height - 60,
                  child: Transform.scale(
                    scale: _scaleAnimations[index].value,
                    child: Transform.rotate(
                      angle: _rotationAnimations[index].value * 0.2, // Slow rotation
                      child: Container(
                        width: 120,
                        height: 120,
                        child: CustomPaint(
                          painter: SocialMediaLogoPainter(
                            logoType: _logoTypes[index],
                            color: _colors[index],
                            drawProgress: _drawAnimations[index].value,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
          
          // Foreground content
          widget.child,
          ],
        ),
      ),
    );
  }
}

enum SocialMediaLogo {
  instagram,
  twitter,
  facebook,
  linkedin,
  youtube,
  tiktok,
  snapchat,
  discord,
}

class SocialMediaLogoPainter extends CustomPainter {
  final SocialMediaLogo logoType;
  final Color color;
  final double drawProgress;

  SocialMediaLogoPainter({
    required this.logoType,
    required this.color,
    required this.drawProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.25;

    switch (logoType) {
      case SocialMediaLogo.instagram:
        _drawInstagramLogo(canvas, paint, center, radius);
        break;
      case SocialMediaLogo.twitter:
        _drawTwitterLogo(canvas, paint, center, radius);
        break;
      case SocialMediaLogo.facebook:
        _drawFacebookLogo(canvas, paint, center, radius);
        break;
      case SocialMediaLogo.linkedin:
        _drawLinkedInLogo(canvas, paint, center, radius);
        break;
      case SocialMediaLogo.youtube:
        _drawYoutubeLogo(canvas, paint, center, radius);
        break;
      case SocialMediaLogo.tiktok:
        _drawTikTokLogo(canvas, paint, center, radius);
        break;
      case SocialMediaLogo.snapchat:
        _drawSnapchatLogo(canvas, paint, center, radius);
        break;
      case SocialMediaLogo.discord:
        _drawDiscordLogo(canvas, paint, center, radius);
        break;
    }
  }

  void _drawInstagramLogo(Canvas canvas, Paint paint, Offset center, double radius) {
    final path = Path();
    
    // Camera body (rounded rectangle)
    final rect = Rect.fromCenter(center: center, width: radius * 1.6, height: radius * 1.6);
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius * 0.3)));
    
    // Camera lens (circle)
    path.addOval(Rect.fromCenter(center: center, width: radius * 0.8, height: radius * 0.8));
    
    // Flash dot
    path.addOval(Rect.fromCenter(
      center: Offset(center.dx + radius * 0.4, center.dy - radius * 0.4),
      width: radius * 0.2,
      height: radius * 0.2,
    ));

    _drawAnimatedPath(canvas, paint, path);
  }

  void _drawTwitterLogo(Canvas canvas, Paint paint, Offset center, double radius) {
    final path = Path();
    
    // Twitter bird shape (simplified)
    path.moveTo(center.dx - radius * 0.8, center.dy + radius * 0.3);
    path.quadraticBezierTo(
      center.dx - radius * 0.2, center.dy - radius * 0.8,
      center.dx + radius * 0.8, center.dy - radius * 0.2,
    );
    path.quadraticBezierTo(
      center.dx + radius * 0.6, center.dy,
      center.dx + radius * 0.2, center.dy + radius * 0.4,
    );
    path.quadraticBezierTo(
      center.dx - radius * 0.2, center.dy + radius * 0.6,
      center.dx - radius * 0.8, center.dy + radius * 0.3,
    );

    _drawAnimatedPath(canvas, paint, path);
  }

  void _drawFacebookLogo(Canvas canvas, Paint paint, Offset center, double radius) {
    final path = Path();
    
    // Facebook "f" letter
    path.moveTo(center.dx - radius * 0.2, center.dy - radius * 0.8);
    path.lineTo(center.dx + radius * 0.4, center.dy - radius * 0.8);
    path.moveTo(center.dx - radius * 0.2, center.dy - radius * 0.8);
    path.lineTo(center.dx - radius * 0.2, center.dy + radius * 0.8);
    path.moveTo(center.dx - radius * 0.2, center.dy - radius * 0.1);
    path.lineTo(center.dx + radius * 0.2, center.dy - radius * 0.1);

    _drawAnimatedPath(canvas, paint, path);
  }

  void _drawLinkedInLogo(Canvas canvas, Paint paint, Offset center, double radius) {
    final path = Path();
    
    // LinkedIn square with "in"
    final rect = Rect.fromCenter(center: center, width: radius * 1.4, height: radius * 1.4);
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius * 0.1)));
    
    // "i" dot
    path.addOval(Rect.fromCenter(
      center: Offset(center.dx - radius * 0.3, center.dy - radius * 0.3),
      width: radius * 0.1,
      height: radius * 0.1,
    ));
    
    // "i" line
    path.moveTo(center.dx - radius * 0.3, center.dy - radius * 0.1);
    path.lineTo(center.dx - radius * 0.3, center.dy + radius * 0.4);
    
    // "n"
    path.moveTo(center.dx, center.dy - radius * 0.1);
    path.lineTo(center.dx, center.dy + radius * 0.4);
    path.moveTo(center.dx, center.dy);
    path.quadraticBezierTo(
      center.dx + radius * 0.15, center.dy - radius * 0.1,
      center.dx + radius * 0.3, center.dy,
    );
    path.lineTo(center.dx + radius * 0.3, center.dy + radius * 0.4);

    _drawAnimatedPath(canvas, paint, path);
  }

  void _drawYoutubeLogo(Canvas canvas, Paint paint, Offset center, double radius) {
    final path = Path();
    
    // YouTube play button (triangle in rounded rectangle)
    final rect = Rect.fromCenter(center: center, width: radius * 1.6, height: radius * 1.1);
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius * 0.2)));
    
    // Play triangle
    path.moveTo(center.dx - radius * 0.2, center.dy - radius * 0.3);
    path.lineTo(center.dx + radius * 0.3, center.dy);
    path.lineTo(center.dx - radius * 0.2, center.dy + radius * 0.3);
    path.close();

    _drawAnimatedPath(canvas, paint, path);
  }

  void _drawTikTokLogo(Canvas canvas, Paint paint, Offset center, double radius) {
    final path = Path();
    
    // TikTok musical note shape
    path.moveTo(center.dx - radius * 0.3, center.dy + radius * 0.6);
    path.lineTo(center.dx - radius * 0.3, center.dy - radius * 0.2);
    path.quadraticBezierTo(
      center.dx - radius * 0.1, center.dy - radius * 0.6,
      center.dx + radius * 0.3, center.dy - radius * 0.4,
    );
    path.quadraticBezierTo(
      center.dx + radius * 0.5, center.dy - radius * 0.3,
      center.dx + radius * 0.3, center.dy - radius * 0.1,
    );
    
    // Note head
    path.addOval(Rect.fromCenter(
      center: Offset(center.dx - radius * 0.3, center.dy + radius * 0.6),
      width: radius * 0.3,
      height: radius * 0.2,
    ));

    _drawAnimatedPath(canvas, paint, path);
  }

  void _drawSnapchatLogo(Canvas canvas, Paint paint, Offset center, double radius) {
    final path = Path();
    
    // Snapchat ghost shape
    path.moveTo(center.dx, center.dy - radius * 0.8);
    path.quadraticBezierTo(
      center.dx - radius * 0.6, center.dy - radius * 0.8,
      center.dx - radius * 0.6, center.dy - radius * 0.2,
    );
    path.lineTo(center.dx - radius * 0.6, center.dy + radius * 0.4);
    path.quadraticBezierTo(
      center.dx - radius * 0.4, center.dy + radius * 0.8,
      center.dx - radius * 0.2, center.dy + radius * 0.6,
    );
    path.lineTo(center.dx, center.dy + radius * 0.8);
    path.lineTo(center.dx + radius * 0.2, center.dy + radius * 0.6);
    path.quadraticBezierTo(
      center.dx + radius * 0.4, center.dy + radius * 0.8,
      center.dx + radius * 0.6, center.dy + radius * 0.4,
    );
    path.lineTo(center.dx + radius * 0.6, center.dy - radius * 0.2);
    path.quadraticBezierTo(
      center.dx + radius * 0.6, center.dy - radius * 0.8,
      center.dx, center.dy - radius * 0.8,
    );

    _drawAnimatedPath(canvas, paint, path);
  }

  void _drawDiscordLogo(Canvas canvas, Paint paint, Offset center, double radius) {
    final path = Path();
    
    // Discord controller/headset shape
    path.moveTo(center.dx - radius * 0.6, center.dy - radius * 0.4);
    path.quadraticBezierTo(
      center.dx - radius * 0.8, center.dy - radius * 0.6,
      center.dx - radius * 0.8, center.dy,
    );
    path.quadraticBezierTo(
      center.dx - radius * 0.8, center.dy + radius * 0.6,
      center.dx - radius * 0.6, center.dy + radius * 0.4,
    );
    path.lineTo(center.dx + radius * 0.6, center.dy + radius * 0.4);
    path.quadraticBezierTo(
      center.dx + radius * 0.8, center.dy + radius * 0.6,
      center.dx + radius * 0.8, center.dy,
    );
    path.quadraticBezierTo(
      center.dx + radius * 0.8, center.dy - radius * 0.6,
      center.dx + radius * 0.6, center.dy - radius * 0.4,
    );
    path.close();
    
    // Eyes
    path.addOval(Rect.fromCenter(
      center: Offset(center.dx - radius * 0.25, center.dy - radius * 0.1),
      width: radius * 0.15,
      height: radius * 0.2,
    ));
    path.addOval(Rect.fromCenter(
      center: Offset(center.dx + radius * 0.25, center.dy - radius * 0.1),
      width: radius * 0.15,
      height: radius * 0.2,
    ));

    _drawAnimatedPath(canvas, paint, path);
  }

  void _drawAnimatedPath(Canvas canvas, Paint paint, Path path) {
    final pathMetrics = path.computeMetrics();
    final animatedPath = Path();
    
    for (final metric in pathMetrics) {
      final extractLength = metric.length * drawProgress;
      final extractPath = metric.extractPath(0.0, extractLength);
      animatedPath.addPath(extractPath, Offset.zero);
    }
    
    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(SocialMediaLogoPainter oldDelegate) {
    return oldDelegate.drawProgress != drawProgress ||
        oldDelegate.logoType != logoType ||
        oldDelegate.color != color;
  }
}
