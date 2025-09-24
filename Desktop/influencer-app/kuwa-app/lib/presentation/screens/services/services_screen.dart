import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../presentation/widgets/custom_bottom_nav.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final List<ServiceItem> services = [
    ServiceItem(
      title: 'Hesap Analizi',
      icon: FontAwesomeIcons.chartLine,
      description:
          'Sosyal medya hesaplarınızın detaylı analizini yapıyoruz. Takipçi etkileşimleri, içerik performansı, büyüme oranları ve rakip analizleri ile hesabınızı bir üst seviyeye taşıyoruz. Veriye dayalı stratejiler geliştirerek organik büyümenizi sağlıyoruz.',
    ),
    ServiceItem(
      title: 'İçerik Tasarımı',
      icon: FontAwesomeIcons.palette,
      description:
          'Markanıza özel yaratıcı ve etkileyici içerikler üretiyoruz. Profesyonel grafik tasarım, video edit, reels ve story tasarımları ile takipçilerinizin ilgisini çekecek görsel içerikler hazırlıyoruz. Trend olan formatları takip ederek viral içerikler oluşturuyoruz.',
    ),
    ServiceItem(
      title: 'Reklam Yönetimi',
      icon: FontAwesomeIcons.bullhorn,
      description:
          'Facebook, Instagram ve Google reklamlarınızı profesyonelce yönetiyoruz. Hedef kitle analizi, bütçe optimizasyonu ve A/B testleri ile reklam performansınızı maksimuma çıkarıyoruz. ROI odaklı kampanyalar ile satışlarınızı artırıyoruz.',
    ),
    ServiceItem(
      title: 'Web Tasarım',
      icon: FontAwesomeIcons.laptop,
      description:
          'Modern ve responsive web siteleri tasarlıyoruz. SEO uyumlu, hızlı yüklenen ve kullanıcı dostu arayüzler ile markanızı dijitalde en iyi şekilde temsil ediyoruz. E-ticaret, kurumsal site ve landing page çözümleri sunuyoruz.',
    ),
    ServiceItem(
      title: 'Sosyal Medya',
      icon: FontAwesomeIcons.hashtag,
      description:
          'Tüm sosyal medya platformlarında markanızı yönetiyoruz. İçerik planlama, topluluk yönetimi, influencer işbirlikleri ve kriz yönetimi ile sosyal medyada güçlü bir varlık oluşturuyoruz. Aylık raporlamalar ile performansınızı takip ediyoruz.',
    ),
    ServiceItem(
      title: 'SEO Optimizasyon',
      icon: FontAwesomeIcons.magnifyingGlass,
      description:
          'Web sitenizin arama motorlarında üst sıralara çıkmasını sağlıyoruz. Teknik SEO, içerik optimizasyonu, backlink stratejileri ve yerel SEO çalışmaları ile organik trafiğinizi artırıyoruz. Rakiplerinizin önüne geçmeniz için stratejiler geliştiriyoruz.',
    ),
    ServiceItem(
      title: 'Video Prodüksiyon',
      icon: FontAwesomeIcons.video,
      description:
          'Profesyonel video çekimi ve post prodüksiyon hizmetleri sunuyoruz. Reklam filmleri, tanıtım videoları, ürün çekimleri ve kurumsal videolar ile markanızın hikayesini en etkili şekilde anlatıyoruz. Drone çekimi ve 360° video hizmetleri de sunuyoruz.',
    ),
    ServiceItem(
      title: 'Influencer Marketing',
      icon: FontAwesomeIcons.userGroup,
      description:
          'Markanıza uygun influencer\'ları belirliyor ve işbirliği süreçlerini yönetiyoruz. Mikro ve makro influencer kampanyaları, ürün yerleştirme ve marka elçiliği programları ile hedef kitlenize ulaşıyoruz. Kampanya performansını detaylı raporluyoruz.',
    ),
    ServiceItem(
      title: 'E-posta Pazarlama',
      icon: FontAwesomeIcons.envelope,
      description:
          'Etkili e-posta kampanyaları tasarlıyor ve yönetiyoruz. Segmentasyon, otomasyon ve A/B testleri ile e-posta pazarlama performansınızı artırıyoruz. Newsletter tasarımı, hoşgeldin serileri ve terk edilen sepet kampanyaları oluşturuyoruz.',
    ),
    ServiceItem(
      title: 'Marka Danışmanlığı',
      icon: FontAwesomeIcons.lightbulb,
      description:
          'Markanızın kimliğini oluşturuyor ve geliştiriyoruz. Logo tasarımı, kurumsal kimlik, marka stratejisi ve konumlandırma çalışmaları ile markanızı rakiplerinizden ayırıyoruz. Marka kılavuzu hazırlayarak tutarlı bir marka imajı oluşturuyoruz.',
    ),
    ServiceItem(
      title: 'Mobil Uygulama',
      icon: FontAwesomeIcons.mobileScreenButton,
      description:
          'iOS ve Android platformları için native ve cross-platform mobil uygulamalar geliştiriyoruz. Kullanıcı dostu arayüzler, push notification, uygulama içi satın alma ve backend entegrasyonları ile tam fonksiyonlu uygulamalar sunuyoruz.',
    ),
    ServiceItem(
      title: 'Dijital Strateji',
      icon: FontAwesomeIcons.chess,
      description:
          'Dijital pazarlama stratejinizi baştan sona planlıyoruz. Pazar analizi, rakip analizi, hedef kitle belirleme ve kanal stratejileri ile dijital dönüşümünüzü sağlıyoruz. KPI belirleme ve performans takibi ile başarıyı ölçümlüyoruz.',
    ),
  ];

  void _showServiceModal(BuildContext context, ServiceItem service) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ServiceModal(service: service),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 64,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFF9333EA)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text(
                              'LOGO',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Text(
                    'Services Page',
                    style: TextStyle(
                      fontFamily: 'IntroRust',
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.briefcase,
                    color: Colors.white,
                    size: 22,
                  ),
                ],
              ),
            ),
            // Grid Content
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return ServiceCard(
                    service: services[index],
                    onTap: () => _showServiceModal(context, services[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final ServiceItem service;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF9333EA), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9333EA).withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          widget.service.icon,
                          color: Colors.white,
                          size: 28,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.service.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 0,
                    left: 0,
                    child: Text(
                      'Detayları Gör',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ServiceModal extends StatefulWidget {
  final ServiceItem service;

  const ServiceModal({super.key, required this.service});

  @override
  State<ServiceModal> createState() => _ServiceModalState();
}

class _ServiceModalState extends State<ServiceModal>
    with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _slideAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              0, MediaQuery.of(context).size.height * _slideAnimation.value),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                // Handle bar
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF9333EA),
                                    Color(0xFF7C3AED)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: FaIcon(
                                widget.service.icon,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                widget.service.title,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2D2D2D),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.service.description,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Ad Soyad',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Adınızı ve soyadınızı girin',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Color(0xFF9333EA)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color(0xFF9333EA), width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'E-posta',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'E-posta adresinizi girin',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Color(0xFF9333EA)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color(0xFF9333EA), width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  // İletişime geç action
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${widget.service.title} için talebiniz alındı!'),
                                      backgroundColor: const Color(0xFF9333EA),
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF9333EA),
                                        Color(0xFF7C3AED)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF9333EA)
                                            .withValues(alpha: 0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'İletişime Geç',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ServiceItem {
  final String title;
  final IconData icon;
  final String description;

  ServiceItem({
    required this.title,
    required this.icon,
    required this.description,
  });
}
