import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _faqItems = [
    {
      'question': 'Hesabımı nasıl oluşturabilirim?',
      'answer':
          'Hesap oluşturmak için ana sayfadaki "Kayıt Ol" butonuna tıklayın ve gerekli bilgileri doldurun. E-posta adresinizi doğruladıktan sonra hesabınız aktif olacaktır.',
      'category': 'Hesap',
    },
    {
      'question': 'Şifremi nasıl sıfırlayabilirim?',
      'answer':
          'Şifre sıfırlama için giriş sayfasındaki "Şifremi Unuttum" linkine tıklayın. E-posta adresinize gönderilen link ile yeni şifrenizi belirleyebilirsiniz.',
      'category': 'Hesap',
    },
    {
      'question': 'Ödeme nasıl yapabilirim?',
      'answer':
          'Kredi kartı, banka kartı, mobil ödeme veya banka havalesi ile ödeme yapabilirsiniz. Güvenli ödeme için 3D Secure kullanılmaktadır.',
      'category': 'Ödeme',
    },
    {
      'question': 'Paket satın alma işlemi nasıl çalışır?',
      'answer':
          'Paketler bölümünden istediğiniz paketi seçin, ödeme bilgilerinizi girin ve satın alma işlemini tamamlayın. Paket anında hesabınıza yansıyacaktır.',
      'category': 'Paketler',
    },
    {
      'question': 'Hizmet talebim nasıl işlenir?',
      'answer':
          'Hizmetler bölümünden istediğiniz hizmeti seçin ve detayları doldurun. Uzmanımız en kısa sürede size dönüş yapacaktır.',
      'category': 'Hizmetler',
    },
    {
      'question': 'Bildirimleri nasıl yönetebilirim?',
      'answer':
          'Profil > Ayarlar > Bildirimler bölümünden hangi bildirimleri almak istediğinizi seçebilirsiniz.',
      'category': 'Bildirimler',
    },
    {
      'question': 'Hesabımı nasıl silebilirim?',
      'answer':
          'Profil > Ayarlar > Hesap Ayarları > Hesabı Sil bölümünden hesabınızı kalıcı olarak silebilirsiniz.',
      'category': 'Hesap',
    },
    {
      'question': 'Uygulama çöküyor, ne yapmalıyım?',
      'answer':
          'Uygulamayı kapatıp yeniden açmayı deneyin. Sorun devam ederse cihazınızı yeniden başlatın veya uygulamayı güncelleyin.',
      'category': 'Teknik',
    },
  ];

  final List<Map<String, dynamic>> _contactMethods = [
    {
      'title': 'Canlı Destek',
      'subtitle': '7/24 anında yardım alın',
      'icon': FontAwesomeIcons.comments,
      'color': Colors.green,
      'action': 'startLiveChat',
    },
    {
      'title': 'E-posta Desteği',
      'subtitle': 'support@kuwa.com',
      'icon': FontAwesomeIcons.envelope,
      'color': Colors.blue,
      'action': 'sendEmail',
    },
    {
      'title': 'Telefon Desteği',
      'subtitle': '+90 212 555 0123',
      'icon': FontAwesomeIcons.phone,
      'color': Colors.orange,
      'action': 'callPhone',
    },
    {
      'title': 'WhatsApp Desteği',
      'subtitle': 'Hızlı mesajlaşma',
      'icon': FontAwesomeIcons.whatsapp,
      'color': Colors.green,
      'action': 'openWhatsApp',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredFaqs = _faqItems.where((faq) {
      return faq['question']
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          faq['answer'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          faq['category'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Color(0xFF1F2937),
            size: 20,
          ),
        ),
        title: const Text(
          'Yardım & Destek',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Arama Çubuğu
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Yardım arayın...',
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Color(0xFF8B5CF6),
                      size: 20,
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.xmark,
                              color: Color(0xFF9CA3AF),
                              size: 16,
                            ),
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Hızlı Erişim
              _buildSection(
                title: 'Hızlı Erişim',
                children: [
                  _buildQuickAccessItem(
                    icon: FontAwesomeIcons.circleQuestion,
                    title: 'Sık Sorulan Sorular',
                    subtitle: 'En çok merak edilen konular',
                    onTap: () => _scrollToFAQs(),
                  ),
                  _buildQuickAccessItem(
                    icon: FontAwesomeIcons.book,
                    title: 'Kullanım Kılavuzu',
                    subtitle: 'Uygulama nasıl kullanılır?',
                    onTap: () => _openUserGuide(),
                  ),
                  _buildQuickAccessItem(
                    icon: FontAwesomeIcons.video,
                    title: 'Video Eğitimler',
                    subtitle: 'Görsel öğrenme materyalleri',
                    onTap: () => _openVideoTutorials(),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // İletişim Yöntemleri
              _buildSection(
                title: 'İletişim Yöntemleri',
                children: _contactMethods
                    .map((method) => _buildContactMethod(method))
                    .toList(),
              ),

              const SizedBox(height: 24),

              // SSS
              _buildSection(
                title: 'Sık Sorulan Sorular',
                children:
                    filteredFaqs.map((faq) => _buildFAQItem(faq)).toList(),
              ),

              const SizedBox(height: 24),

              // Geri Bildirim
              _buildFeedbackSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildQuickAccessItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF8B5CF6),
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
        trailing: const Icon(
          FontAwesomeIcons.chevronRight,
          size: 16,
          color: Color(0xFF9CA3AF),
        ),
      ),
    );
  }

  Widget _buildContactMethod(Map<String, dynamic> method) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => _handleContactMethod(method['action']),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: method['color'].withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FaIcon(
              method['icon'],
              color: method['color'],
              size: 20,
            ),
          ),
        ),
        title: Text(
          method['title'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        subtitle: Text(
          method['subtitle'],
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
        trailing: const Icon(
          FontAwesomeIcons.chevronRight,
          size: 16,
          color: Color(0xFF9CA3AF),
        ),
      ),
    );
  }

  Widget _buildFAQItem(Map<String, dynamic> faq) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            FontAwesomeIcons.question,
            color: Color(0xFF8B5CF6),
            size: 16,
          ),
        ),
        title: Text(
          faq['question'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        subtitle: Text(
          faq['category'],
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF8B5CF6),
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          Text(
            faq['answer'],
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF8B5CF6),
            Color(0xFF7C3AED),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const FaIcon(
            FontAwesomeIcons.star,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(height: 12),
          const Text(
            'Geri Bildirim Gönderin',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Deneyiminizi bizimle paylaşın ve uygulamayı geliştirmemize yardımcı olun.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _sendFeedback,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF8B5CF6),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Geri Bildirim Gönder',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: _rateApp,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Uygulamayı Değerlendir',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _scrollToFAQs() {
    // SSS bölümüne kaydırma
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('SSS bölümüne kaydırılıyor...')),
    );
  }

  void _openUserGuide() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kullanım Kılavuzu'),
        content: const Text('Kullanım kılavuzu sayfası açılacak.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _openVideoTutorials() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Video Eğitimler'),
        content: const Text('Video eğitimler sayfası açılacak.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _handleContactMethod(String action) {
    switch (action) {
      case 'startLiveChat':
        _startLiveChat();
        break;
      case 'sendEmail':
        _sendEmail();
        break;
      case 'callPhone':
        _callPhone();
        break;
      case 'openWhatsApp':
        _openWhatsApp();
        break;
    }
  }

  void _startLiveChat() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Canlı Destek'),
        content: const Text('Canlı destek bağlantısı kuruluyor...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _sendEmail() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('E-posta Desteği'),
        content: const Text('E-posta uygulaması açılacak.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _callPhone() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Telefon Desteği'),
        content: const Text('Telefon uygulaması açılacak.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _openWhatsApp() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('WhatsApp Desteği'),
        content: const Text('WhatsApp açılacak.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _sendFeedback() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Geri Bildirim Gönder',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Geri bildiriminizi yazın...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Geri bildiriminiz gönderildi')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8B5CF6),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Gönder',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _rateApp() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Uygulamayı Değerlendir'),
        content: const Text('Uygulama mağazası açılacak.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }
}
