import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_web_entry.dart';
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
    Key? key,
    required this.accessToken,
    required this.identityToken,
    required this.systemId,
    required this.env,
  }) : super(key: key);

  @override
  _GalleryRootAppWebState createState() => _GalleryRootAppWebState();
}

class _GalleryRootAppWebState extends ConsumerState<GalleryRootAppWeb> {
  late final StreamSubscription<InitialConfig> _configSubscription;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => GalleryScreen(
            systemId: widget.systemId ?? '0000662212',
          ),
        ),
      ],
    );

    // Initial setup for providers
    _initializeProviders(widget.env, widget.accessToken, widget.identityToken);

    // Listen to FlutterDataStore updates
    _configSubscription =
        FlutterDataStore.instance.configStream.listen((config) {
      setState(() {
        // Update providers on config change
        _initializeProviders(
          _mapStringToFlavor(config.env),
          config.accessToken,
          config.identityToken,
        );
      });
    });
  }

  void _initializeProviders(
      Flavor flavor, String? accessToken, String? identityToken) {
    ref.read(flavorProvider.notifier).state = flavor;
    ref
        .read(tokenServiceProvider(ref.read(networkServiceProvider)))
        .storeAccessToken(accessToken ?? '', "", identityToken ?? '');
  }

  @override
  void dispose() {
    _configSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
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
    );
  }

  Flavor _mapStringToFlavor(String env) {
    switch (env) {
      case 'dev':
        return Flavor.dev;
      case 'staging':
        return Flavor.staging;
      case 'prod':
        return Flavor.prod;
      default:
        return Flavor.dev;
    }
  }
}
