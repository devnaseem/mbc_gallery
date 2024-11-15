import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_core/mbc_core.dart';
import 'mbc_gallery.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GalleryRootApp(),
    );
  }
}

class GalleryRootApp extends ConsumerStatefulWidget {
  @override
  _GalleryRootAppState createState() => _GalleryRootAppState();
}

class _GalleryRootAppState extends ConsumerState<GalleryRootApp> {
  late final GoRouter _router;

  final accessToken ='eyJraWQiOiJuSmNFMDFrVkFjMG1RMzBDSTVJMnRPUUorTmExbVRqc3FmWE1WSW9QdU9rPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIxOTRiMmQzYS04ZDdlLTQzMzgtOTEwMS0zYjY0MmVjNDZkMTMiLCJldmVudF9pZCI6ImVkMGIxMjBjLTcxOTctNGUxMC1iYmI2LTVlZGQwYjFjMGZjMyIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MzEzNTM2MDEsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5jYS1jZW50cmFsLTEuYW1hem9uYXdzLmNvbVwvY2EtY2VudHJhbC0xX2Z5dm9Bb25LTiIsImV4cCI6MTczMTQ0MDA0NSwiaWF0IjoxNzMxMzUzNjQ1LCJqdGkiOiI3NDRjYTYxOC03NjEzLTQ3MGItODY4ZC1hNzlhZmM3NWE3YTUiLCJjbGllbnRfaWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsInVzZXJuYW1lIjoiMTk0YjJkM2EtOGQ3ZS00MzM4LTkxMDEtM2I2NDJlYzQ2ZDEzIn0.drQfU75WYOAMGNacJTnNivXFxKPAJ5VJEDkqRdyo86A_fB2tFpgBO9sGhW8LObrzc-wqxRnN0XGXNBY1eMUVp-vAc45Yus5TBBs4IinkSC0IXp9lJO8GGaslWRtat_1m2jPhzkptoueXce0hlEj52ZOJ-L8SqxK7m7wMIzuKlDxcWPY0cbgkCENkAFpnSqJqqEIQFHtX1HCCeNsSs9tAB-PLEuFeH9c8el4YaBMS2kBtip-MlrCJr1o0_5vOeUvBjilmJA1v7XHJqEKej8PD0GfM2sfu-XHxUKZARKFmHSdlw4EFlopo2Yl-Lk1xeeYDNnb_zolDq8iefcO3ONW1TA';
  final identityToken ="eyJraWQiOiJIOUIxcUw2aDFwbjJnQjVoNWF3amV1a0ZOOURZMHdHYXhZaVB5Uk80bGg0PSIsImFsZyI6IlJTMjU2In0.eyJpY2FuX2VuYWJsZWQiOiJmYWxzZSIsInN1YiI6IjE5NGIyZDNhLThkN2UtNDMzOC05MTAxLTNiNjQyZWM0NmQxMyIsInVzZXJfY2xhaW1zIjoiW3tcInN5c3RlbVwiOlwiYWxheWFjYXJlXCIsXCJhdXRob3JpemVkSWRzXCI6W1wiNDYxNlwiLFwiNDY5NlwiXX1dIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImNpdHVzIjoie30iLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAuY2EtY2VudHJhbC0xLmFtYXpvbmF3cy5jb21cL2NhLWNlbnRyYWwtMV9meXZvQW9uS04iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOnRydWUsImNvZ25pdG86dXNlcm5hbWUiOiIxOTRiMmQzYS04ZDdlLTQzMzgtOTEwMS0zYjY0MmVjNDZkMTMiLCJ1c2VyX2NsYWltc192MiI6Ilt7XCJwc0lkXCI6XCI4OTcxNjYwMDA0XCIsXCJzeXN0ZW1UeXBlXCI6XCJob21lQ2FyZVwiLFwiYXV0aG9yaXplZFN5c3RlbXNcIjpbe1wiaWRcIjpcIjQ2MTZcIixcIm5hbWVcIjpcImFsYXlhY2FyZVwiLFwidXNlclR5cGVcIjpcImNsaWVudFwiLFwidGVuYW50c1wiOltcIkRlZmF1bHRcIl19XX0se1wicHNJZFwiOlwiODk3MTY2MDAxNFwiLFwic3lzdGVtVHlwZVwiOlwiaG9tZUNhcmVcIixcImF1dGhvcml6ZWRTeXN0ZW1zXCI6W3tcImlkXCI6XCI0Njk2XCIsXCJuYW1lXCI6XCJhbGF5YWNhcmVcIixcInVzZXJUeXBlXCI6XCJjbGllbnRcIixcInRlbmFudHNcIjpbXCJEZWZhdWx0XCJdfV19XSIsImN1c3RvbTphY2NlcHRlZF9kaWdpX3Rlcm1zIjoiMSIsImdpdmVuX25hbWUiOiJtYWRkeSIsImN1c3RvbTphY2NlcHRlZF90ZXJtcyI6IjEiLCJhdWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsImV2ZW50X2lkIjoiZWQwYjEyMGMtNzE5Ny00ZTEwLWJiYjYtNWVkZDBiMWMwZmMzIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE3MzEzNTM2MDEsInBob25lX251bWJlciI6IisxNTE5NzIyMzQxNiIsImN1c3RvbTpsYXN0X2xvZ2luIjoiMTczMTM1MzY0NCIsImV4cCI6MTczMTQ0MDA0NSwiaWF0IjoxNzMxMzUzNjQ1LCJmYW1pbHlfbmFtZSI6ImdyZWVuIiwiY3VzdG9tOnByZWZlcnJlZF9sYW5ndWFnZSI6ImVuIiwiZW1haWwiOiJncmVlbjIxQG1haWxpbmF0b3IuY29tIn0.gKnDCCpN0LW9TxmjtakuXfUX3rG2L8hbkSYhLgJRtFgiLKZ-_H8AOHyuFhKT23x0yN5Sg_FWC9FmolnbNUhUCXQcfI4R65UGHM0sxMQfY1Fz2VeWeF7DcRNdNtnZRWg-h9GcaAPTm-LtmG0m2iyRdgeXjn2oa9xJY77M0eSchvjRHhj-Zf9BqscUlkYnlTw0N2GlyYgw6TF4RbsgiDkA2JGl3eiS2ND4Lb5QCeO7X5oXoqQ4fwjnuUrHYDtU0PiOllimIQulzKTBppRiK1Ss1_FL-PyWatdty31IOk_nLhxGCECt71HsvL-7pL15lXwjJ1c-KiJ9P-Y86lh28-TuVw";

  @override
  void initState() {
    super.initState();

    // Initialize the router synchronously
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const GalleryScreen(
            systemId: '8971660004',
          ),
        ),
        // Add more routes if necessary
      ],
    );

    // Set the flavor
    ref.read(flavorProvider.notifier).state = Flavor.dev;

    // Store access token synchronously
    ref
        .read(tokenServiceProvider(ref.read(networkServiceProvider)))
        .storeAccessToken(accessToken, "", identityToken);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      // Initialize GoRouter
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'CA'),
        Locale('fr', 'CA'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
