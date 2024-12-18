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
      'eyJraWQiOiJuSmNFMDFrVkFjMG1RMzBDSTVJMnRPUUorTmExbVRqc3FmWE1WSW9QdU9rPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJldmVudF9pZCI6ImQ0NDBlMTcwLWNiMTAtNDhiMS1hNDYxLWEyNTM5NWY0OTcyMyIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MzQzMzcyNDIsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5jYS1jZW50cmFsLTEuYW1hem9uYXdzLmNvbVwvY2EtY2VudHJhbC0xX2Z5dm9Bb25LTiIsImV4cCI6MTczNDU5ODQ1NywiaWF0IjoxNzM0NTEyMDU3LCJqdGkiOiI5OGRmOTZiYi1hM2Q3LTQ1NWMtYWI4OC04YWI5Y2ViNjFhY2MiLCJjbGllbnRfaWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsInVzZXJuYW1lIjoiZTIxYWUzNTgtMzFkZS00MGZlLWE2NGMtNzgyMWY2N2JkNDYxIn0.CpWsb-2UvHf2WmTYYY5-QmK5B2c1SwShkOk0Ib_YLeHMJ4EeyfR1E58wn5tpsS8ctjZhrUH6PgMly6uXPUiyFrDvitbLiUgB9RSa5ln_JvaLLUvbp4nommDeqhlGq991XEFselP_m4rhmnksCRUnPd4fmrwG9E-3RsSI_wT95IsGYWeWj1gMCSsoaEqxdlH710rn3Z3thM0bbL1PFyAukMIKnc-c3nFAeoOrh-a48E2BHVzb7FDfNov9tMq4XIVwxHkboqwnIfKtcn6DumWP55TrAJUKQhaJ6Ia0A91N-56dFcEGKZ0l8yLDRvYTXrHBcHiOgITJHDigNpCn4WwFXw';
  final identityToken =
      "eyJraWQiOiJIOUIxcUw2aDFwbjJnQjVoNWF3amV1a0ZOOURZMHdHYXhZaVB5Uk80bGg0PSIsImFsZyI6IlJTMjU2In0.eyJjdXN0b206b25ib2FyZGluZ19zdGFnZSI6IkRPTkUiLCJzdWIiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJjaXR1cyI6Int9IiwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmNhLWNlbnRyYWwtMS5hbWF6b25hd3MuY29tXC9jYS1jZW50cmFsLTFfZnl2b0FvbktOIiwiY3VzdG9tOmFjY2VwdGVkX2RpZ2lfdGVybXMiOiIxIiwiYXV0aF90aW1lIjoxNzM0MzM3MjQyLCJleHAiOjE3MzQ1OTg0NTcsImlhdCI6MTczNDUxMjA1NywiY3VzdG9tOnByZWZlcnJlZF9sYW5ndWFnZSI6ImVuIiwiZW1haWwiOiJmZWxpbm9tYXJ5NzczQG1haWxpbmF0b3IuY29tIiwiaWNhbl9lbmFibGVkIjoiZmFsc2UiLCJ1c2VyX2NsYWltcyI6Ilt7XCJzeXN0ZW1cIjpcInByb2N1cmEtcHJpdmF0ZVwiLFwiYXV0aG9yaXplZElkc1wiOltcIjAwMDA2NjIyMTJcIl19XSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOnRydWUsImNvZ25pdG86dXNlcm5hbWUiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJ1c2VyX2NsYWltc192MiI6Ilt7XCJwc0lkXCI6XCIwMDAwNjYyMjEyXCIsXCJzeXN0ZW1UeXBlXCI6XCJob21lQ2FyZVwiLFwiYXV0aG9yaXplZFN5c3RlbXNcIjpbe1wiaWRcIjpcIjAwMDA2NjIyMTJcIixcIm5hbWVcIjpcInByb2N1cmEtcHJpdmF0ZVwiLFwidXNlclR5cGVcIjpcImNsaWVudFwiLFwidGVuYW50c1wiOltcIlByb2N1cmFfTGVhcGZyb2dOZXdcIl19XX1dIiwiZ2l2ZW5fbmFtZSI6ImZlbGlubyIsImN1c3RvbTphY2NlcHRlZF90ZXJtcyI6IjEiLCJhdWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsImV2ZW50X2lkIjoiZDQ0MGUxNzAtY2IxMC00OGIxLWE0NjEtYTI1Mzk1ZjQ5NzIzIiwidG9rZW5fdXNlIjoiaWQiLCJwaG9uZV9udW1iZXIiOiIrOTE2MzY0Njc0NTEzIiwiY3VzdG9tOmxhc3RfbG9naW4iOiIxNzM0NTEyMDQ5IiwiZmFtaWx5X25hbWUiOiJtYXJ5In0.AcEPxJ__sK3Y_k2FiZ5qF8uzN1l5xci6uoESSZsfmjeaSrYgqBGjmWlf0UY7pFLtltCrI1X_yuvEbAQgPtKiCpVkS_aLRogf1uzqglHF8C_ftdISEsW9icIexUwtsxmcyQtUAjulX-lMSp7lunMWOtb4G6na2ch8OqOyhlVzsGC-C9pSRqlIMnek0QS02indwHe1O9rNkqs3JBhu_SpDZex7FzUBd7XcKKeoz_0YCcSqEy8KDdmAaKFfjYbpU69slEPjOPS0nnV_nkZeC5OyMbl_acOxtxBbxOQTScKUNuecGzHNt7GEuF4fUz8fyy2qg5YNggLKjGXgQDfdNGzSng";

  @override
  void initState() {
    super.initState();

    // Initialize the router synchronously
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const GalleryScreen(
            systemId: '0000662212',
            cognitoId: "e21ae358-31de-40fe-a64c-7821f67bd461",
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
