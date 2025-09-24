import 'package:flutter/material.dart';
import '../../shared/design_tokens/app_colors.dart';
import '../../shared/design_tokens/app_typography.dart';
import '../../shared/design_tokens/app_spacing.dart';

enum ButtonVariant { primary, secondary, outline, ghost }
enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isLoading;
  final Widget? icon;
  final bool fullWidth;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.icon,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null && !isLoading;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: _getButtonStyle(),
        child: isLoading
            ? _buildLoadingIndicator()
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  Text(
                    text,
                    style: _getTextStyle(),
                  ),
                ],
              ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 36; // Figma small button height from Buttons.svg
      case ButtonSize.medium:
        return 44; // Figma medium button height from Buttons.svg
      case ButtonSize.large:
        return 52; // Figma large button height from Buttons.svg
    }
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(),
      foregroundColor: _getTextColor(),
      elevation: variant == ButtonVariant.primary ? 2 : 0, // Add slight elevation for primary buttons
      shadowColor: variant == ButtonVariant.primary ? AppColors.primary.withOpacity(0.3) : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14), // Updated Figma button radius from Buttons.svg
        side: _getBorderSide(),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(),
        vertical: _getVerticalPadding(),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.primary; // Figma primary filled button
      case ButtonVariant.secondary:
        return Colors.transparent; // Figma secondary outlined button  
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
        return Colors.transparent;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.textOnPrimary; // White text on purple
      case ButtonVariant.secondary:
        return AppColors.primary; // Purple text on transparent
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
        return AppColors.textPrimary;
    }
  }

  BorderSide _getBorderSide() {
    switch (variant) {
      case ButtonVariant.secondary:
        return const BorderSide(color: AppColors.primary, width: 2); // Thicker border from Buttons.svg
      case ButtonVariant.outline:
        return const BorderSide(color: AppColors.border, width: 1.5); // Slightly thicker for better visibility
      case ButtonVariant.primary:
      case ButtonVariant.ghost:
        return BorderSide.none;
    }
  }

  double _getHorizontalPadding() {
    switch (size) {
      case ButtonSize.small:
        return AppSpacing.md; // 16
      case ButtonSize.medium:
        return AppSpacing.lg; // 24
      case ButtonSize.large:
        return 28; // Custom value from Buttons.svg
    }
  }

  double _getVerticalPadding() {
    return AppSpacing.sm;
  }

  TextStyle _getTextStyle() {
    // Font sizes from Buttons.svg
    final fontSize = switch (size) {
      ButtonSize.small => 12.0,
      ButtonSize.medium => 14.0,
      ButtonSize.large => 16.0,
    };

    // Use the base typography style but customize for buttons
    return AppTypography.labelMedium.copyWith(
      color: _getTextColor(),
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      letterSpacing: 0.2, // Slight letter spacing for better readability
    );
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
      ),
    );
  }
}



