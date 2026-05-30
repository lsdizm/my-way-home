class StockInfo {
  final String code; // 종목 코드 (예: 005930)
  final String name; // 종목명 (예: 삼성전자)
  final double currentPrice; // 현재가
  final double change; // 변화액
  final double changePercent; // 변화율 (%)
  final double openPrice; // 시가
  final double highPrice; // 고가
  final double lowPrice; // 저가
  final int volume; // 거래량
  final DateTime? lastUpdated; // 마지막 업데이트 시간

  StockInfo({
    required this.code,
    required this.name,
    required this.currentPrice,
    required this.change,
    required this.changePercent,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    this.lastUpdated,
  });

  // 최근 7일 데이터 (차트용)
  List<double> get chartData {
    // TODO: 실제 API 연동 시 히스토리 데이터 반환
    return [
      currentPrice - change * 0.8,
      currentPrice - change * 0.5,
      currentPrice - change * 0.6,
      currentPrice - change * 0.2,
      currentPrice,
      currentPrice + change * 0.3,
      currentPrice + change * 0.1,
    ];
  }

  bool get isPositive => change >= 0;

  // JSON 변환
  factory StockInfo.fromJson(Map<String, dynamic> json) {
    return StockInfo(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      currentPrice: (json['currentPrice'] ?? 0).toDouble(),
      change: (json['change'] ?? 0).toDouble(),
      changePercent: (json['changePercent'] ?? 0).toDouble(),
      openPrice: (json['openPrice'] ?? 0).toDouble(),
      highPrice: (json['highPrice'] ?? 0).toDouble(),
      lowPrice: (json['lowPrice'] ?? 0).toDouble(),
      volume: json['volume'] ?? 0,
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.parse(json['lastUpdated'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'currentPrice': currentPrice,
      'change': change,
      'changePercent': changePercent,
      'openPrice': openPrice,
      'highPrice': highPrice,
      'lowPrice': lowPrice,
      'volume': volume,
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }

  @override
  String toString() =>
      'StockInfo(code: $code, name: $name, price: $currentPrice, change: $changePercent%)';
}
