import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';

/// A reusable, labeled text field that follows the RouteX design system.
///
/// Reacts to focus state by highlighting borders and icons dynamically.
class RouteXTextField extends StatefulWidget {
  const RouteXTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.maxLines = 1,
    this.contentPadding,
    this.enabled = true,
    this.tintPrefixIcon = true,
    this.tintSuffixIcon = true,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool readOnly;
  final int maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final bool tintPrefixIcon;
  final bool tintSuffixIcon;

  @override
  State<RouteXTextField> createState() => _RouteXTextFieldState();
}

class _RouteXTextFieldState extends State<RouteXTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = _focusNode.hasFocus
        ? AppColors.mainGreen
        : AppColors.secondaryTextGray;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: TextStyle(
              fontFamily: AppFonts.fontFamilySatoshi,
              fontSize: AppFonts.font14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          enabled: widget.enabled,
          style: TextStyle(
            fontFamily: AppFonts.fontFamilySatoshi,
            fontSize: AppFonts.font14,
            fontWeight: FontWeight.w400,
            color: AppColors.brandTextColor,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontFamily: AppFonts.fontFamilySatoshi,
              fontSize: AppFonts.font14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextGray,
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),

            // The ColorFiltered override hack guarantees tint even within padded constraints
            prefixIcon: widget.prefixIcon != null
                ? (widget.tintPrefixIcon
                      ? ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            activeColor,
                            BlendMode.srcIn,
                          ),
                          child: widget.prefixIcon,
                        )
                      : widget.prefixIcon)
                : null,
            prefixIconConstraints: widget.prefixIcon != null
                ? BoxConstraints(minWidth: 48.w, minHeight: 20.h)
                : null,

            suffixIcon: widget.suffixIcon != null
                ? (widget.tintSuffixIcon
                      ? ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            activeColor,
                            BlendMode.srcIn,
                          ),
                          child: widget.suffixIcon,
                        )
                      : widget.suffixIcon)
                : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.textFieldStroke,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.mainGreen,
                width: 1.5.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: const Color(0xFFB00020),
                width: 1.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: const Color(0xFFB00020),
                width: 1.5.w,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.emptyBarGray,
                width: 1.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
