import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int _selectedCardIndex = 0;

  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'type': 'card',
      'name': 'Visa Kart',
      'number': '**** **** **** 1234',
      'expiry': '12/25',
      'icon': FontAwesomeIcons.creditCard,
      'color': const Color(0xFF1A1F71),
      'isDefault': true,
    },
    {
      'type': 'card',
      'name': 'Mastercard',
      'number': '**** **** **** 5678',
      'expiry': '08/26',
      'icon': FontAwesomeIcons.creditCard,
      'color': const Color(0xFFEB001B),
      'isDefault': false,
    },
    {
      'type': 'bank',
      'name': 'Garanti BBVA',
      'number': '**** **** **** 9012',
      'expiry': 'Aktif',
      'icon': FontAwesomeIcons.buildingColumns,
      'color': const Color(0xFF8B5CF6),
      'isDefault': false,
    },
  ];

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
          'Ödeme Bilgileri',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _addPaymentMethod,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
              color: Color(0xFF8B5CF6),
              size: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mevcut Ödeme Yöntemleri
              _buildSection(
                title: 'Mevcut Ödeme Yöntemleri',
                children: [
                  ...List.generate(_paymentMethods.length, (index) {
                    final method = _paymentMethods[index];
                    return _buildPaymentMethodCard(
                      method: method,
                      index: index,
                      isSelected: _selectedCardIndex == index,
                    );
                  }),
                ],
              ),

              const SizedBox(height: 24),

              // Hızlı Ödeme Seçenekleri
              _buildSection(
                title: 'Hızlı Ödeme Seçenekleri',
                children: [
                  _buildQuickPaymentOption(
                    icon: FontAwesomeIcons.mobile,
                    title: 'Mobil Ödeme',
                    subtitle: 'Telefon faturanıza yansıtın',
                    onTap: () => _setupMobilePayment(),
                  ),
                  _buildQuickPaymentOption(
                    icon: FontAwesomeIcons.wallet,
                    title: 'Dijital Cüzdan',
                    subtitle: 'Apple Pay, Google Pay',
                    onTap: () => _setupDigitalWallet(),
                  ),
                  _buildQuickPaymentOption(
                    icon: FontAwesomeIcons.buildingColumns,
                    title: 'Banka Havalesi',
                    subtitle: 'Doğrudan banka hesabından',
                    onTap: () => _setupBankTransfer(),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Ödeme Geçmişi
              _buildSection(
                title: 'Son Ödemeler',
                children: [
                  _buildPaymentHistoryItem(
                    title: 'Premium Üyelik',
                    amount: '₺29.99',
                    date: '15 Aralık 2024',
                    status: 'Başarılı',
                    icon: FontAwesomeIcons.crown,
                    color: Colors.amber,
                  ),
                  _buildPaymentHistoryItem(
                    title: 'Paket Satın Alma',
                    amount: '₺99.99',
                    date: '10 Aralık 2024',
                    status: 'Başarılı',
                    icon: FontAwesomeIcons.box,
                    color: Colors.blue,
                  ),
                  _buildPaymentHistoryItem(
                    title: 'Hizmet Ücreti',
                    amount: '₺49.99',
                    date: '5 Aralık 2024',
                    status: 'İptal Edildi',
                    icon: FontAwesomeIcons.tools,
                    color: Colors.red,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Ödeme Ayarları
              _buildSection(
                title: 'Ödeme Ayarları',
                children: [
                  _buildSettingItem(
                    icon: FontAwesomeIcons.bell,
                    title: 'Ödeme Bildirimleri',
                    subtitle: 'Ödeme durumu bildirimlerini al',
                    onTap: () => _managePaymentNotifications(),
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.shield,
                    title: 'Güvenli Ödeme',
                    subtitle: '3D Secure ve güvenlik ayarları',
                    onTap: () => _manageSecuritySettings(),
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.receipt,
                    title: 'Fatura Ayarları',
                    subtitle: 'Fatura tercihlerinizi yönetin',
                    onTap: () => _manageInvoiceSettings(),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Yeni Ödeme Yöntemi Ekle Butonu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _addPaymentMethod,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5CF6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const FaIcon(FontAwesomeIcons.plus, size: 18),
                  label: const Text(
                    'Yeni Ödeme Yöntemi Ekle',
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

  Widget _buildPaymentMethodCard({
    required Map<String, dynamic> method,
    required int index,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: const Color(0xFF8B5CF6), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            _selectedCardIndex = index;
          });
        },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
        title: Row(
          children: [
            Text(
              method['name'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
            if (method['isDefault']) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Varsayılan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(
          '${method['number']} • ${method['expiry']}',
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handlePaymentMethodAction(value, index),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Text('Düzenle'),
            ),
            const PopupMenuItem(
              value: 'default',
              child: Text('Varsayılan Yap'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('Sil', style: TextStyle(color: Colors.red)),
            ),
          ],
          child: const FaIcon(
            FontAwesomeIcons.ellipsisVertical,
            color: Color(0xFF9CA3AF),
            size: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickPaymentOption({
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

  Widget _buildPaymentHistoryItem({
    required String title,
    required String amount,
    required String date,
    required String status,
    required IconData icon,
    required Color color,
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
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
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
          date,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: status == 'Başarılı'
                    ? Colors.green.withValues(alpha: 0.1)
                    : Colors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: status == 'Başarılı' ? Colors.green : Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
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

  void _addPaymentMethod() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
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
                'Yeni Ödeme Yöntemi Ekle',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildAddMethodOption(
                    icon: FontAwesomeIcons.creditCard,
                    title: 'Kredi/Banka Kartı',
                    subtitle: 'Visa, Mastercard, American Express',
                    onTap: () => _addCard(),
                  ),
                  _buildAddMethodOption(
                    icon: FontAwesomeIcons.buildingColumns,
                    title: 'Banka Hesabı',
                    subtitle: 'Doğrudan banka hesabından ödeme',
                    onTap: () => _addBankAccount(),
                  ),
                  _buildAddMethodOption(
                    icon: FontAwesomeIcons.mobile,
                    title: 'Mobil Ödeme',
                    subtitle: 'Telefon faturanıza yansıtın',
                    onTap: () => _addMobilePayment(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddMethodOption({
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
        border: Border.all(color: const Color(0xFFE5E7EB)),
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

  void _handlePaymentMethodAction(String action, int index) {
    switch (action) {
      case 'edit':
        _editPaymentMethod(index);
        break;
      case 'default':
        _setAsDefault(index);
        break;
      case 'delete':
        _deletePaymentMethod(index);
        break;
    }
  }

  void _editPaymentMethod(int index) {
    // Düzenleme sayfasına yönlendirme
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ödeme yöntemi düzenleme sayfası açılacak')),
    );
  }

  void _setAsDefault(int index) {
    setState(() {
      for (int i = 0; i < _paymentMethods.length; i++) {
        _paymentMethods[i]['isDefault'] = i == index;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Varsayılan ödeme yöntemi güncellendi')),
    );
  }

  void _deletePaymentMethod(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ödeme Yöntemini Sil'),
        content: const Text(
            'Bu ödeme yöntemini silmek istediğinizden emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _paymentMethods.removeAt(index);
                if (_selectedCardIndex >= _paymentMethods.length) {
                  _selectedCardIndex = 0;
                }
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ödeme yöntemi silindi')),
              );
            },
            child: const Text('Sil', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _setupMobilePayment() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mobil ödeme ayarları sayfası açılacak')),
    );
  }

  void _setupDigitalWallet() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dijital cüzdan ayarları sayfası açılacak')),
    );
  }

  void _setupBankTransfer() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Banka havalesi ayarları sayfası açılacak')),
    );
  }

  void _managePaymentNotifications() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Ödeme bildirimleri ayarları sayfası açılacak')),
    );
  }

  void _manageSecuritySettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Güvenlik ayarları sayfası açılacak')),
    );
  }

  void _manageInvoiceSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fatura ayarları sayfası açılacak')),
    );
  }

  void _addCard() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kart ekleme sayfası açılacak')),
    );
  }

  void _addBankAccount() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Banka hesabı ekleme sayfası açılacak')),
    );
  }

  void _addMobilePayment() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mobil ödeme ekleme sayfası açılacak')),
    );
  }
}
