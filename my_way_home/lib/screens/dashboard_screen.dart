import 'package:flutter/material.dart';
import '../services/traffic_service.dart';
import '../services/stock_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _trafficService = TrafficService();
  final _stockService = StockService();

  @override
  Widget build(BuildContext context) {
    final trafficList = _trafficService.getTrafficList();
    final stockList = _stockService.getStockList();
    final nextTraffic = trafficList.isNotEmpty ? trafficList.first : null;
    final keyStocks = stockList.take(2).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // 다음 출발 교통편 카드
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '다음 출발 교통편',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  if (nextTraffic != null) ...[
                    Text(nextTraffic.title,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    Text('출발: ${nextTraffic.departure} | 도착: ${nextTraffic.arrival}'),
                    const SizedBox(height: 4),
                    Text('노선: ${nextTraffic.station}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ] else
                    const Text('교통편 정보 없음'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 핵심 종목 카드
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '핵심 종목 현재가',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ...keyStocks.map((stock) {
                    Color changeColor = stock.change >= 0 ? Colors.red : Colors.blue;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${stock.name}: ${stock.currentPrice.toInt()}원'),
                          Text(
                            '${stock.changePercent > 0 ? '+' : ''}${stock.changePercent.toStringAsFixed(2)}%',
                            style: TextStyle(color: changeColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Traffic 및 Stock 탭에서 더 자세한 정보를 확인하세요.',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
