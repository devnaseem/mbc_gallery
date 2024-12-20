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
      'eyJraWQiOiJuSmNFMDFrVkFjMG1RMzBDSTVJMnRPUUorTmExbVRqc3FmWE1WSW9QdU9rPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJldmVudF9pZCI6ImQ0NDBlMTcwLWNiMTAtNDhiMS1hNDYxLWEyNTM5NWY0OTcyMyIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MzQzMzcyNDIsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5jYS1jZW50cmFsLTEuYW1hem9uYXdzLmNvbVwvY2EtY2VudHJhbC0xX2Z5dm9Bb25LTiIsImV4cCI6MTczNDc3OTk5MCwiaWF0IjoxNzM0NjkzNTkzLCJqdGkiOiI2YWNhMzM5YS1mZTkzLTQ5YTctYjYyNy0wZjlkY2VmNGFkNDUiLCJjbGllbnRfaWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsInVzZXJuYW1lIjoiZTIxYWUzNTgtMzFkZS00MGZlLWE2NGMtNzgyMWY2N2JkNDYxIn0.LyHANjE_kbkkScpfMhc_7ASy-GXNJX3Td-LC23h9eWBvbK5ftnrJui_zQoEZTh8dAsoKdqXKlNhWl_UNztR3Mf3q5cdCzeUbeUntaPQRB-LanLxPSi6BknkATGYtnmquvfgN3zvNtai5DlIxv8137344eMVe4tLv6jyDvO6wBW-WgjxouAbWkacDpwN-kKwOoGvQFsm6dtpOYoFfBbcIO6dM_rDjzYQIBgeUb3U4fsiKG-8ql3GHSSZIoxfdNEJ6KwiqKWAWKjIftBXbbK15rPa9wKIa5gZZYu8NcvGNy66gSWlJA51Xdres7TzGMq4ez08D2zr1JCRiUv0GliMMvg';
  final identityToken =
      "eyJraWQiOiJIOUIxcUw2aDFwbjJnQjVoNWF3amV1a0ZOOURZMHdHYXhZaVB5Uk80bGg0PSIsImFsZyI6IlJTMjU2In0.eyJjdXN0b206b25ib2FyZGluZ19zdGFnZSI6IkRPTkUiLCJzdWIiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJjaXR1cyI6Int9IiwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmNhLWNlbnRyYWwtMS5hbWF6b25hd3MuY29tXC9jYS1jZW50cmFsLTFfZnl2b0FvbktOIiwiY3VzdG9tOmFjY2VwdGVkX2RpZ2lfdGVybXMiOiIxIiwiYXV0aF90aW1lIjoxNzM0MzM3MjQyLCJleHAiOjE3MzQ3Nzk5OTAsImlhdCI6MTczNDY5MzU5MywiY3VzdG9tOnByZWZlcnJlZF9sYW5ndWFnZSI6ImVuIiwiZW1haWwiOiJmZWxpbm9tYXJ5NzczQG1haWxpbmF0b3IuY29tIiwiaWNhbl9lbmFibGVkIjoiZmFsc2UiLCJ1c2VyX2NsYWltcyI6Ilt7XCJzeXN0ZW1cIjpcInByb2N1cmEtcHJpdmF0ZVwiLFwiYXV0aG9yaXplZElkc1wiOltcIjAwMDA2NjIyMTJcIl19XSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOnRydWUsImNvZ25pdG86dXNlcm5hbWUiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJ1c2VyX2NsYWltc192MiI6Ilt7XCJwc0lkXCI6XCIwMDAwNjYyMjEyXCIsXCJzeXN0ZW1UeXBlXCI6XCJob21lQ2FyZVwiLFwiYXV0aG9yaXplZFN5c3RlbXNcIjpbe1wiaWRcIjpcIjAwMDA2NjIyMTJcIixcIm5hbWVcIjpcInByb2N1cmEtcHJpdmF0ZVwiLFwidXNlclR5cGVcIjpcImNsaWVudFwiLFwidGVuYW50c1wiOltcIlByb2N1cmFfTGVhcGZyb2dOZXdcIl19XX1dIiwiZ2l2ZW5fbmFtZSI6ImZlbGlubyIsImN1c3RvbTphY2NlcHRlZF90ZXJtcyI6IjEiLCJhdWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsImV2ZW50X2lkIjoiZDQ0MGUxNzAtY2IxMC00OGIxLWE0NjEtYTI1Mzk1ZjQ5NzIzIiwidG9rZW5fdXNlIjoiaWQiLCJwaG9uZV9udW1iZXIiOiIrOTE2MzY0Njc0NTEzIiwiY3VzdG9tOmxhc3RfbG9naW4iOiIxNzM0Njg4Mjk0IiwiZmFtaWx5X25hbWUiOiJtYXJ5In0.ysq1_qzgL4NbwGEZenzZ2fFln81v6GgmetnULNcM9P1wu1XfmWgusUgZbW8fBVc3gfaIX55yqB8r2V_AgtAQc_SZ_SvSlFIRa6X26MiQHfZo5D72AWUE8UW8W34ouu7uXYv7mKNtfW80jIfrEcu2a2oWQOnW0CXwAmzy2Vls2xNcq49H6fJX4pq39xtVZvEjfvVLlWRw93j5X_YpQw2WEC3Ej2Oh4h-e8s-jLwrM1tqFl2VnfQnQOGz0VT1T7vHA80zHXMOQx_t8TF_r0uU2xydxh8mLkAnbincYoV-HqC8OxbLUxAyNBiIcwJxzmlv2QaOqz_ZA950Zjcm5CUzHgQ";

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
