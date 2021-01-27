import 'package:covid19_news/app/service/api_keys.dart';
import 'package:flutter/foundation.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  recovered,
  death,
}

// imporrted api_keys.dart
class API {
  API({@required this.apiKey});

  final String apiKey;
  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);
  static final String host =
      "https://ncov2019-admin.firebaseapp.com"; // create and initialize the static variable
  Uri tokenUri() => Uri(
        // uniform resource identifier
        scheme: 'http',
        host: host,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _paths[endpoint],
      );

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.recovered: 'recovered',
    Endpoint.death: 'death',
  };
}
