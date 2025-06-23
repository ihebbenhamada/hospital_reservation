import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/colors.dart';

class VerificationOTP extends StatefulWidget {
  const VerificationOTP({
    super.key,
    required this.onCompleted,
    required this.onEditing,
    this.isDarkMode = false,
  });

  final ValueChanged<String> onCompleted;
  final ValueChanged<bool> onEditing;
  final bool isDarkMode;

  @override
  State<VerificationOTP> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationOTP> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onFieldChanged(String value, int index) {
    if (value.length == 1 && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final code = _controllers.map((c) => c.text).join();
    final allFilled = _controllers.every((c) => c.text.isNotEmpty);

    if (allFilled) {
      widget.onCompleted(code);
      widget.onEditing(false);
    } else {
      widget.onEditing(true);
    }
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      height: 43.h,
      width: 38.h,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black1,
        ),
        cursorColor: AppColors.primary,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          counterText: "",
          fillColor: widget.isDarkMode ? AppColors.dark1 : AppColors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
        ),
        onChanged: (value) => _onFieldChanged(value, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4 * 2 - 1, (i) {
          if (i.isEven) {
            return _buildOtpField(i ~/ 2);
          } else {
            return Row(
              children: [
                11.horizontalSpace,
                Container(width: 3.5, height: 1.5.h, color: AppColors.gray1),
                11.horizontalSpace,
              ],
            );
          }
        }),
      ),
    );
  }
}
