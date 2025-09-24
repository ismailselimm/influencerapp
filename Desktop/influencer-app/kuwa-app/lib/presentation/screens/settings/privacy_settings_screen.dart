import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _profileVisibility = true;
  bool _showEmail = false;
  bool _showPhone = false;
  bool _showBirthDate = false;
  bool _showLocation = false;
  bool _allowMessages = true;
  bool _allowFriendRequests = true;
  bool _allowTagging = true;
  bool _dataCollection = true;
  bool _analytics = true;
  bool _marketingData = false;
  bool _locationTracking = true;
  bool _cameraAccess = true;
  bool _microphoneAccess = false;
  bool _contactsAccess = false;

  @override
  Widget build(BuildContext context) {
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
          'Gizlilik ve Güvenlik',
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
              // Profil Gizliliği
              _buildSection(
                title: 'Profil Gizliliği',
                children: [
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.eye,
                    title: 'Profil Görünürlüğü',
                    subtitle: 'Profilinizi herkese açık yapın',
                    value: _profileVisibility,
                    onChanged: (value) {
                      setState(() {
                        _profileVisibility = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.envelope,
                    title: 'E-posta Görünürlüğü',
                    subtitle: 'E-posta adresinizi diğer kullanıcılara göster',
                    value: _showEmail,
                    onChanged: (value) {
                      setState(() {
                        _showEmail = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.phone,
                    title: 'Telefon Görünürlüğü',
                    subtitle: 'Telefon numaranızı diğer kullanıcılara göster',
                    value: _showPhone,
                    onChanged: (value) {
                      setState(() {
                        _showPhone = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.calendar,
                    title: 'Doğum Tarihi Görünürlüğü',
                    subtitle: 'Doğum tarihinizi diğer kullanıcılara göster',
                    value: _showBirthDate,
                    onChanged: (value) {
                      setState(() {
                        _showBirthDate = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.locationDot,
                    title: 'Konum Görünürlüğü',
                    subtitle: 'Konumunuzu diğer kullanıcılara göster',
                    value: _showLocation,
                    onChanged: (value) {
                      setState(() {
                        _showLocation = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Sosyal Etkileşim
              _buildSection(
                title: 'Sosyal Etkileşim',
                children: [
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.comment,
                    title: 'Mesaj Alma',
                    subtitle: 'Diğer kullanıcılardan mesaj alabilirsiniz',
                    value: _allowMessages,
                    onChanged: (value) {
                      setState(() {
                        _allowMessages = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.userPlus,
                    title: 'Arkadaş İstekleri',
                    subtitle:
                        'Diğer kullanıcılardan arkadaş isteği alabilirsiniz',
                    value: _allowFriendRequests,
                    onChanged: (value) {
                      setState(() {
                        _allowFriendRequests = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.tag,
                    title: 'Etiketleme',
                    subtitle: 'Diğer kullanıcılar sizi etiketleyebilir',
                    value: _allowTagging,
                    onChanged: (value) {
                      setState(() {
                        _allowTagging = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Veri Kullanımı
              _buildSection(
                title: 'Veri Kullanımı',
                children: [
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.database,
                    title: 'Veri Toplama',
                    subtitle: 'Uygulama performansı için veri toplama',
                    value: _dataCollection,
                    onChanged: (value) {
                      setState(() {
                        _dataCollection = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.chartLine,
                    title: 'Analitik Veriler',
                    subtitle: 'Kullanım analizi için veri toplama',
                    value: _analytics,
                    onChanged: (value) {
                      setState(() {
                        _analytics = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.bullhorn,
                    title: 'Pazarlama Verileri',
                    subtitle: 'Kişiselleştirilmiş reklamlar için veri toplama',
                    value: _marketingData,
                    onChanged: (value) {
                      setState(() {
                        _marketingData = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Uygulama İzinleri
              _buildSection(
                title: 'Uygulama İzinleri',
                children: [
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.locationDot,
                    title: 'Konum Erişimi',
                    subtitle: 'Konum bilginize erişim izni',
                    value: _locationTracking,
                    onChanged: (value) {
                      setState(() {
                        _locationTracking = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.camera,
                    title: 'Kamera Erişimi',
                    subtitle: 'Kameranıza erişim izni',
                    value: _cameraAccess,
                    onChanged: (value) {
                      setState(() {
                        _cameraAccess = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.microphone,
                    title: 'Mikrofon Erişimi',
                    subtitle: 'Mikrofonunuza erişim izni',
                    value: _microphoneAccess,
                    onChanged: (value) {
                      setState(() {
                        _microphoneAccess = value;
                      });
                    },
                  ),
                  _buildPrivacyItem(
                    icon: FontAwesomeIcons.addressBook,
                    title: 'Kişiler Erişimi',
                    subtitle: 'Kişiler listenize erişim izni',
                    value: _contactsAccess,
                    onChanged: (value) {
                      setState(() {
                        _contactsAccess = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Güvenlik Butonları
              _buildSecurityButtons(),

              const SizedBox(height: 24),

              // Tümünü Aç/Kapat Butonları
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _enableAllPrivacy,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B5CF6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Tümünü Aç',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _disableAllPrivacy,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: const Color(0xFF1F2937),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Tümünü Kapat',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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

  Widget _buildPrivacyItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
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
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF8B5CF6),
          activeTrackColor: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          inactiveThumbColor: Colors.grey[300],
          inactiveTrackColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildSecurityButtons() {
    return Column(
      children: [
        Container(
          width: double.infinity,
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
          child: Column(
            children: [
              ListTile(
                onTap: _changePassword,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.lock,
                    color: Colors.orange,
                    size: 20,
                  ),
                ),
                title: const Text(
                  'Şifre Değiştir',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                subtitle: const Text(
                  'Hesap güvenliğiniz için şifrenizi güncelleyin',
                  style: TextStyle(
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
              const Divider(height: 1),
              ListTile(
                onTap: _enableTwoFactor,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.shield,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                title: const Text(
                  'İki Faktörlü Doğrulama',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                subtitle: const Text(
                  'Hesabınızı daha güvenli hale getirin',
                  style: TextStyle(
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
              const Divider(height: 1),
              ListTile(
                onTap: _downloadData,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.download,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                title: const Text(
                  'Verilerimi İndir',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                subtitle: const Text(
                  'Hesap verilerinizi indirin',
                  style: TextStyle(
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
            ],
          ),
        ),
      ],
    );
  }

  void _enableAllPrivacy() {
    setState(() {
      _profileVisibility = true;
      _showEmail = true;
      _showPhone = true;
      _showBirthDate = true;
      _showLocation = true;
      _allowMessages = true;
      _allowFriendRequests = true;
      _allowTagging = true;
      _dataCollection = true;
      _analytics = true;
      _marketingData = true;
      _locationTracking = true;
      _cameraAccess = true;
      _microphoneAccess = true;
      _contactsAccess = true;
    });
  }

  void _disableAllPrivacy() {
    setState(() {
      _profileVisibility = false;
      _showEmail = false;
      _showPhone = false;
      _showBirthDate = false;
      _showLocation = false;
      _allowMessages = false;
      _allowFriendRequests = false;
      _allowTagging = false;
      _dataCollection = false;
      _analytics = false;
      _marketingData = false;
      _locationTracking = false;
      _cameraAccess = false;
      _microphoneAccess = false;
      _contactsAccess = false;
    });
  }

  void _changePassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Şifre Değiştir'),
        content: const Text('Şifre değiştirme sayfasına yönlendirileceksiniz.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Şifre değiştirme sayfasına yönlendirme
            },
            child: const Text('Devam Et'),
          ),
        ],
      ),
    );
  }

  void _enableTwoFactor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('İki Faktörlü Doğrulama'),
        content: const Text(
            'İki faktörlü doğrulama ayarları sayfasına yönlendirileceksiniz.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // İki faktörlü doğrulama sayfasına yönlendirme
            },
            child: const Text('Devam Et'),
          ),
        ],
      ),
    );
  }

  void _downloadData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Verilerimi İndir'),
        content: const Text(
            'Hesap verileriniz hazırlanıyor. E-posta adresinize gönderilecek.'),
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
