import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/config/theme/theme_controller.dart';

import '../../config/colors/colors.dart';

class ReservationInput extends StatelessWidget {
  ReservationInput({
    super.key,
    this.autofocus = false,
    this.obscureText = false,
    required this.controller,
    this.hintText = '',
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.maxLines = 1,
    this.focusNode,
    this.nextFocusNode,
    this.keyboardType = TextInputType.multiline,
    this.validator,
    this.fillColor = Colors.white,
    this.filled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.title,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.maxLength,
    this.autovalidateMode,
    this.initialValue,
    this.textCapitalization = TextCapitalization.none,
    this.enabled,
    this.paddingRight = 0,
    required this.height,
    required this.width,
    this.error,
    this.errorText,
    this.isDarkMode = false,
  });

  final double height;
  final double width;
  final bool autofocus;
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool? enabled;
  final bool? error;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final int maxLines;
  final double paddingRight;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Color fillColor;
  final bool filled;
  final int? maxLength;
  final bool? maxLengthEnforced = true;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? title;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool isDarkMode;

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: isDarkMode ? AppColors.dark1 : AppColors.gray2,
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? const Color.fromRGBO(0, 0, 0, 0.16)
                : const Color.fromRGBO(152, 152, 152, 0.16),
            offset: const Offset(0.0, 3),
            blurRadius: 5.0.h,
            spreadRadius: 0.h,
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          key: key,
          autofocus: autofocus,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          onSaved: onSaved,
          initialValue: initialValue,
          maxLength: maxLength,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: themeController.isDarkMode.value
                ? AppColors.white
                : AppColors.black1,
          ),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            isDense: true,
            counterText: '',
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.gray1,
            ),
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(),
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(),
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
          autocorrect: false,
          enableSuggestions: false,
          enabled: enabled,
          textInputAction: textInputAction,
          autovalidateMode: autovalidateMode,
          validator: validator,
          enableInteractiveSelection: true,
          focusNode: focusNode,
          textCapitalization: textCapitalization,
        ),
      ),
    );
  }
}
