import '../models/traffic_model.dart';

class TrafficService {
  // 더미 데이터 제공
  List<TrafficInfo> getTrafficList() {
    return [
      TrafficInfo(
        id: '1',
        title: '판교역 경강선',
        departure: '13:45',
        arrival: '14:10',
        station: '판교역 → 강남역',
        status: '정상 운행',
        duration: 25,
      ),
      TrafficInfo(
        id: '2',
        title: '버스 360',
        departure: '13:50',
        arrival: '14:15',
        station: '판교역 ~ 테헤란로',
        status: '정상 운행',
        duration: 25,
      ),
      TrafficInfo(
        id: '3',
        title: '버스 9001',
        departure: '14:00',
        arrival: '14:25',
        station: '판교역 ~ 대강로',
        status: '정상 운행',
        duration: 25,
      ),
      TrafficInfo(
        id: '4',
        title: '지하철 신분당선',
        departure: '14:15',
        arrival: '14:35',
        station: '판교역 → 강남역',
        status: '약간 혼잡',
        duration: 20,
      ),
    ];
  }

  // API 연동 시 사용할 메서드 (추후 구현)
  Future<List<TrafficInfo>> fetchTrafficData(String apiKey) async {
    // TODO: 공공데이터포털 API 호출
    return getTrafficList();
  }
}
