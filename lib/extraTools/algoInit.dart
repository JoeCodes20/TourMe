import 'package:algolia/algolia.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Application {
  static final Algolia algolia = Algolia.init(
      applicationId: dotenv.get("ApplicationId"),
      apiKey: dotenv.get("API_Key"));
}
