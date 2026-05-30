import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/stock_service.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final _stockService = StockService();

  @override
  Widget build(BuildContext context) {
    final stockList = _stockService.getStockList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stock',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            '핵심 종목 실시간 현재가',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          ...stockList.map((stock) => Column(
            children: [
              _StockCard(
                title: '${stock.name} (${stock.code})',
                price: '${stock.currentPrice.toInt()}',
                change: '${stock.change > 0 ? '+' : ''}${stock.change.toInt()}',
                changePercent: '${stock.changePercent > 0 ? '+' : ''}${stock.changePercent.toStringAsFixed(2)}%',
                isPositive: stock.change >= 0,
                high: stock.highPrice,
                low: stock.lowPrice,
                volume: stock.volume,
              ),
              const SizedBox(height: 16),
            ],
          )),
          const Text(
            '차트 (샘플)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 2),
                      const FlSpot(1, 1.5),
                      const FlSpot(2, 2.5),
                      const FlSpot(3, 2),
                      const FlSpot(4, 3),
                      const FlSpot(5, 2.5),
                      const FlSpot(6, 3.5),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StockCard extends StatefulWidget {
  final String title;
  final String price;
  final String change;
  final String changePercent;
  final bool isPositive;
  final double high;
  final double low;
  final int volume;

  const _StockCard({
    Key? key,
    required this.title,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.isPositive,
    required this.high,
    required this.low,
    required this.volume,
  }) : super(key: key);

  @override
  State<_StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<_StockCard> {
  @override
  Widget build(BuildContext context) {
    Color changeColor = widget.isPositive ? Colors.red : Colors.blue;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text('${widget.price}원'),
            const SizedBox(width: 12),
            Text(
              '${widget.change} (${widget.changePercent})',
              style: TextStyle(
                color: changeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: 8),
                Text('고가: ${widget.high.toInt()}원'),
                Text('저가: ${widget.low.toInt()}원'),
                const SizedBox(height: 8),
                Text('거래량: ${widget.volume.toStringAsFixed(0)}주'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
