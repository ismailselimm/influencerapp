import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  bool _marketingNotifications = false;
  bool _orderUpdates = true;
  bool _securityAlerts = true;
  bool _appUpdates = true;
  bool _promotionalOffers = false;

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
          'Bildirim Ayarları',
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
              // Genel Bildirimler
              _buildSection(
                title: 'Genel Bildirimler',
                children: [
                  _buildNotificationItem(
                    icon: FontAwesomeIcons.bell,
                    title: 'Push Bildirimleri',
                    subtitle: 'Uygulama bildirimlerini al',
                    value: _pushNotifications,
                    onChanged: (value) {
                      setState(() {
                        _pushNotifications = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: FontAwesomeIcons.envelope,
                    title: 'E-posta Bildirimleri',
                    subtitle: 'E-posta ile bildirim al',
                    value: _emailNotifications,
                    onChanged: (value) {
                      setState(() {
                        _emailNotifications = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: FontAwesomeIcons.sms,
                    title: 'SMS Bildirimleri',
                    subtitle: 'SMS ile bildirim al',
                    value: _smsNotifications,
                    onChanged: (value) {
                      setState(() {
                        _smsNotifications = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Uygulama Bildirimleri
              _buildSection(
                title: 'Uygulama Bildirimleri',
                children: [
                  _buildNotificationItem(
                    icon: FontAwesomeIcons.shoppingBag,
                    title: 'Sipariş Güncellemeleri',
                    subtitle: 'Sipariş durumu değişiklikleri',
                    value: _orderUpdates,
                    onChanged: (value) {
                      setState(() {
                        _orderUpdates = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: FontAwesomeIcons.shield,
                    title: 'Güvenlik Uyarıları',
                    subtitle: 'Hesap güvenliği ile ilgili uyarılar',
                    value: _securityAlerts,
                    onChanged: (value) {
                      setState(() {
                        _securityAlerts = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: FontAwesomeIcons.download,
                    title: 'Uygulama Güncellemeleri',
                    subtitle: 'Yeni özellikler ve güncellemeler',
                    value: _appUpdates,
                    onChanged: (value) {
                      setState(() {
                        _appUpdates = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Pazarlama Bildirimleri
              _buildSection(
                title: 'Pazarlama Bildirimleri',
                children: [
                  _buildNotificationItem(
                    icon: FontAwesomeIcons.bullhorn,
                    title: 'Pazarlama Bildirimleri',
                    subtitle: 'Özel teklifler ve kampanyalar',
                    value: _marketingNotifications,
                    onChanged: (value) {
                      setState(() {
                        _marketingNotifications = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: FontAwesomeIcons.gift,
                    title: 'Promosyon Teklifleri',
                    subtitle: 'İndirim ve özel fırsatlar',
                    value: _promotionalOffers,
                    onChanged: (value) {
                      setState(() {
                        _promotionalOffers = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Tümünü Aç/Kapat Butonları
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _enableAllNotifications,
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
                      onPressed: _disableAllNotifications,
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

  Widget _buildNotificationItem({
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

  void _enableAllNotifications() {
    setState(() {
      _pushNotifications = true;
      _emailNotifications = true;
      _smsNotifications = true;
      _marketingNotifications = true;
      _orderUpdates = true;
      _securityAlerts = true;
      _appUpdates = true;
      _promotionalOffers = true;
    });
  }

  void _disableAllNotifications() {
    setState(() {
      _pushNotifications = false;
      _emailNotifications = false;
      _smsNotifications = false;
      _marketingNotifications = false;
      _orderUpdates = false;
      _securityAlerts = false;
      _appUpdates = false;
      _promotionalOffers = false;
    });
  }
}
