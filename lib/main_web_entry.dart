import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:mbc_core/mbc_core.dart';
import 'dart:js_util' as js_util;
import 'dart:convert';
import 'package:js/js.dart';

import 'package:mbc_gallery/main_web.dart';

void main() {
  runApp(GalleryWeb());
}

class GalleryWeb extends StatelessWidget {
  final InitialConfig initialConfig;

  GalleryWeb({super.key}) : initialConfig = getInitialConfig();

  static InitialConfig getInitialConfig() {
    try {
      // Use dart:js_util to access the global JS variable this is for inital data from angular
      final dynamic data =
          js_util.getProperty(html.window, 'flutterInitialData');
      if (data != null && data is Map) {
        // If data is a Map, convert it to InitialConfig
        print("initialdata : $data");
        return InitialConfig.fromMap(Map<String, dynamic>.from(data));
      } else if (data != null && data is String) {
        print("initialdata  as String: $data");
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

  @override
  Widget build(BuildContext context) {
    // Set up JS interop for dynamic updates
    js_util.setProperty(
      html.window,
      'flutterUpdateData',
      allowInterop((dynamic updatedData) {
        try {
          final parsedData = jsonDecode(updatedData) as Map<String, dynamic>;
          FlutterDataStore.instance
              .updateConfig(InitialConfig.fromMap(parsedData));
        } catch (e) {
          print('Error updating Flutter data: $e');
        }
      }),
    );

    return StreamBuilder<InitialConfig>(
      stream: FlutterDataStore.instance.configStream,
      builder: (context, snapshot) {
        final initialConfig = snapshot.data ?? InitialConfig.defaultConfig();
        return GalleryAppWeb(
          accessToken: initialConfig.accessToken,
          identityToken: initialConfig.identityToken,
          systemId: initialConfig.systemId,
          env: _mapStringToFlavor(initialConfig.env),
        );
      },
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

// Singleton to manage Flutter data updates
class FlutterDataStore {
  FlutterDataStore._privateConstructor();
  static final FlutterDataStore instance =
      FlutterDataStore._privateConstructor();

  final _configController = StreamController<InitialConfig>.broadcast();
  Stream<InitialConfig> get configStream => _configController.stream;

  void updateConfig(InitialConfig config) {
    _configController.sink.add(config);
  }
}
