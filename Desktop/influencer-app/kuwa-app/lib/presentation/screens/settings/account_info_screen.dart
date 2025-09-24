import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'İsmail Selim');
  final _emailController = TextEditingController(text: 'ismail@example.com');
  final _phoneController = TextEditingController(text: '+90 555 123 45 67');
  final _birthDateController = TextEditingController(text: '15 Mart 1990');
  final _addressController = TextEditingController(text: 'İstanbul, Türkiye');
  final _bioController =
      TextEditingController(text: 'Kuwa uygulamasının aktif kullanıcısıyım.');

  bool _isEditing = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    _addressController.dispose();
    _bioController.dispose();
    super.dispose();
  }

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
          'Hesap Bilgileri',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
                if (!_isEditing) {
                  // Kaydet işlemi
                  if (_formKey.currentState!.validate()) {
                    _saveChanges();
                  }
                }
              });
            },
            child: Text(
              _isEditing ? 'Kaydet' : 'Düzenle',
              style: TextStyle(
                color: _isEditing
                    ? const Color(0xFF8B5CF6)
                    : const Color(0xFF1F2937),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profil Fotoğrafı Bölümü
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
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
                          if (_isEditing)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF8B5CF6),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF8B5CF6)
                                          .withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: _changeProfilePhoto,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.camera,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Profil Fotoğrafını Değiştir',
                        style: TextStyle(
                          fontSize: 14,
                          color: _isEditing
                              ? const Color(0xFF8B5CF6)
                              : const Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Kişisel Bilgiler
                _buildSection(
                  title: 'Kişisel Bilgiler',
                  children: [
                    _buildTextField(
                      controller: _nameController,
                      icon: FontAwesomeIcons.user,
                      label: 'Ad Soyad',
                      hint: 'Adınızı ve soyadınızı girin',
                      enabled: _isEditing,
                    ),
                    _buildTextField(
                      controller: _emailController,
                      icon: FontAwesomeIcons.envelope,
                      label: 'E-posta',
                      hint: 'E-posta adresinizi girin',
                      enabled: _isEditing,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _buildTextField(
                      controller: _phoneController,
                      icon: FontAwesomeIcons.phone,
                      label: 'Telefon',
                      hint: 'Telefon numaranızı girin',
                      enabled: _isEditing,
                      keyboardType: TextInputType.phone,
                    ),
                    _buildTextField(
                      controller: _birthDateController,
                      icon: FontAwesomeIcons.calendar,
                      label: 'Doğum Tarihi',
                      hint: 'Doğum tarihinizi girin',
                      enabled: _isEditing,
                      readOnly: true,
                      onTap: _isEditing ? _selectBirthDate : null,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Adres Bilgileri
                _buildSection(
                  title: 'Adres Bilgileri',
                  children: [
                    _buildTextField(
                      controller: _addressController,
                      icon: FontAwesomeIcons.locationDot,
                      label: 'Adres',
                      hint: 'Adresinizi girin',
                      enabled: _isEditing,
                      maxLines: 2,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Hakkında
                _buildSection(
                  title: 'Hakkında',
                  children: [
                    _buildTextField(
                      controller: _bioController,
                      icon: FontAwesomeIcons.userEdit,
                      label: 'Biyografi',
                      hint: 'Kendiniz hakkında kısa bir açıklama yazın',
                      enabled: _isEditing,
                      maxLines: 3,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Kaydet Butonu (Sadece düzenleme modunda görünür)
                if (_isEditing)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B5CF6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Değişiklikleri Kaydet',
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

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    required String hint,
    required bool enabled,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        keyboardType: keyboardType,
        maxLines: maxLines,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(left: 16, right: 8),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: enabled ? Colors.white : const Color(0xFFF9FAFB),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Bu alan zorunludur';
          }
          if (label == 'E-posta' && !value.contains('@')) {
            return 'Geçerli bir e-posta adresi girin';
          }
          return null;
        },
      ),
    );
  }

  void _changeProfilePhoto() {
    // Profil fotoğrafı değiştirme işlemi
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Profil Fotoğrafı'),
        content:
            const Text('Profil fotoğrafınızı nasıl değiştirmek istiyorsunuz?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Kamera açma işlemi
            },
            child: const Text('Kameradan Çek'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Galeri açma işlemi
            },
            child: const Text('Galeriden Seç'),
          ),
        ],
      ),
    );
  }

  void _selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 3, 15),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text =
            '${picked.day} ${_getMonthName(picked.month)} ${picked.year}';
      });
    }
  }

  String _getMonthName(int month) {
    const months = [
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayıs',
      'Haziran',
      'Temmuz',
      'Ağustos',
      'Eylül',
      'Ekim',
      'Kasım',
      'Aralık'
    ];
    return months[month - 1];
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      // Kaydetme işlemi
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bilgileriniz başarıyla güncellendi'),
          backgroundColor: Color(0xFF8B5CF6),
        ),
      );
      setState(() {
        _isEditing = false;
      });
    }
  }
}
