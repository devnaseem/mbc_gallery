import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:mbc_core/mbc_core.dart';
import 'dart:js_util' as js_util;
import 'dart:convert';

import 'package:mbc_gallery/main_web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final InitialConfig initialConfig;

  MyApp({Key? key})
      : initialConfig = getInitialConfig(),
        super(key: key);

  static InitialConfig getInitialConfig() {
    try {
      // Use dart:js_util to access the global JS variable
      final dynamic data = js_util.getProperty(html.window, 'flutterInitialData');
      if (data != null && data is Map) {
        // If data is a Map, convert it to InitialConfig
        return InitialConfig.fromMap(Map<String, dynamic>.from(data));
      } else if (data != null && data is String) {
        // If data is a JSON string, decode it
        final Map<String, dynamic> jsonData = jsonDecode(data);
        return InitialConfig.fromMap(jsonData);
      } else {
        // Default configuration if no initial data
        return InitialConfig.defaultConfig();
      }
    } catch (e) {
      print('Error accessing flutterInitialData: $e');
      return InitialConfig.defaultConfig();
    }
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


  @override
  Widget build(BuildContext context) {
    return GalleryAppWeb(
      accessToken: initialConfig.accessToken,
      identityToken: initialConfig.identityToken,
      systemId: initialConfig.systemId,
      env: _mapStringToFlavor(initialConfig.systemId),
    );
  }
}

class InitialConfig {
  final String accessToken;
  final String identityToken;
  final String systemId;
  final String env;

  InitialConfig({
    required this.accessToken,
    required this.identityToken,
    required this.systemId,
    required this.env,
  });

  factory InitialConfig.fromMap(Map<String, dynamic> map) {
    return InitialConfig(
      accessToken: map['accessToken'] ?? '',
      identityToken: map['identityToken'] ?? '',
      systemId: map['systemId'] ?? '',
      env: map['env'] ?? 'dev',
    );
  }

  factory InitialConfig.defaultConfig() {
    return InitialConfig(
      accessToken: 'default_access_token',
      identityToken: 'default_identity_token',
      systemId: 'default_system_id',
      env: 'dev',
    );
  }
}
