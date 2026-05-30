class TrafficInfo {
  final String id;
  final String title; // 버스/지하철 번호 또는 노선명
  final String departure; // 출발 시간
  final String arrival; // 도착 시간
  final String station; // 노선 정보
  final String? status; // 운행 상태
  final int? duration; // 예상 소요 시간(분)

  TrafficInfo({
    required this.id,
    required this.title,
    required this.departure,
    required this.arrival,
    required this.station,
    this.status,
    this.duration,
  });

  // JSON 변환
  factory TrafficInfo.fromJson(Map<String, dynamic> json) {
    return TrafficInfo(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      departure: json['departure'] ?? '',
      arrival: json['arrival'] ?? '',
      station: json['station'] ?? '',
      status: json['status'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'departure': departure,
      'arrival': arrival,
      'station': station,
      'status': status,
      'duration': duration,
    };
  }

  @override
  String toString() =>
      'TrafficInfo(id: $id, title: $title, departure: $departure, arrival: $arrival)';
}
