// lib/core/widgets/routex_phone_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';
import 'package:route_x/core/theme/app_spacing.dart';
import 'package:route_x/core/widgets/routex_text_field.dart';
import 'package:route_x/core/extensions/tr_extension.dart';
import 'package:country_flags/country_flags.dart';

// â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
// Country data source
// â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

/// Immutable country entry used by the country-picker BottomSheet.
class _Country {
  const _Country({
    required this.name,
    required this.countryCode,
    required this.code,
  });
  final String name;
  final String countryCode;
  final String code;
}

/// Canonical list of Arab countries â€” order matches the legacy project spec.
List<_Country> _getCountries(BuildContext context) => [
  _Country(name: context.tr.countryPalestine, countryCode: 'PS', code: '+970'),
  _Country(
    name: context.tr.countrySaudiArabia,
    countryCode: 'SA',
    code: '+966',
  ),
  _Country(name: context.tr.countryEgypt, countryCode: 'EG', code: '+20'),
  _Country(name: context.tr.countryUAE, countryCode: 'AE', code: '+971'),
  _Country(name: context.tr.countryJordan, countryCode: 'JO', code: '+962'),
  _Country(name: context.tr.countryQatar, countryCode: 'QA', code: '+974'),
  _Country(name: context.tr.countryKuwait, countryCode: 'KW', code: '+965'),
  _Country(name: context.tr.countryOman, countryCode: 'OM', code: '+968'),
  _Country(name: context.tr.countryBahrain, countryCode: 'BH', code: '+973'),
];

