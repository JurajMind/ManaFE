import 'package:app/app/app.dart';
import 'package:app/const/theme.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  //languagesList also moved to the Application class just like the languageCodesList
  static final List<String> languagesList = App.supportedLanguagesCodes;
  static final List<String> languageCodesList = App.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
    languagesList[2]: languageCodesList[2],
  };

  @override
  Widget build(BuildContext context) {
    var theme = MTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
            AppTranslations.of(context)!
                .text("settings.select_language")
                .toUpperCase(),
            style: theme.appBarStyle),
      ),
      body: _buildLanguagesList(),
    );
  }

  _buildLanguagesList() {
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (context, index) {
        return _buildLanguageItem(languagesList[index]);
      },
    );
  }

  _buildLanguageItem(String language) {
    return InkWell(
      onTap: () {
        print(language);
        App.onLocaleChanged(Locale(languagesMap[language]));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            AppTranslations.of(context)!.text("settings.$language"),
            style: TextStyle(
                fontSize: 24.0,
                color:
                    AppTranslations.of(context)!.locale.languageCode == language
                        ? AppColors.colors[1]
                        : Colors.white),
          ),
        ),
      ),
    );
  }
}
