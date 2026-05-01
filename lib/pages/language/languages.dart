import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../functions/functions.dart';
import '../../styles/styles.dart';
import '../../translations/translation.dart';
import '../../widgets/widgets.dart';
import '../login/login.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  static const Color _brandGreen = Color(0xff22C55E);
  static const Color _surfaceBlack = Color(0xff0a0a0a);
  static const Color _cardDark = Color(0xff141414);

  @override
  void initState() {
    choosenLanguage = 'en';
    languageDirection = 'ltr';
    super.initState();
  }

  navigate() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  String _langTitle(String code) {
    return languagesCode.firstWhere((e) => e['code'] == code)['name'].toString();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final padTop = MediaQuery.of(context).padding.top;

    return Material(
      child: Directionality(
        textDirection:
            (languageDirection == 'rtl') ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          color: Colors.black,
          height: media.height,
          width: media.width,
          child: Column(
            children: [
              Container(
                width: media.width,
                padding: EdgeInsets.fromLTRB(
                    media.width * 0.05, padTop + 12, media.width * 0.05, 20),
                decoration: BoxDecoration(
                  color: _surfaceBlack,
                  border: Border(
                    bottom: BorderSide(
                      color: _brandGreen.withOpacity(0.45),
                      width: 1.5,
                    ),
                  ),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: _brandGreen.withOpacity(0.12),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: media.width * 0.22,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      languages['en']['text_choose_language'].toString(),
                      style: GoogleFonts.notoSans(
                        fontSize: media.width * eighteen,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: media.width * 0.06,
                      vertical: media.width * 0.05),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _cardDark,
                      borderRadius: BorderRadius.circular(media.width * 0.03),
                      border: Border.all(color: borderLines.withOpacity(0.8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                          vertical: media.width * 0.02,
                          horizontal: media.width * 0.03),
                      itemCount: flygorideLanguageCodes.length,
                      itemBuilder: (context, index) {
                        final code = flygorideLanguageCodes[index];
                        final selected = choosenLanguage == code;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              choosenLanguage = code;
                              languageDirection =
                                  (code == 'ur' || code == 'ps') ? 'rtl' : 'ltr';
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: media.width * 0.03,
                                horizontal: media.width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    _langTitle(code),
                                    style: GoogleFonts.notoSans(
                                      fontSize: media.width * sixteen,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.92),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: media.width * 0.055,
                                  width: media.width * 0.055,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: selected ? _brandGreen : greyText,
                                        width: 1.4),
                                  ),
                                  alignment: Alignment.center,
                                  child: selected
                                      ? Container(
                                          height: media.width * 0.035,
                                          width: media.width * 0.035,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _brandGreen,
                                          ),
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              if (choosenLanguage != '')
                Padding(
                  padding: EdgeInsets.only(
                      left: media.width * 0.05,
                      right: media.width * 0.05,
                      bottom: media.width * 0.06),
                  child: Button(
                    onTap: () async {
                      await getlangid();
                      pref.setString('languageDirection', languageDirection);
                      pref.setString('choosenLanguage', choosenLanguage);
                      navigate();
                    },
                    text: languages[choosenLanguage]['text_confirm'],
                    color: theme,
                    borcolor: theme,
                    textcolor: buttonText,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
