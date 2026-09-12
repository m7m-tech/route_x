import 'dart:ui';

/// Design token colors exported from Figma.
///
/// Organized into Primitives, Aliases, and Icon sections.
/// Every hex value is converted to a Flutter [Color] object.
/// RGBA strings are converted via [Color.fromRGBO].
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Primitives – Gray
  // ---------------------------------------------------------------------------
  static const Color gray50 = Color(0xFFF8FAFC);
  static const Color gray100 = Color(0xFFF1F5F9);
  static const Color gray200 = Color(0xFFE2E8F0);
  static const Color gray300 = Color(0xFFCBD5E1);
  static const Color gray400 = Color(0xFF94A3B8);
  static const Color gray500 = Color(0xFF64748B);
  static const Color gray600 = Color(0xFF485B77);
  static const Color gray700 = Color(0xFF2B3A4E);
  static const Color gray800 = Color(0xFF1E293B);
  static const Color gray900 = Color(0xFF0B131B);
  static const Color grayWhite = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------------
  // Primitives – Blue
  // ---------------------------------------------------------------------------
  static const Color blue50 = Color(0xFFF0F8FE);
  static const Color blue100 = Color(0xFFBEE1F6);
  static const Color blue200 = Color(0xFFA1D4F1);
  static const Color blue300 = Color(0xFF84C7ED);
  static const Color blue400 = Color(0xFF67B9E9);
  static const Color blue500 = Color(0xFF4AACE5);
  static const Color blue600 = Color(0xFF3E90C0);
  static const Color blue700 = Color(0xFF1E3142);
  static const Color blue800 = Color(0xFF15222E);
  static const Color blue900 = Color(0xFF0B131B);
  static const Color blue6002 = Color(0xFF567590);
  static const Color blue7002 = Color(0xFF22384C);

  // ---------------------------------------------------------------------------
  // Primitives – Blue Secondary
  // ---------------------------------------------------------------------------
  static const Color blueSecondary50 = Color(0xFFECFCFF);
  static const Color blueSecondary100 = Color(0xFFB5E6EE);
  static const Color blueSecondary200 = Color(0xFF7AC9D7);
  static const Color blueSecondary300 = Color(0xFF52B8CB);
  static const Color blueSecondary400 = Color(0xFF29A8BE);
  static const Color blueSecondary500 = Color(0xFF0097B2);
  static const Color blueSecondary600 = Color(0xFF007F96);
  static const Color blueSecondary700 = Color(0xFF006779);
  static const Color blueSecondary800 = Color(0xFF004F5D);
  static const Color blueSecondary900 = Color(0xFF003640);

  // ---------------------------------------------------------------------------
  // Primitives – Amber
  // ---------------------------------------------------------------------------
  static const Color amber50 = Color(0xFFFFFBEB);
  static const Color amber200 = Color(0xFFFDE68A);
  static const Color amber300 = Color(0xFFFBBF24);
  static const Color amber400 = Color(0xFFF59E0B);
  static const Color amber700 = Color(0xFFB45309);

  // ---------------------------------------------------------------------------
  // Primitives – Rose
  // ---------------------------------------------------------------------------
  static const Color rose50 = Color(0xFFFFF1F2);
  static const Color rose200 = Color(0xFFFECDD3);
  static const Color rose300 = Color(0xFFFE7E7E);
  static const Color rose400 = Color(0xFFE57373);
  static const Color rose700 = Color(0xFFBE123C);

  // ---------------------------------------------------------------------------
  // Primitives – Indigo
  // ---------------------------------------------------------------------------
  static const Color indigo300 = Color(0xFFA5B4FC);
  static const Color indigo400 = Color(0xFF818CF8);

  // ---------------------------------------------------------------------------
  // Primitives – Sky
  // ---------------------------------------------------------------------------
  static const Color sky50 = Color(0xFFEBF7FF);
  static const Color sky300 = Color(0xFF67C8F6);
  static const Color sky600 = Color(0xFF0284C7);

  // ---------------------------------------------------------------------------
  // Primitives – Mint
  // ---------------------------------------------------------------------------
  static const Color mint50 = Color(0xFFF2FBF6);
  static const Color mint100 = Color(0xFFECFDF3);
  static const Color mint200 = Color(0xFFA1E3B8);
  static const Color mint300 = Color(0xFF68BA88);
  static const Color mint400 = Color(0xFF34D399);
  static const Color mint600 = Color(0xFF0E9F6E);
  static const Color mint700 = Color(0xFF1E7B4D);

  // ---------------------------------------------------------------------------
  // Primitives – Green
  // ---------------------------------------------------------------------------
  static const Color green50 = Color(0xFFEBF7FF);
  static const Color green100 = Color(0xFFA9DCA9);
  static const Color green200 = Color(0xFF83CD83);
  static const Color green300 = Color(0xFF5CBD5D);
  static const Color green400 = Color(0xFF36AE37);
  static const Color green500 = Color(0xFF109E11);

  // ---------------------------------------------------------------------------
  // Primitives – Red
  // ---------------------------------------------------------------------------
  static const Color red50 = Color(0xFFEACFC4);
  static const Color red200 = Color(0xFFCC8B70);
  static const Color red400 = Color(0xFFB4552D);

  // ---------------------------------------------------------------------------
  // Primitives – Info
  // ---------------------------------------------------------------------------
  static const Color info50 = Color(0xFFF1F8FF);
  static const Color info100 = Color(0xFFCAE3FF);
  static const Color info200 = Color(0xFF93C7FF);
  static const Color info300 = Color(0xFF71B4FC);
  static const Color info400 = Color(0xFF4FA2FB);
  static const Color info500 = Color(0xFF2E90FA);
  static const Color info600 = Color(0xFF2779D2);
  static const Color info700 = Color(0xFF1F62AA);
  static const Color info800 = Color(0xFF184B82);
  static const Color info900 = Color(0xFF11345A);

  // ---------------------------------------------------------------------------
  // Aliases – Surface Colors
  // ---------------------------------------------------------------------------
  static const Color onboardingGrayColorIc = Color(0xFFEBEAEB);
  static const Color headerBrand = Color(0xFFB6F000);
  static const Color linesGray = Color(0xFFA39E9E);
  static const Color emptyBarGray = Color(0xFFD9D9D9);

  // ---------------------------------------------------------------------------
  // Aliases – Text Colors
  // ---------------------------------------------------------------------------
  static const Color brandTextColor = Color(0xFF8FE600);
  static const Color primaryBlack = Color(0xFF111111);
  static const Color secondaryTextGray2 = Color(0xFFA39E9E);
  static const Color secondaryAppTextColor = Color(0xFF9BEF00);
  static const Color secondaryTextGray = Color(0xFFA39E9E);
  static const Color errorStateText = Color(0xFFFF3D00);

  // ---------------------------------------------------------------------------
  // Aliases – Border Colors
  // ---------------------------------------------------------------------------
  static const Color textFieldStroke = Color(0xFFD0D0D0);
  static const Color activatedStroke = Color(0xFF8FE600);

  // ---------------------------------------------------------------------------
  // Aliases – Brand Colors
  // ---------------------------------------------------------------------------
  static const Color brandBlack = Color(0xFF222222);
  static const Color deepBlack = Color(0xFF000000);
  static const Color secondaryGreen = Color(0xFF9BEF00);
  static const Color background = Color(0xFFFDFDFD);
  static const Color mainGreen = Color(0xFF8FE600);
  static const Color white = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------------
  // Aliases – Status Colors
  // ---------------------------------------------------------------------------
  /// Resolves to mint-400 (#34d399)
  static const Color statusGoodToGo = Color(0xFF34D399);

  /// Resolves to amber-400 (#f59e0b)
  static const Color statusIssues = Color(0xFFF59E0B);

  // ---------------------------------------------------------------------------
  // Aliases – Surface 2
  // ---------------------------------------------------------------------------
  static const Color headerBrand2 = Color(0xFF9BE600);

  // ---------------------------------------------------------------------------
  // Aliases – Icon Colors
  // ---------------------------------------------------------------------------
  static const Color activatedIcon = Color(0xFF8FE600);
  static const Color saudiFlag = Color(0xFF006C35);

  /// rgba(34, 34, 34, 0.8) → 80 % opacity black-ish
  static const Color profilePic = Color(0xCC222222);

  static const Color iconsBackgroundFill = Color(0xFFF0FBD7);
  static const Color warningBg = Color(0xFFFDE8E8);

  // ---------------------------------------------------------------------------
  // Icons – Google Brand Colors
  // ---------------------------------------------------------------------------
  static const Color googleBlue = Color(0xFF1976D2);
  static const Color googleGreen = Color(0xFF4CAF50);
  static const Color googleRed = Color(0xFFFF3D00);
  static const Color googleYellow = Color(0xFFFFC107);

  // ---------------------------------------------------------------------------
  // Backward-Compatibility & Legacy Color Aliases
  // ---------------------------------------------------------------------------
  /// Legacy primary brand color -> [mainGreen]
  static const Color primary = mainGreen;

  /// Legacy black text/neutral color -> [primaryBlack]
  static const Color black = primaryBlack;

  /// Legacy secondary text color -> [secondaryTextGray]
  static const Color textSecondary = secondaryTextGray;

  /// Legacy inactive indicator color -> [emptyBarGray]
  static const Color indicatorInactive = emptyBarGray;

  /// Feature widget aliases
  static const Color brandMainGreen = mainGreen;
  static const Color brandWhite = white;
  static const Color borderTextFieldStroke = textFieldStroke;
  static const Color brandDeepBlack = deepBlack;
  static const Color textPrimaryBlack = primaryBlack;
  static const Color brandBrandBlack = brandBlack;
  static const Color surfaceIconBackgroundGreen = iconsBackgroundFill;
  static const Color textSecondaryTextGray = secondaryTextGray;
}
