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
      'eyJraWQiOiJuSmNFMDFrVkFjMG1RMzBDSTVJMnRPUUorTmExbVRqc3FmWE1WSW9QdU9rPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJldmVudF9pZCI6ImQ0NDBlMTcwLWNiMTAtNDhiMS1hNDYxLWEyNTM5NWY0OTcyMyIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MzQzMzcyNDIsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5jYS1jZW50cmFsLTEuYW1hem9uYXdzLmNvbVwvY2EtY2VudHJhbC0xX2Z5dm9Bb25LTiIsImV4cCI6MTczNDQzNDc4MiwiaWF0IjoxNzM0MzQ4MzgyLCJqdGkiOiI3NTkyZGFjYy0zNTY5LTQ5NzItOTAwOS04ZWFlYmRkMDVjZjgiLCJjbGllbnRfaWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsInVzZXJuYW1lIjoiZTIxYWUzNTgtMzFkZS00MGZlLWE2NGMtNzgyMWY2N2JkNDYxIn0.jHIuSLgN9P--KVnaKoWiZXO4_0WxWM-xbc0v1s4SqFxjf7gSx-2AtJxqCm7z9egci0LtXDeR6btXnvk8mDSUTCnv6CVPGJ4RCsRQIuQWqGI1l8CxocP26EiaZbYObtLU_PzH2r41Qm3kne8aadY8Au4hlNNPNNKkMtXu5cFGyeQguSUH2o__sMGRoGSHN5vpFbI5kcSodXCrkHQeJhFLl9JHMHZg6ZjWOIqqEaX5BkkOFgQPv1evMOs3m3FRrDSennytvZK8ZwWUrL1LO83sGRScAC00Hw4yyiqjrUUcJ1uaGzlhs_m_Qb3Qd8IbaKfmuZBaJ9XkSPO8Twz4V5tZXg';
  final identityToken =
      "eyJraWQiOiJIOUIxcUw2aDFwbjJnQjVoNWF3amV1a0ZOOURZMHdHYXhZaVB5Uk80bGg0PSIsImFsZyI6IlJTMjU2In0.eyJjdXN0b206b25ib2FyZGluZ19zdGFnZSI6IlNJR05fVVBfU1RFUFNfQVdTLlZFUklGWV9QSE9ORV9OVU1CRVIiLCJzdWIiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJjaXR1cyI6Int9IiwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmNhLWNlbnRyYWwtMS5hbWF6b25hd3MuY29tXC9jYS1jZW50cmFsLTFfZnl2b0FvbktOIiwiY3VzdG9tOmFjY2VwdGVkX2RpZ2lfdGVybXMiOiIxIiwiYXV0aF90aW1lIjoxNzM0MzM3MjQyLCJleHAiOjE3MzQ0MzQ3ODIsImlhdCI6MTczNDM0ODM4MiwiY3VzdG9tOnByZWZlcnJlZF9sYW5ndWFnZSI6ImVuIiwiZW1haWwiOiJmZWxpbm9tYXJ5NzczQG1haWxpbmF0b3IuY29tIiwiaWNhbl9lbmFibGVkIjoiZmFsc2UiLCJ1c2VyX2NsYWltcyI6Ilt7XCJzeXN0ZW1cIjpcInByb2N1cmEtcHJpdmF0ZVwiLFwiYXV0aG9yaXplZElkc1wiOltcIjAwMDA2NjIyMTJcIl19XSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOnRydWUsImNvZ25pdG86dXNlcm5hbWUiOiJlMjFhZTM1OC0zMWRlLTQwZmUtYTY0Yy03ODIxZjY3YmQ0NjEiLCJ1c2VyX2NsYWltc192MiI6Ilt7XCJwc0lkXCI6XCIwMDAwNjYyMjEyXCIsXCJzeXN0ZW1UeXBlXCI6XCJob21lQ2FyZVwiLFwiYXV0aG9yaXplZFN5c3RlbXNcIjpbe1wiaWRcIjpcIjAwMDA2NjIyMTJcIixcIm5hbWVcIjpcInByb2N1cmEtcHJpdmF0ZVwiLFwidXNlclR5cGVcIjpcImNsaWVudFwiLFwidGVuYW50c1wiOltcIlByb2N1cmFfTGVhcGZyb2dOZXdcIl19XX1dIiwiZ2l2ZW5fbmFtZSI6ImZlbGlubyIsImN1c3RvbTphY2NlcHRlZF90ZXJtcyI6IjEiLCJhdWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsImV2ZW50X2lkIjoiZDQ0MGUxNzAtY2IxMC00OGIxLWE0NjEtYTI1Mzk1ZjQ5NzIzIiwidG9rZW5fdXNlIjoiaWQiLCJwaG9uZV9udW1iZXIiOiIrOTE2MzY0Njc0NTEzIiwiY3VzdG9tOmxhc3RfbG9naW4iOiIxNzM0MzQ4MzMwIiwiZmFtaWx5X25hbWUiOiJtYXJ5In0.O6VjDkaGiuD9vvqFK6KDg0ht_OAYt1VXfzKrekvOR8sfE61zpMjI9MMgHT-ruLdcsuCWxEyfzUFk1j0kbFtfnxj6OXiABf1M6tsQiwOdBtQGZPFXl5v-2BGoaTRgZ2Kr266NFxunlMaEKIoC-MsFx5qWmjv_NwH18oI4w-rFbRY3p5x6h7eD4stC6YH4lq6KpAF_y7kUcTDk_dbOw4VGVaC2bIv6CJoZuMvh3hY_yTlyjELqN0WEmuQu2sIFZyKiMExzqQqKqyEJ5vzb8Gxq7Zq81pXewp2uHVkvBNGa5CkAuQNPfrgyaMlX_x3eUVNMSC9voRFZ3O4QgufNzByjTw";

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
