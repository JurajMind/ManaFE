import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class MThemeData {
  //
  /// Colors: meta
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Color get primaryColor => Colors.black;

  Color get scaffoldColor => Colors.black;

  List<Color> get colors => [
        const Color.fromARGB(255, 31, 3, 255),
        const Color.fromARGB(255, 25, 247, 173),
        const Color.fromARGB(255, 244, 28, 244),
        const Color.fromARGB(255, 242, 160, 29),
      ];

  Color get appBarColor => this.black;

  Color get white => const Color(0xFFFFFFFF);

  Color get black => const Color(0xFF000000);

  Color get secondaryColor => const Color(0xFFFFFFFF);

  Color get tertiaryColor => const Color(0xFF868F98);

  Color get quaternaryColor => const Color(0xFF363A3E);

  Color get accentColor => this.colors[1];

  Color get dangerColor => const Color(0xFFD23031);

  Color get primaryBackgroundColor => const Color(0xFFF9F9FA);

  Color get hoverBackgroundColor => const Color(0xFFF2F4F5);

  Color get secondaryBackgroundColor => const Color(0xFFFFFFFF);

  Color get primaryTextColor => this.secondaryColor;

  Color get secondaryTextColor => this.quaternaryColor;

  Color get selectionColor => this.accentColor;

  Color get primaryIconColor => const Color(0xFF9FAAB4);

  Color get secondaryIconColor => const Color(0xFF4E5358);

  Color get tertiaryIconColor => quaternaryColor;

  Color get chessboardBlack => const Color(0xFFDCE0E4);

  Color get chessboardWhite => const Color(0xFFFFFFFF);

  //
  /// Colors: Input
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Color get inputBackgroundColor => secondaryColor;

  Color get inputAuxColor => tertiaryColor;

  Color get inputTextColor => quaternaryColor;

  Color get inputHintColor => quaternaryColor;

  Color get inputLabelColor => quaternaryColor;

  Color get enabledBorderColor => const Color(0xFFDCE0E4);

  Color get focusedBorderColor => accentColor;

  Color get inputInvertedBackgroundColor => const Color(0xFF232629);

  Color get leadingIconColor => const Color(0xFF232629);

  Color get hintTextColor => this.quaternaryColor;

  Color get inputInvertedLabelColor => const Color(0xFFDCE0E4);

  Color get inputDividerColor => const Color(0xFFF2F4F5);

  Color get prefixTextColor => const Color(0xFF697077);

  //
  /// Colors: Dialog
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Color get dialogBackgroundColor => primaryColor;

  Color get dialogCloseButtonColor => tertiaryColor;

  Color get dialogTitleColor => secondaryColor;

  //
  /// Colors: Button
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Color get buttonDangerColor => dangerColor;

  Color get buttonPrimaryColor => accentColor;

  Color get buttonSecondaryInvertedColor => this.quaternaryColor;

  Color get buttonSecondaryColor => const Color(0xFFF2F4F5);

  Color get buttonHoverBackgroundColor => const Color(0xFFDCE0E4);

  //
  /// Size: Button
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  EdgeInsets get buttonContentPadding => const EdgeInsets.fromLTRB(12, 6, 12, 6);

  //
  /// Colors: misc
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Color get toolbarTintColor => this.primaryTextColor;

  Color get dividerColor => const Color(0xFFDCE0E4);

  Color get invertedDividerColor => const Color(0xFF363A3E);

  Color get popoverBorderColor => this.quaternaryColor;

  Color get secondaryPopoverBorderColor => const Color(0xFFDCE0E4);

  //
  /// Colors: Popup menu
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Color get popupMenuTextColor => secondaryColor;

  Color get popupMenuBackgroundColor => primaryColor;

  Color get popupMenuSuffixColor => const Color(0xFF9FAAB4);

  Color get popupMenuDisabledColor => const Color(0xFF4E5358);

  Color get popupMenuDividerColor => quaternaryColor;

  Color get popupMenuHoverColor => accentColor;

  Color get popupCheckColor => tertiaryColor;

  //
  /// Borders
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Border get fillTokenPreviewBorder => const Border.fromBorderSide(BorderSide(
        width: 1,
        color: Color(0x1f000000),
      ));

  Border get selectedFillTokenPreviewBorder => const Border.fromBorderSide(BorderSide(
        width: 1,
        color: Color(0xFFFFFFFF),
      ));

  //
  /// Text Styles
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  double get headerTextSize => 14;

  double get subHeaderTextSize => 13;

  double get defaultTextSize => 11;

  double get increasedTextSize => 12;

  double get appBarTextsize => 24;

  double get labelTextSize => this.defaultTextSize;

  TextStyle get headerStyle => baseStyle(TextStyle(
        color: this.secondaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: this.headerTextSize,
      ));

  TextStyle get appBarStyle => baseStyle(TextStyle(
        color: this.white,
        fontWeight: FontWeight.w800,
        fontSize: this.appBarTextsize,
      ));

  TextStyle get titleStyle => baseStyle(TextStyle(
        color: this.secondaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: this.defaultTextSize,
        letterSpacing: 0.4,
      ));

  TextStyle get subtitleStyle => baseStyle(TextStyle(
        color: this.tertiaryColor,
        fontWeight: FontWeight.w400,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get primaryTextStyle => baseStyle(TextStyle(
        color: this.secondaryTextColor,
        fontWeight: FontWeight.w400,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get toolbarTitleStyle => baseStyle(TextStyle(
        color: this.toolbarTintColor,
        fontWeight: FontWeight.w600,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get toolbarSubtitleStyle => baseStyle(TextStyle(
        color: this.toolbarTintColor,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get inputTextStyle => baseStyle(TextStyle(
        color: this.inputTextColor,
        fontSize: this.increasedTextSize,
      ));

  TextStyle get inputHintTextStyle => baseStyle(TextStyle(
        color: this.hintTextColor,
        fontSize: this.increasedTextSize,
      ));

  TextStyle get inputInvertedTextStyle => baseStyle(TextStyle(
        color: this.secondaryColor,
        fontSize: this.increasedTextSize,
      ));

  TextStyle get inputErrorStyle => baseStyle(TextStyle(
        color: this.dangerColor,
        fontSize: this.increasedTextSize,
      ));

  TextStyle get inputSuffixStyle => baseStyle(TextStyle(
        color: this.inputAuxColor,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get inputInvertedSuffixStyle => baseStyle(TextStyle(
        color: this.inputAuxColor,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get inputLabelStyle => baseStyle(TextStyle(
        color: this.inputLabelColor,
        fontSize: this.labelTextSize,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w600,
      ));

  TextStyle get inputInvertedLabelStyle => baseStyle(TextStyle(
        color: this.inputInvertedLabelColor,
        fontSize: this.labelTextSize,
        letterSpacing: 0.4,
      ));

  TextStyle get pageTitleStyle => baseStyle(TextStyle(
        color: this.secondaryColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get buttonStyle => baseStyle(TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get tabBarItemStyle => baseStyle(TextStyle(
        color: this.tertiaryColor,
        fontSize: this.defaultTextSize,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ));

  TextStyle get dialogContentStyle => baseStyle(TextStyle(
        color: this.secondaryColor,
        fontSize: this.increasedTextSize,
        height: 1.5,
      ));

  TextStyle get popoverTitleStyle => baseStyle(TextStyle(
        color: this.secondaryColor,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get tabBarSelectedItemStyle => this.tabBarItemStyle.copyWith(
        color: this.primaryColor,
      );

  TextStyle get popupMenuItemStyle => baseStyle(TextStyle(
        color: this.popupMenuTextColor,
        fontWeight: FontWeight.w500,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get popupMenuDisabledStyle => baseStyle(TextStyle(
        color: this.popupMenuDisabledColor,
        fontWeight: FontWeight.w500,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get popupMenuSuffixStyle => baseStyle(TextStyle(
        color: this.popupMenuSuffixColor,
        fontWeight: FontWeight.w400,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get tokenItemStyle => baseStyle(TextStyle(
        color: this.tertiaryColor,
        fontWeight: FontWeight.w400,
        fontSize: this.defaultTextSize,
      ));

  TextStyle get textFieldSuffixStyle => baseStyle(TextStyle(
        color: this.inputAuxColor,
        fontSize: 11,
      ));

  TextStyle get textFieldLabelStyle => baseStyle(TextStyle(
        color: this.inputLabelColor,
        fontSize: 11,
        letterSpacing: 0.3,
      ));

  TextStyle get textFieldInvertedLabelStyle => baseStyle(TextStyle(
        color: this.inputInvertedLabelColor,
        fontSize: 11,
        letterSpacing: 0.3,
      ));

  TextStyle get dialogTitleTextStyle => baseStyle(TextStyle(
        color: this.dialogTitleColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        fontSize: 11,
      ));

  TextStyle get overlayTitleStyle => baseStyle(TextStyle(
        color: this.secondaryColor,
        fontSize: 11,
      ));

  //
  /// Constants
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  double get inputHeight => 28;

  double get inputBorderWidth => 1;

  double get popupItemHeight => 24;

  double get inputLabelVerticalPadding => 4;

  double get mediumPageWidth => 580;
  double get maxPageWidth => 800;

  double get pageMaxDecoratorWidth => 1312;

  Constraints get pageConstrains => BoxConstraints(maxWidth: this.maxPageWidth);
}

//
/// Base
// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

TextStyle baseStyle(TextStyle textStyle) {
  return GoogleFonts.montserrat(
    textStyle: textStyle,
  );
}

class SNThemeHelper {
  static InputBorder buildBorder(Color color, double width) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
        borderRadius: const BorderRadius.all(Radius.zero),
      );
}
