import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:whitelabels_example/configs/apps/base_config.dart';

class VariantABase extends BaseConfig {
  @override
  final String title = 'Flutter Demo A';

  @override
  final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
    useMaterial3: true,
  );

  final String baseUrlApi = dotenv.get("APP_BASE_URL_API", fallback: "");
}
