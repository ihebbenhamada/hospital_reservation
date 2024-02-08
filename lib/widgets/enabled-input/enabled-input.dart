import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/image_urls/image_urls.dart';

class EnabledInput extends StatelessWidget {
  const EnabledInput({
    Key? key,
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
  }) : super(key: key);

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
  final bool isDarkMode;
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 21.h,
          width: 21.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray1, width: 2),
            borderRadius: BorderRadius.circular(21.h),
          ),
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              AppImages.enabledInput,
              height: 68.h,
              color: isDarkMode ? AppColors.dark1 : AppColors.white,
            ),
            SizedBox(
              width: 250,
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
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? AppColors.gray1 : AppColors.black1,
                ),
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  isDense: true,
                  counterText: '',
                  hintText: hintText,
                  contentPadding: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                    left: 42,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray1,
                  ),
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
          ],
        )
      ],
    );
  }
}