/// A phone-number input that wraps [RouteXTextField] and prepends a tappable
/// country-code prefix (flag Â· dial-code Â· â–¾ Â· divider).
///
/// Tapping the prefix opens a searchable [showModalBottomSheet] whose internal
/// state is managed by a [StatefulBuilder] â€” no parent `setState` is needed
/// while the user types a search query.
class RouteXPhoneField extends StatefulWidget {
  const RouteXPhoneField({
    super.key,
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.labelText = 'Phone Number',
    this.hintText = 'Enter your phone number',
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String labelText;
  final String hintText;

  @override
  State<RouteXPhoneField> createState() => _RouteXPhoneFieldState();
}

class _RouteXPhoneFieldState extends State<RouteXPhoneField> {
  _Country? _selected;

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

  // â”€â”€ BottomSheet â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

  void _showCountryPickerBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true, // respects height: 70 %
      backgroundColor: Colors.transparent, // sheet draws its own bg
      builder: (BuildContext sheetCtx) {
        // â”€â”€ StatefulBuilder: owns searchQuery + filtered list â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
        String searchQuery = '';
        List<_Country> filtered = List.of(_getCountries(context));

        return StatefulBuilder(
          builder: (BuildContext sbCtx, StateSetter setSheetState) {
            return Padding(
              // Push sheet up when keyboard appears
              padding: EdgeInsetsDirectional.only(
                bottom: MediaQuery.of(sbCtx).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(sbCtx).size.height * 0.7,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  children: [
                    // â”€â”€ 1. Drag handle â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppSpacing.spacing12,
                        bottom: AppSpacing.spacing8,
                      ),
                      child: Container(
                        width: AppSpacing.spacing40,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: AppColors.emptyBarGray,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ),

                    // â”€â”€ 2. Sheet title â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.spacing16,
                        vertical: AppSpacing.spacing8,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          context.tr.selectCountryCode,
                          style: TextStyle(
                            fontFamily: AppFonts.fontFamilySatoshi,
                            fontSize: AppFonts.font16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryBlack,
                          ),
                        ),
                      ),
                    ),

                    // â”€â”€ 3. Search TextField â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.spacing16,
                        vertical: AppSpacing.spacing8,
                      ),
                      child: TextField(
                        autofocus: false,
                        style: TextStyle(
                          fontFamily: AppFonts.fontFamilySatoshi,
                          fontSize: AppFonts.font14,
                          color: AppColors.primaryBlack,
                        ),
                        decoration: InputDecoration(
                          hintText: context.tr.searchCountry,
                          hintStyle: TextStyle(
                            fontFamily: AppFonts.fontFamilySatoshi,
                            fontSize: AppFonts.font14,
                            color: AppColors.secondaryTextGray,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: AppColors.secondaryTextGray,
                            size: AppFonts.font20,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.spacing16,
                            vertical: AppSpacing.spacing12,
                          ),
                          filled: true,
                          fillColor: AppColors.background,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: AppColors.textFieldStroke,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: AppColors.activatedStroke,
                              width: 1.5,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          // StatefulBuilder's setState â€” only rebuilds the sheet
                          setSheetState(() {
                            searchQuery = value.toLowerCase().trim();
                            filtered = searchQuery.isEmpty
                                ? List.of(_getCountries(context))
                                : _getCountries(context)
                                      .where(
                                        (c) =>
                                            c.name.toLowerCase().contains(
                                              searchQuery,
                                            ) ||
                                            c.code.contains(searchQuery),
                                      )
                                      .toList();
                          });
                        },
                      ),
                    ),

                    // â”€â”€ 4. Country list (Expanded prevents unbounded height) â”€
                    Expanded(
                      child: filtered.isEmpty
                          ? Center(
                              child: Text(
                                context.tr.noResultsFound,
                                style: TextStyle(
                                  fontFamily: AppFonts.fontFamilySatoshi,
                                  fontSize: AppFonts.font14,
                                  color: AppColors.secondaryTextGray,
                                ),
                              ),
                            )
                          : ListView.separated(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.spacing16,
                                vertical: AppSpacing.spacing8,
                              ),
                              itemCount: filtered.length,
                              separatorBuilder: (_, __) => Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.emptyBarGray,
                              ),
                              itemBuilder: (_, index) {
                                final country = filtered[index];
                                return InkWell(
                                  onTap: () {
                                    // Update parent prefix display
                                    setState(() => _selected = country);
                                    Navigator.of(sheetCtx).pop();
                                  },
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSpacing.spacing8,
                                      vertical: AppSpacing.spacing12,
                                    ),
                                    child: Row(
                                      children: [
                                        // Flag emoji â€” AppFonts.font24
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            2.r,
                                          ),
                                          child: SizedBox(
                                            width: 20.w,
                                            height: 14.h,
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child:
                                                  CountryFlag.fromCountryCode(
                                                    country.countryCode,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: AppSpacing.spacing12),

                                        // Country name â€” 14 sp, medium, primary
                                        Expanded(
                                          child: Text(
                                            country.name,
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFonts.fontFamilySatoshi,
                                              fontSize: AppFonts.font14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primaryBlack,
                                            ),
                                          ),
                                        ),

                                        // Dial code â€” 14 sp, regular, secondary
                                        Text(
                                          country.code,
                                          style: TextStyle(
                                            fontFamily:
                                                AppFonts.fontFamilySatoshi,
                                            fontSize: AppFonts.font14,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                AppColors.secondaryTextGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),

                    SizedBox(height: AppSpacing.spacing16),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // â”€â”€ Prefix build â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

  @override
  Widget build(BuildContext context) {
    final selectedCountry = _selected ?? _getCountries(context).first;
    // Determine prefix icon color strictly based on focus
    final Color activeColor = _focusNode.hasFocus
        ? AppColors.mainGreen
        : AppColors.secondaryTextGray;

    return RouteXTextField(
      controller: widget.controller,
      focusNode: _focusNode,
      tintPrefixIcon: false, // Prevents flag emoji from turning solid green
      validator: widget.validator,
      onChanged: widget.onChanged,
      labelText: widget.labelText,
      hintText: widget.hintText,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      prefixIcon: GestureDetector(
        onTap: _showCountryPickerBottomSheet,
        behavior: HitTestBehavior.opaque, // ensures full tap-area coverage
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: AppSpacing.spacing12,
            end: AppSpacing.spacing4,
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // â”€â”€ Flag emoji â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.r),
                  child: SizedBox(
                    width: 20.w,
                    height: 14.h,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: CountryFlag.fromCountryCode(
                        selectedCountry.countryCode,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: AppSpacing.spacing4),

                // â”€â”€ Dial code â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                Text(
                  selectedCountry.code,
                  style: TextStyle(
                    fontFamily: AppFonts.fontFamilySatoshi,
                    fontSize: AppFonts.font14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlack,
                  ),
                ),

                SizedBox(width: AppSpacing.spacing4),

                // â”€â”€ Dropdown arrow â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: AppFonts.font20,
                  color: activeColor,
                ),

                SizedBox(width: AppSpacing.spacing8),

                // â”€â”€ Vertical divider â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                VerticalDivider(
                  width: 1.w,
                  thickness: 1.w,
                  color: AppColors.emptyBarGray,
                  indent: AppSpacing.spacing4,
                  endIndent: AppSpacing.spacing4,
                ),

                SizedBox(width: AppSpacing.spacing8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
