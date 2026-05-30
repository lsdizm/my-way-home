import 'package:flutter/material.dart';
import '../services/traffic_service.dart';

class TrafficScreen extends StatefulWidget {
  const TrafficScreen({Key? key}) : super(key: key);

  @override
  State<TrafficScreen> createState() => _TrafficScreenState();
}

class _TrafficScreenState extends State<TrafficScreen> {
  final _trafficService = TrafficService();

  @override
  Widget build(BuildContext context) {
    final trafficList = _trafficService.getTrafficList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Traffic',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            '판교역 경강선 및 주요 교통편',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          ...trafficList.map((traffic) => Column(
            children: [
              _TrafficCard(
                title: traffic.title,
                departure: traffic.departure,
                arrival: traffic.arrival,
                station: traffic.station,
                status: traffic.status ?? '정상',
                duration: traffic.duration,
              ),
              const SizedBox(height: 12),
            ],
          )),
        ],
      ),
    );
  }
}

class _TrafficCard extends StatefulWidget {
  final String title;
  final String departure;
  final String arrival;
  final String station;
  final String status;
  final int? duration;

  const _TrafficCard({
    Key? key,
    required this.title,
    required this.departure,
    required this.arrival,
    required this.station,
    required this.status,
    this.duration,
  }) : super(key: key);

  @override
  State<_TrafficCard> createState() => _TrafficCardState();
}

class _TrafficCardState extends State<_TrafficCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('출발: ${widget.departure} | 도착: ${widget.arrival}'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: 8),
                Text('노선: ${widget.station}'),
                const SizedBox(height: 8),
                Text('예상 시간: 약 ${widget.duration ?? 25}분'),
                const SizedBox(height: 8),
                Text('현재 상태: ${widget.status}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
