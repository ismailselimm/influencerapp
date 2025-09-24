import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/animated_background.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import '../../../shared/design_tokens/app_colors.dart';
import '../../../shared/design_tokens/app_typography.dart';
import '../../../shared/design_tokens/app_spacing.dart';
import '../../../shared/utils/validators.dart';
import '../../../application/providers/auth_provider.dart';
import '../../../domain/entities/auth_credentials.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    final credentials = RegisterCredentials(
      fullName: _fullNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    final user = await ref.read(authStateProvider.notifier).register(credentials);
    
    if (user != null && mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final isLoading = authState.isLoading;

    return AnimatedBackground(
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Header - Kuwa branding without background
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 70,
                    color: AppColors.primary,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                        'Kuwa',
                        style: AppTypography.titleLarge.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 48),
                
                // Register Form Container - Clean white design
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.border,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Welcome Text
                        Text(
                          'Hesap Oluşturun',
                          style: AppTypography.headlineMedium.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: 8),
                        Text(
                          'Yeni bir hesap oluşturun',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Full Name Input
                        CustomTextField(
                          controller: _fullNameController,
                          hint: 'Ad Soyad',
                          prefixIcon: Icon(Icons.person_rounded), // Updated icon from Icons Light SVG
                          validator: Validators.name,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Email Input
                        CustomTextField(
                          controller: _emailController,
                          hint: 'E-posta adresiniz',
                          prefixIcon: Icon(Icons.alternate_email_rounded), // Updated icon from Icons Light SVG
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.email,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Password Input
                        CustomTextField(
                          controller: _passwordController,
                          hint: 'Şifreniz',
                          prefixIcon: Icon(Icons.lock_rounded), // Updated icon from Icons Light SVG
                          obscureText: true,
                          validator: Validators.password,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Confirm Password Input
                        CustomTextField(
                          controller: _confirmPasswordController,
                          hint: 'Şifrenizi tekrar girin',
                          prefixIcon: Icon(Icons.lock_rounded), // Updated icon from Icons Light SVG
                          obscureText: true,
                          validator: (value) => Validators.confirmPassword(
                            value, 
                            _passwordController.text,
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Register Button with Gradient
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : Text(
                                    'Kayıt Ol',
                                    style: AppTypography.labelLarge.copyWith(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Login Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Zaten bir hesabınız var mı? ',
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.go('/login'),
                              child: ShaderMask(
                                shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                                child: Text(
                                  'Giriş Yap',
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: AppColors.white,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}