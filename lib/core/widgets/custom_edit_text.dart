// // lib/core/widgets/custom_edit_text.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:route_x/core/theme/app_colors.dart';
// import 'package:route_x/core/theme/app_fonts.dart';

// /// A reusable styled text-form-field with prefix/suffix icon support,
// /// password visibility toggle, focus-aware border/icon coloring, and
// /// built-in validation.
// class CustomEditText extends StatefulWidget {
//   const CustomEditText({
//     super.key,
//     this.controller,
//     this.focusNode,
//     this.placeholder,
//     this.hintText,
//     this.isPassword = false,
//     this.obscureText = false,
//     this.textInputAction,
//     this.keyboardType,
//     this.maxLines = 1,
//     this.backgroundColor,
//     this.borderColor,
//     this.borderRadius,
//     this.contentPadding,
//     this.startImagePath,
//     this.startImageWidth,
//     this.startImageHeight,
//     this.endImagePath,
//     this.endImageWidth,
//     this.endImageHeight,
//     this.onEndIconTap,
//     this.suffixIconWidget,
//     this.readOnly = false,
//     this.validator,
//     this.onChanged,
//     this.onTap,
//     this.margin,
//   });

//   final TextEditingController? controller;
//   final FocusNode? focusNode;

//   /// Displayed as hint text (takes priority over [hintText]).
//   final String? placeholder;

//   /// Fallback hint text if [placeholder] is null.
//   final String? hintText;

//   /// When true the field renders as a password field with a visibility toggle.
//   final bool isPassword;

//   /// Initial obscure state used only when [isPassword] is false.
//   final bool obscureText;

//   final TextInputAction? textInputAction;
//   final TextInputType? keyboardType;
//   final int? maxLines;

//   /// Field background fill color. Defaults to white.
//   final Color? backgroundColor;

//   /// Border color when unfocused. Defaults to [_kBorderColor].
//   final Color? borderColor;

//   /// Corner radius for the border. Defaults to 12.
//   final double? borderRadius;

//   /// Inner content padding. Defaults to 16 h / 12 v.
//   final EdgeInsetsGeometry? contentPadding;

//   // â”€â”€ Prefix icon â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//   final String? startImagePath;
//   final double? startImageWidth;
//   final double? startImageHeight;

//   // â”€â”€ Suffix icon â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//   final String? endImagePath;
//   final double? endImageWidth;
//   final double? endImageHeight;
//   final VoidCallback? onEndIconTap;

//   /// Overrides the entire suffix area with a custom widget.
//   final Widget? suffixIconWidget;

//   final bool readOnly;
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String>? onChanged;
//   final VoidCallback? onTap;

//   /// Optional outer margin around the field.
//   final EdgeInsetsGeometry? margin;

//   @override
//   State<CustomEditText> createState() => _CustomEditTextState();
// }

// class _CustomEditTextState extends State<CustomEditText> {
//   // â”€â”€ colours â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//   static const Color _kActiveColor = AppColors.green400;
//   static const Color _kErrorColor = Color(0xFFB00020);
//   static final Color _kInactiveIcon = Colors.grey.shade400;
//   static const Color _kDefaultBorder = Color(0xFFD0D0D0);

//   // â”€â”€ state â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//   late bool _obscureText;
//   FocusNode? _internalFocusNode;
//   bool _isFocused = false;

//   FocusNode get _effectiveFocusNode => widget.focusNode ?? _internalFocusNode!;

//   // â”€â”€ lifecycle â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.isPassword ? true : widget.obscureText;
//     if (widget.focusNode == null) {
//       _internalFocusNode = FocusNode();
//     }
//     _effectiveFocusNode.addListener(_handleFocusChange);
//   }

//   void _handleFocusChange() {
//     if (mounted) {
//       setState(() => _isFocused = _effectiveFocusNode.hasFocus);
//     }
//   }

//   @override
//   void dispose() {
//     _effectiveFocusNode.removeListener(_handleFocusChange);
//     _internalFocusNode?.dispose();
//     super.dispose();
//   }

