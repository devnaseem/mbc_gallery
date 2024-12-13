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
      'eyJraWQiOiJuSmNFMDFrVkFjMG1RMzBDSTVJMnRPUUorTmExbVRqc3FmWE1WSW9QdU9rPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJhMjkxOGNmNS0yNjFjLTQ5N2ItODk4ZC1mNmY2N2ZiNjJkNzkiLCJldmVudF9pZCI6ImE1OWIyN2QxLTI0ODktNDNmNy05ZmVmLWVhNjBhMjg3ZDQxOSIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MzM4MTAwNjksImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5jYS1jZW50cmFsLTEuYW1hem9uYXdzLmNvbVwvY2EtY2VudHJhbC0xX2Z5dm9Bb25LTiIsImV4cCI6MTczMzg5NjQ4MywiaWF0IjoxNzMzODEwMDgzLCJqdGkiOiI5MGY0M2FlNy03NjliLTRhMTMtYmJkOS0zOGE3M2JhNDI3ZTUiLCJjbGllbnRfaWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsInVzZXJuYW1lIjoiYTI5MThjZjUtMjYxYy00OTdiLTg5OGQtZjZmNjdmYjYyZDc5In0.iwhjKsYfA0qzpx2bHjfD3UKTfF8gvVf5LUtNaDRATqRyvRYfZ38Ac3kxXMIuAiaBQqyUD8JeZoB5s2Nd9VVFJ90CaYdfmiGf2Nc7PNi1UEvrHeilV_oALH0cD-uzKJ2mkuuAWAuAGzvGLnJt_Fz8Bl5GoSg_LaHzodEy__bd2NQVzdotxd3scuz8eBC5s8RTIgDPjeVZfEPd8PXTu83bEvTYGuUkm29ZeJVBBiMn9MGpoGAzMqGXNr8SYcAan7eq0oKjGvHi2mWD8tDY_c1RdFNZe3hlq_XqC8tB0ojIg0coVT68TNdcIGiGlghhHynVZiZY7dCNZjHhkWIBr5x1JA';
  final identityToken =
      "eyJraWQiOiJIOUIxcUw2aDFwbjJnQjVoNWF3amV1a0ZOOURZMHdHYXhZaVB5Uk80bGg0PSIsImFsZyI6IlJTMjU2In0.eyJpY2FuX2VuYWJsZWQiOiJmYWxzZSIsInN1YiI6ImEyOTE4Y2Y1LTI2MWMtNDk3Yi04OThkLWY2ZjY3ZmI2MmQ3OSIsInVzZXJfY2xhaW1zIjoiW3tcInN5c3RlbVwiOlwicHJvY3VyYVwiLFwiYXV0aG9yaXplZElkc1wiOltcIjAwMDA1NDIyMTFcIl19XSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJjaXR1cyI6Int9IiwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmNhLWNlbnRyYWwtMS5hbWF6b25hd3MuY29tXC9jYS1jZW50cmFsLTFfZnl2b0FvbktOIiwicGhvbmVfbnVtYmVyX3ZlcmlmaWVkIjp0cnVlLCJjb2duaXRvOnVzZXJuYW1lIjoiYTI5MThjZjUtMjYxYy00OTdiLTg5OGQtZjZmNjdmYjYyZDc5IiwidXNlcl9jbGFpbXNfdjIiOiJbe1wicHNJZFwiOlwiMDAwMDU0MjIxMVwiLFwic3lzdGVtVHlwZVwiOlwiaG9tZUNhcmVcIixcImF1dGhvcml6ZWRTeXN0ZW1zXCI6W3tcImlkXCI6XCIwMDAwNTQyMjExXCIsXCJuYW1lXCI6XCJwcm9jdXJhXCIsXCJ1c2VyVHlwZVwiOlwiY2xpZW50XCIsXCJ0ZW5hbnRzXCI6W1wiUHJvY3VyYV9MZWFwZnJvZ05ld1wiXX1dfV0iLCJjdXN0b206YWNjZXB0ZWRfZGlnaV90ZXJtcyI6IjEiLCJnaXZlbl9uYW1lIjoiSm9obiIsImN1c3RvbTphY2NlcHRlZF90ZXJtcyI6IjEiLCJhdWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsImV2ZW50X2lkIjoiYTU5YjI3ZDEtMjQ4OS00M2Y3LTlmZWYtZWE2MGEyODdkNDE5IiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE3MzM4MTAwNjksInBob25lX251bWJlciI6Iis5MTYzODA0MTE4MDMiLCJjdXN0b206bGFzdF9sb2dpbiI6IjE3MzM4MTAwNzEiLCJleHAiOjE3MzM4OTY0ODMsImlhdCI6MTczMzgxMDA4MywiZmFtaWx5X25hbWUiOiJjaHJpcyIsImN1c3RvbTpwcmVmZXJyZWRfbGFuZ3VhZ2UiOiJlbiIsImVtYWlsIjoiam9obmNocmlzNjQ0QG1haWxpbmF0b3IuY29tIn0.ddFwX4ZpLlrwvjoVsv7oS3yHQi3-3U3C4SKJrvfng1KKNgK20PofmGSohOY4G_nl7Xm1RvJN7bbk6Jjbw_qG4TlQPVU3iF_r51LFbbWb_n4hr4CZj_CuB60xNjMYFo0-FI94wCavpX-tLsWCHaBUMMFISNibTI9OLx7FztCj1AnVjH-q9QNjnlcj44KUeKKn-3J_1ZgIYWsE1aCJyv_8urPX9nyGHG7Tel7QC6S5T1qQsPdtzyMIWoJPfXw7obH85hD3dZbP3kWDEmVDAFQZIruYzriatnUb3ZAPcDhxUN8iUrYOl4M4264V-oNzalkewoz5xxOXQ7lIlbfuj1MDcg";

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
