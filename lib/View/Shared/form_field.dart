import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFormField extends StatelessWidget {
  const AppFormField(
      {super.key,
      required this.hint,
      this.keyboardType,
      required this.prefixIcon,
      required this.textController,
      required this.validator,
      required this.text,
      this.onChanged,
      this.enableBorder,
      this.onSearch});
  final String text;
  final String hint;
  final TextInputType? keyboardType;
  final Widget prefixIcon;
  final TextEditingController textController;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSearch;

  final bool? enableBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary2,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10, spreadRadius: -1, color: Colors.black26)
                ]),
            child: TextFormField(
              cursorColor: AppColors.primary2,
              controller: textController,
              onFieldSubmitted: onSearch,
              validator: validator,
              onChanged: onChanged,
              keyboardType: keyboardType ?? keyboardType,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                fillColor: Colors.white,
                filled: true,
                hintText: hint,
                hintStyle: TextStyle(fontSize: 14.sp),
                // labelText: hint,
                // labelStyle: const TextStyle(color: Colors.black45),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                // enabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: const BorderSide(width: 1.5, color: Colors.black)),
                // focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: enableBorder == false
                //         ? const BorderSide(
                //             color: AppColors.primary2, width: 1.5)
                //         : const BorderSide(
                //             color: AppColors.primary2, width: 1.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
