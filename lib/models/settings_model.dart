class UserSettings {
  final String? apiKey;
  final List<String> favoriteStations;
  final List<String> favoriteStocks;
  final String theme; // 'light' 또는 'dark'
  final bool autoRefresh;
  final int refreshInterval; // 초 단위

  UserSettings({
    this.apiKey,
    this.favoriteStations = const [],
    this.favoriteStocks = const ['005930', '069500'], // 기본값: 삼성전자, KODEX200
    this.theme = 'light',
    this.autoRefresh = true,
    this.refreshInterval = 30,
  });

  // JSON 변환
  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      apiKey: json['apiKey'],
      favoriteStations: List<String>.from(json['favoriteStations'] ?? []),
      favoriteStocks: List<String>.from(json['favoriteStocks'] ?? ['005930', '069500']),
      theme: json['theme'] ?? 'light',
      autoRefresh: json['autoRefresh'] ?? true,
      refreshInterval: json['refreshInterval'] ?? 30,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'favoriteStations': favoriteStations,
      'favoriteStocks': favoriteStocks,
      'theme': theme,
      'autoRefresh': autoRefresh,
      'refreshInterval': refreshInterval,
    };
  }

  // 복사 메서드 (변경사항 있을 때 사용)
  UserSettings copyWith({
    String? apiKey,
    List<String>? favoriteStations,
    List<String>? favoriteStocks,
    String? theme,
    bool? autoRefresh,
    int? refreshInterval,
  }) {
    return UserSettings(
      apiKey: apiKey ?? this.apiKey,
      favoriteStations: favoriteStations ?? this.favoriteStations,
      favoriteStocks: favoriteStocks ?? this.favoriteStocks,
      theme: theme ?? this.theme,
      autoRefresh: autoRefresh ?? this.autoRefresh,
      refreshInterval: refreshInterval ?? this.refreshInterval,
    );
  }

  @override
  String toString() =>
      'UserSettings(apiKey: ${apiKey?.isNotEmpty ?? false ? '*****' : 'null'}, '
      'stations: ${favoriteStations.length}, stocks: ${favoriteStocks.length})';
}
