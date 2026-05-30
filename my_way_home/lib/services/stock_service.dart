import '../models/stock_model.dart';

class StockService {
  // 더미 데이터 제공
  List<StockInfo> getStockList() {
    return [
      StockInfo(
        code: '005930',
        name: '삼성전자',
        currentPrice: 70000,
        change: 1500,
        changePercent: 2.19,
        openPrice: 68500,
        highPrice: 71200,
        lowPrice: 68200,
        volume: 12345678,
        lastUpdated: DateTime.now(),
      ),
      StockInfo(
        code: '069500',
        name: 'KODEX200',
        currentPrice: 40500,
        change: -300,
        changePercent: -0.73,
        openPrice: 40800,
        highPrice: 41200,
        lowPrice: 40300,
        volume: 87654321,
        lastUpdated: DateTime.now(),
      ),
      StockInfo(
        code: '000660',
        name: 'SK하이닉스',
        currentPrice: 180000,
        change: 2000,
        changePercent: 1.12,
        openPrice: 178000,
        highPrice: 182000,
        lowPrice: 177500,
        volume: 5555555,
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // 특정 종목 조회
  StockInfo? getStockByCode(String code) {
    final stocks = getStockList();
    try {
      return stocks.firstWhere((stock) => stock.code == code);
    } catch (e) {
      return null;
    }
  }

  // API 연동 시 사용할 메서드 (추후 구현)
  Future<List<StockInfo>> fetchStockData(List<String> codes) async {
    // TODO: 증권사/금융 API 호출
    return getStockList()
        .where((stock) => codes.contains(stock.code))
        .toList();
  }
}