//   void _togglePasswordVisibility() =>
//       setState(() => _obscureText = !_obscureText);

//   // â”€â”€ helpers â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//   TextStyle get _baseTextStyle => TextStyle(
//     fontFamily: AppFonts.fontFamilySatoshi,
//     fontSize: AppFonts.font14,
//     fontWeight: FontWeight.w400,
//     color: const Color(0xFF111111),
//   );

//   Color get _iconColor => _isFocused ? _kActiveColor : _kInactiveIcon;

//   OutlineInputBorder _border(Color color, {double width = 1.0}) =>
//       OutlineInputBorder(
//         borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
//         borderSide: BorderSide(color: color, width: width),
//       );

//   // â”€â”€ build â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//   @override
//   Widget build(BuildContext context) {
//     final Color bgColor = widget.backgroundColor ?? Colors.white;
//     final Color borderColor = widget.borderColor ?? _kDefaultBorder;
//     final String hint = widget.placeholder ?? widget.hintText ?? '';

//     return Container(
//       margin: widget.margin,
//       child: TextFormField(
//         controller: widget.controller,
//         focusNode: _effectiveFocusNode,
//         obscureText: _obscureText,
//         textInputAction: widget.textInputAction,
//         keyboardType: widget.keyboardType,
//         maxLines: widget.isPassword ? 1 : widget.maxLines,
//         readOnly: widget.readOnly,
//         validator: widget.validator,
//         onChanged: widget.onChanged,
//         onTap: widget.onTap,
//         style: _baseTextStyle,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: _baseTextStyle.copyWith(color: Colors.grey.shade500),
//           filled: true,
//           fillColor: bgColor,
//           contentPadding:
//               widget.contentPadding ??
//               EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 12.h),

//           // â”€â”€ prefix icon â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//           prefixIcon: widget.startImagePath != null
//               ? Padding(
//                   padding: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
//                   child: Image.asset(
//                     widget.startImagePath!,
//                     width: widget.startImageWidth ?? 20.w,
//                     height: widget.startImageHeight ?? 20.w,
//                     fit: BoxFit.contain,
//                     color: _iconColor,
//                   ),
//                 )
//               : null,
//           prefixIconConstraints: widget.startImagePath != null
//               ? BoxConstraints(
//                   minWidth: (widget.startImageWidth ?? 20.w) + 20.w,
//                 )
//               : null,

//           // â”€â”€ suffix icon â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//           suffixIcon: widget.isPassword
//               ? IconButton(
//                   icon: Icon(
//                     _obscureText
//                         ? Icons.visibility_off_outlined
//                         : Icons.visibility_outlined,
//                     color: _iconColor,
//                     size: 20.sp,
//                   ),
//                   onPressed: _togglePasswordVisibility,
//                 )
//               : widget.suffixIconWidget ??
//                     (widget.endImagePath != null
//                         ? GestureDetector(
//                             onTap: widget.onEndIconTap,
//                             child: Padding(
//                               padding: EdgeInsetsDirectional.only(
//                                 end: 12.w,
//                                 start: 8.w,
//                               ),
//                               child: Image.asset(
//                                 widget.endImagePath!,
//                                 width: widget.endImageWidth ?? 20.w,
//                                 height: widget.endImageHeight ?? 20.w,
//                                 fit: BoxFit.contain,
//                                 color: _iconColor,
//                               ),
//                             ),
//                           )
//                         : null),
//           suffixIconConstraints:
//               widget.endImagePath != null ||
//                   widget.suffixIconWidget != null ||
//                   widget.isPassword
//               ? BoxConstraints(minWidth: (widget.endImageWidth ?? 20.w) + 20.w)
//               : null,

//           // â”€â”€ borders â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//           enabledBorder: _border(borderColor),
//           focusedBorder: _border(_kActiveColor, width: 1.5),
//           errorBorder: _border(_kErrorColor),
//           focusedErrorBorder: _border(_kErrorColor, width: 1.5),
//         ),
//       ),
//     );
//   }
// }
