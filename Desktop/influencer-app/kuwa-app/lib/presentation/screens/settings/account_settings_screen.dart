import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

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
          'Hesap Ayarları',
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
              // Profil Fotoğrafı ve Kullanıcı Bilgileri
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Profil Fotoğrafı
                    Container(
                      width: 120,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/ornek.jpeg",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE5E7EB),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Color(0xFF9CA3AF),
                                  size: 60,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'İsmail Selim',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Premium Kullanıcı',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'ismail@example.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Profil Bilgileri
              _buildSection(
                title: 'Profil Bilgileri',
                children: [
                  _buildSettingItem(
                    icon: FontAwesomeIcons.user,
                    title: 'Ad Soyad',
                    subtitle: 'İsmail Selim',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.envelope,
                    title: 'E-posta',
                    subtitle: 'ismail@example.com',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.phone,
                    title: 'Telefon',
                    subtitle: '+90 555 123 45 67',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Hesap Güvenliği
              _buildSection(
                title: 'Hesap Güvenliği',
                children: [
                  _buildSettingItem(
                    icon: FontAwesomeIcons.lock,
                    title: 'Şifre Değiştir',
                    subtitle: 'Son değişiklik: 2 hafta önce',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.shield,
                    title: 'İki Faktörlü Doğrulama',
                    subtitle: 'Aktif',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Hesap Yönetimi
              _buildSection(
                title: 'Hesap Yönetimi',
                children: [
                  _buildSettingItem(
                    icon: FontAwesomeIcons.download,
                    title: 'Verilerimi İndir',
                    subtitle: 'Hesap verilerinizi indirin',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.trash,
                    title: 'Hesabı Sil',
                    subtitle: 'Hesabınızı kalıcı olarak silin',
                    onTap: () {},
                    isDestructive: true,
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

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
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
            color: isDestructive
                ? Colors.red.withValues(alpha: 0.1)
                : const Color(0xFF8B5CF6).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isDestructive ? Colors.red : const Color(0xFF8B5CF6),
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDestructive ? Colors.red : const Color(0xFF1F2937),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          size: 16,
          color: const Color(0xFF9CA3AF),
        ),
      ),
    );
  }
}
