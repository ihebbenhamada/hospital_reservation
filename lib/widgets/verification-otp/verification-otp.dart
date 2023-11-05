import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/colors.dart';

class VerificationOTP extends StatefulWidget {
  const VerificationOTP({
    Key? key,
    required this.onCompleted,
    required this.onEditing,
  }) : super(key: key);
  final ValueChanged<String> onCompleted;
  final ValueChanged<bool> onEditing;

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationOTP> {
  TextEditingController input1Controller = TextEditingController();
  TextEditingController input2Controller = TextEditingController();
  TextEditingController input3Controller = TextEditingController();
  TextEditingController input4Controller = TextEditingController();

  FocusNode input1FocusNode = FocusNode();
  FocusNode input2FocusNode = FocusNode();
  FocusNode input3FocusNode = FocusNode();
  FocusNode input4FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 43.h,
            width: 38.h,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLines: 1,
              maxLength: 1,
              controller: input1Controller,
              focusNode: input1FocusNode,
              showCursor: true,
              cursorColor: AppColors.primary,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autocorrect: false,
              textAlign: TextAlign.end,
              autofocus: false,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.gray1,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                fillColor: AppColors.white,
                filled: true,
                counterText: "",
                errorMaxLines: 1,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (input1Controller.value.text.isNotEmpty &&
                    input2Controller.value.text.isNotEmpty &&
                    input3Controller.value.text.isNotEmpty &&
                    input4Controller.value.text.isNotEmpty) {
                  widget.onCompleted(input1Controller.value.text +
                      input2Controller.value.text +
                      input3Controller.value.text +
                      input4Controller.value.text);
                  widget.onEditing(false);
                } else {
                  widget.onEditing(true);
                }
              },
            ),
          ),
          11.horizontalSpace,
          Container(
            width: 3.5,
            height: 1.5.h,
            color: AppColors.gray1,
          ),
          11.horizontalSpace,
          SizedBox(
            height: 43.h,
            width: 38.h,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLines: 1,
              maxLength: 1,
              controller: input2Controller,
              focusNode: input2FocusNode,
              showCursor: true,
              cursorColor: AppColors.primary,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autocorrect: false,
              textAlign: TextAlign.end,
              autofocus: false,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.gray1,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                fillColor: AppColors.white,
                filled: true,
                counterText: "",
                errorMaxLines: 1,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
                if (input1Controller.value.text.isNotEmpty &&
                    input2Controller.value.text.isNotEmpty &&
                    input3Controller.value.text.isNotEmpty &&
                    input4Controller.value.text.isNotEmpty) {
                  widget.onCompleted(input1Controller.value.text +
                      input2Controller.value.text +
                      input3Controller.value.text +
                      input4Controller.value.text);
                  widget.onEditing(false);
                } else {
                  widget.onEditing(true);
                }
              },
            ),
          ),
          11.horizontalSpace,
          Container(
            width: 3.5,
            height: 1.5.h,
            color: AppColors.gray1,
          ),
          11.horizontalSpace,
          SizedBox(
            height: 43.h,
            width: 38.h,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLines: 1,
              maxLength: 1,
              controller: input3Controller,
              focusNode: input3FocusNode,
              showCursor: true,
              cursorColor: AppColors.primary,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autocorrect: false,
              textAlign: TextAlign.end,
              autofocus: false,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.gray1,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                fillColor: AppColors.white,
                filled: true,
                counterText: "",
                errorMaxLines: 1,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
                if (input1Controller.value.text.isNotEmpty &&
                    input2Controller.value.text.isNotEmpty &&
                    input3Controller.value.text.isNotEmpty &&
                    input4Controller.value.text.isNotEmpty) {
                  widget.onCompleted(input1Controller.value.text +
                      input2Controller.value.text +
                      input3Controller.value.text +
                      input4Controller.value.text);
                  widget.onEditing(false);
                } else {
                  widget.onEditing(true);
                }
              },
            ),
          ),
          11.horizontalSpace,
          Container(
            width: 3.5,
            height: 1.5.h,
            color: AppColors.gray1,
          ),
          11.horizontalSpace,
          SizedBox(
            height: 43.h,
            width: 38.h,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLines: 1,
              maxLength: 1,
              controller: input4Controller,
              focusNode: input4FocusNode,
              showCursor: true,
              cursorColor: AppColors.primary,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autocorrect: false,
              textAlign: TextAlign.end,
              autofocus: false,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.gray1,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                fillColor: AppColors.white,
                filled: true,
                counterText: "",
                errorMaxLines: 1,
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
                if (input1Controller.value.text.isNotEmpty &&
                    input2Controller.value.text.isNotEmpty &&
                    input3Controller.value.text.isNotEmpty &&
                    input4Controller.value.text.isNotEmpty) {
                  widget.onCompleted(input1Controller.value.text +
                      input2Controller.value.text +
                      input3Controller.value.text +
                      input4Controller.value.text);
                  widget.onEditing(false);
                } else {
                  widget.onEditing(true);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
