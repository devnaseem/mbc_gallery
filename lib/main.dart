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

  final accessToken =
      'eyJraWQiOiJuSmNFMDFrVkFjMG1RMzBDSTVJMnRPUUorTmExbVRqc3FmWE1WSW9QdU9rPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJhMjkxOGNmNS0yNjFjLTQ5N2ItODk4ZC1mNmY2N2ZiNjJkNzkiLCJldmVudF9pZCI6IjhkNGEwNmUwLWFkODMtNDgzNC1iYmU1LTYxY2E0Y2U4MzI3NyIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MzQwODYwMjksImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5jYS1jZW50cmFsLTEuYW1hem9uYXdzLmNvbVwvY2EtY2VudHJhbC0xX2Z5dm9Bb25LTiIsImV4cCI6MTczNDE3MjUxNSwiaWF0IjoxNzM0MDg2MTE1LCJqdGkiOiJjZDA0NTMzNy1iNzFhLTQ3YTAtYTU4Zi05OGNhNWJkMTE3OGUiLCJjbGllbnRfaWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsInVzZXJuYW1lIjoiYTI5MThjZjUtMjYxYy00OTdiLTg5OGQtZjZmNjdmYjYyZDc5In0.kDLg2dK6DpAxpmqe6bI1lctjFkiVI35x159-bxP0Duxbq_oCXVN6uwLtGYmfAzxBL4gv0Gxu67vW5hCbdYm28twJmgx-od8eE-7W_nCljhb23P0DDFZLF5JVJ6lUeyDui3Pdlo428Xw_HFZV_9C1ndggyWromGx34WE1k4bD_ty0oCvGB-giQTyQas6bAf1ilO6_ObzhfAO2JDpd9GKguHrg_y9bnf3MYYgitM-8U4A6Pw5t8E0xxSfQbI9SO6p2c0diRdxdveNbxNhhGvwsW2YkHDDOtY-D0E5sf1N42utctbCW7LXEjUtx4MEzM_nqn_nFel4nkIWpTun5EPX22g';
  final identityToken =
      "eyJraWQiOiJIOUIxcUw2aDFwbjJnQjVoNWF3amV1a0ZOOURZMHdHYXhZaVB5Uk80bGg0PSIsImFsZyI6IlJTMjU2In0.eyJpY2FuX2VuYWJsZWQiOiJmYWxzZSIsInN1YiI6ImEyOTE4Y2Y1LTI2MWMtNDk3Yi04OThkLWY2ZjY3ZmI2MmQ3OSIsInVzZXJfY2xhaW1zIjoiW3tcInN5c3RlbVwiOlwicHJvY3VyYVwiLFwiYXV0aG9yaXplZElkc1wiOltcIjAwMDA1NDIyMTFcIl19XSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJjaXR1cyI6Int9IiwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmNhLWNlbnRyYWwtMS5hbWF6b25hd3MuY29tXC9jYS1jZW50cmFsLTFfZnl2b0FvbktOIiwicGhvbmVfbnVtYmVyX3ZlcmlmaWVkIjp0cnVlLCJjb2duaXRvOnVzZXJuYW1lIjoiYTI5MThjZjUtMjYxYy00OTdiLTg5OGQtZjZmNjdmYjYyZDc5IiwidXNlcl9jbGFpbXNfdjIiOiJbe1wicHNJZFwiOlwiMDAwMDU0MjIxMVwiLFwic3lzdGVtVHlwZVwiOlwiaG9tZUNhcmVcIixcImF1dGhvcml6ZWRTeXN0ZW1zXCI6W3tcImlkXCI6XCIwMDAwNTQyMjExXCIsXCJuYW1lXCI6XCJwcm9jdXJhXCIsXCJ1c2VyVHlwZVwiOlwiY2xpZW50XCIsXCJ0ZW5hbnRzXCI6W1wiUHJvY3VyYV9MZWFwZnJvZ05ld1wiXX1dfV0iLCJjdXN0b206YWNjZXB0ZWRfZGlnaV90ZXJtcyI6IjEiLCJnaXZlbl9uYW1lIjoiSm9obiIsImN1c3RvbTphY2NlcHRlZF90ZXJtcyI6IjEiLCJhdWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsImV2ZW50X2lkIjoiOGQ0YTA2ZTAtYWQ4My00ODM0LWJiZTUtNjFjYTRjZTgzMjc3IiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE3MzQwODYwMjksInBob25lX251bWJlciI6Iis5MTYzODA0MTE4MDMiLCJjdXN0b206bGFzdF9sb2dpbiI6IjE3MzQwODYwMzQiLCJleHAiOjE3MzQxNzI1MTUsImlhdCI6MTczNDA4NjExNSwiZmFtaWx5X25hbWUiOiJjaHJpcyIsImN1c3RvbTpwcmVmZXJyZWRfbGFuZ3VhZ2UiOiJlbiIsImVtYWlsIjoiam9obmNocmlzNjQ0QG1haWxpbmF0b3IuY29tIn0.outmyxXx0bslATzuJyazLdspjIAlk_eLhk05r16IbaZuTkpiw3-fdmstvc5tKPQjjwFRFPJGWMLFLtp50Ppm-XrijBhG5TK6pEt4JgYz5_gZBzF8EJbn42C8wVB7WNZbbSIyn-xdTG7_F0GAwdSN3tRf4imlCIvVlP86PgUqBdBErGYs3s-CTIG947_CJ-BiRJ6JiwqIrSTqfBTfBlEEU-B3iICHPBmhhmDj4_DLzNsyb6qdhlyq7m6aWiy4aleA9Gcgu99G4ZeE3MlbfZouKPkPhTxqVvkIaGbOdVt5kaCvI4UXkGIgoAAS2GhO2U8oWwYjT6PFZE1umjLzfKypPQ";

  @override
  void initState() {
    super.initState();

    // Initialize the router synchronously
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const GalleryScreen(
            systemId: '0000542211',
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
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
