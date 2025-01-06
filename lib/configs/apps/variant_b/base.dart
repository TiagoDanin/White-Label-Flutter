import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:whitelabels_example/configs/apps/base_config.dart';

class VariantBBase extends BaseConfig {
  @override
  final String title = 'Flutter Demo B';

  @override
  final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: true,
  );

  final String baseUrlApi = dotenv.get("APP_BASE_URL_API", fallback: "");
}
