import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:whitelabels_example/configs/apps/base_config.dart';
import 'package:whitelabels_example/my_app.dart';

import 'base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env.variant_c");

  BaseConfig currentConfig = VariantCBase();

  runApp(
    MyApp(
      currentConfig: currentConfig,
    ),
  );
}
