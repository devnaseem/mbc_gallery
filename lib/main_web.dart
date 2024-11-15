// lib/main_web.dart (entry point for web)
import 'dart:convert';
import 'dart:html' as html;
import 'package:js/js_util.dart' as js_util;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mbc_gallery.dart';
import 'package:go_router/go_router.dart';

import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_core/mbc_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class GalleryAppWeb extends StatelessWidget {

  final String? accessToken;
  final String? identityToken;
  final String? systemId;
  final Flavor env;

  const GalleryAppWeb({
    super.key,
    required this.accessToken,
    required this.identityToken,
    required this.systemId,
    required this.env,
  });


  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GalleryRootAppWeb(
        accessToken: accessToken,
        identityToken: identityToken,
        systemId: systemId,
        env: env,
      ),
    );
  }
}

class GalleryRootAppWeb extends ConsumerStatefulWidget {
  final String? accessToken;
  final String? identityToken;
  final String? systemId;
  final Flavor env;

  const GalleryRootAppWeb({
    super.key,
    required this.accessToken,
    required this.identityToken,
    required this.systemId,
    required this.env,
  });

  @override
  _GalleryRootAppWebState createState() => _GalleryRootAppWebState();
}

class _GalleryRootAppWebState extends ConsumerState<GalleryRootAppWeb> {
  late final GoRouter _router;
  @override
  void initState() {
    super.initState();

    // Initialize the router synchronously
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => GalleryScreen(
            systemId: widget.systemId ?? '0000662212',
          ),
        ),
        // Add more routes if necessary
      ],
    );

    // Set the flavor
    ref.read(flavorProvider.notifier).state = widget.env;

    // Store access token synchronously
    ref
        .read(tokenServiceProvider(ref.read(networkServiceProvider)))
        .storeAccessToken(widget.accessToken!, "", widget.identityToken!);
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
