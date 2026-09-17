class PlansApiConfig {
  const PlansApiConfig({
    required this.baseUrl,
    required this.apiKey,
  });

  static const managed = PlansApiConfig(
    baseUrl: 'https://kendyhsabat.farahdent.com',
    apiKey: '5dbc599c5df27bf55b60fee31240a48424f109e0789571a8e14e4068c17dbbe2',
  );

  final String baseUrl;
  final String apiKey;

  bool get isConfigured {
    final url = baseUrl.trim();
    final key = apiKey.trim();
    return url.isNotEmpty && key.isNotEmpty;
  }

  Uri resolve(String path, [Map<String, String>? query]) {
    final normalizedBase = baseUrl.trim().replaceAll(RegExp(r'/+$'), '');
    final normalizedPath = path.startsWith('/') ? path : '/$path';
    return Uri.parse('$normalizedBase$normalizedPath').replace(queryParameters: query);
  }
}
