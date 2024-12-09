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

  final accessToken ='eyJraWQiOiJuSmNFMDFrVkFjMG1RMzBDSTVJMnRPUUorTmExbVRqc3FmWE1WSW9QdU9rPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJhMjkxOGNmNS0yNjFjLTQ5N2ItODk4ZC1mNmY2N2ZiNjJkNzkiLCJldmVudF9pZCI6Ijg0YTNkM2U1LWVhZWQtNDMwNy1hNTZiLTMxYmM4MGRkM2IzMiIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MzM2NjA1MTYsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5jYS1jZW50cmFsLTEuYW1hem9uYXdzLmNvbVwvY2EtY2VudHJhbC0xX2Z5dm9Bb25LTiIsImV4cCI6MTczMzc0Njk0NywiaWF0IjoxNzMzNjYwNTQ3LCJqdGkiOiI4MGY0NTdjZi05MjE2LTQzYmQtOWJhZC1lZjgyOTgxYzgyMzEiLCJjbGllbnRfaWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsInVzZXJuYW1lIjoiYTI5MThjZjUtMjYxYy00OTdiLTg5OGQtZjZmNjdmYjYyZDc5In0.Ng23Pga56OzRZVXxRi226e1UrZv9uObw0lFITu7N3P8l004LpJnkrbWCD0KAoYrWmGkE3nmtT5YDAU2GdMcIBaLs9y7D5xqhlRT1AL01CKrXF4akWmIiCr7W_smhhfEAkv1qNwjG-Q_qBUFu7b1CKIxiyj9OKL6tjPV9pgyV8x5ikRWL-C2YMDMvT5VdeUSHUqP8zOEGwF87XTpSNskD2bmIJFm9jm-TagPdR-NTzQh9XMkUMIo91c0j8YC7yFC-X67Jn5NIfcz08FXbviBOpl0h5kz1MXlxSZuAgCF5TOdRfITpMwO-qNylHeNnb6-Clkn2UKkdRQuTjqjkUyKG9w';
  final identityToken ="eyJraWQiOiJIOUIxcUw2aDFwbjJnQjVoNWF3amV1a0ZOOURZMHdHYXhZaVB5Uk80bGg0PSIsImFsZyI6IlJTMjU2In0.eyJpY2FuX2VuYWJsZWQiOiJmYWxzZSIsInN1YiI6ImEyOTE4Y2Y1LTI2MWMtNDk3Yi04OThkLWY2ZjY3ZmI2MmQ3OSIsInVzZXJfY2xhaW1zIjoiW3tcInN5c3RlbVwiOlwicHJvY3VyYVwiLFwiYXV0aG9yaXplZElkc1wiOltcIjAwMDA1NDIyMTFcIl19XSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJjaXR1cyI6Int9IiwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmNhLWNlbnRyYWwtMS5hbWF6b25hd3MuY29tXC9jYS1jZW50cmFsLTFfZnl2b0FvbktOIiwicGhvbmVfbnVtYmVyX3ZlcmlmaWVkIjp0cnVlLCJjb2duaXRvOnVzZXJuYW1lIjoiYTI5MThjZjUtMjYxYy00OTdiLTg5OGQtZjZmNjdmYjYyZDc5IiwidXNlcl9jbGFpbXNfdjIiOiJbe1wicHNJZFwiOlwiMDAwMDU0MjIxMVwiLFwic3lzdGVtVHlwZVwiOlwiaG9tZUNhcmVcIixcImF1dGhvcml6ZWRTeXN0ZW1zXCI6W3tcImlkXCI6XCIwMDAwNTQyMjExXCIsXCJuYW1lXCI6XCJwcm9jdXJhXCIsXCJ1c2VyVHlwZVwiOlwiY2xpZW50XCIsXCJ0ZW5hbnRzXCI6W1wiUHJvY3VyYV9MZWFwZnJvZ05ld1wiXX1dfV0iLCJjdXN0b206YWNjZXB0ZWRfZGlnaV90ZXJtcyI6IjEiLCJnaXZlbl9uYW1lIjoiSm9obiIsImN1c3RvbTphY2NlcHRlZF90ZXJtcyI6IjEiLCJhdWQiOiIyb29vNDkzZHBuNWNzN3J1aW80bG1wNDcyaSIsImV2ZW50X2lkIjoiODRhM2QzZTUtZWFlZC00MzA3LWE1NmItMzFiYzgwZGQzYjMyIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE3MzM2NjA1MTYsInBob25lX251bWJlciI6Iis5MTYzODA0MTE4MDMiLCJjdXN0b206bGFzdF9sb2dpbiI6IjE3MzM2NjA1MTkiLCJleHAiOjE3MzM3NDY5NDcsImlhdCI6MTczMzY2MDU0NywiZmFtaWx5X25hbWUiOiJjaHJpcyIsImN1c3RvbTpwcmVmZXJyZWRfbGFuZ3VhZ2UiOiJlbiIsImVtYWlsIjoiam9obmNocmlzNjQ0QG1haWxpbmF0b3IuY29tIn0.piF8qNQgLsVSBjQg-8w-lFGihTP180Ou5wz7rEqHmtu3FIsUv7n0tpIzJ6C2SsZfDCbl_L151h-mmK6xtBhA7GonpWG9dSgNelqLNBQ9ghVwCvRlXsavvt6xwjICVJbHkVrvdD7BZ8D4NlA6K2DDlJSdgammcKvmS_eDn51jVISjHiqj9UKuv9-FsYSEKNucqy_8xm0rqs24q2Tu9hZihtp2F-wSrNemflLwLUNuJ7MGdaL7KgYm3PKsi0SPePcpeYP0jTlEhW58K-QxlbXXvC7mBTiP6oeJJhUPFGUYZqPihiSC44izZ4OSmfIdZ13YorD0SxeKwkflIUD04KT7Ug";

  @override
  void initState() {
    super.initState();

    // Initialize the router synchronously
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const GalleryScreen(
            systemId: '',
          ),
        ),
        // Add more routes if necessary
      ],
    );

    // Set the flavor
    //ref.read(flavorProvider.notifier).state = Flavor.dev;

    // Store access token synchronously
   // ref
     //   .read(tokenServiceProvider(ref.read(networkServiceProvider)))
      //  .storeAccessToken(accessToken, "", identityToken);
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
