import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/traffic_screen.dart';
import 'screens/stock_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyWayHomeApp());
}

class MyWayHomeApp extends StatelessWidget {
  const MyWayHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // TODO: Provider 설정 추가
      ],
      child: MaterialApp(
        title: 'My Way Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TrafficScreen(),
    const StockScreen(),
  ];

  final List<NavigationDestination> _navDestinations = [
    const NavigationDestination(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    const NavigationDestination(
      icon: Icon(Icons.directions_bus),
      label: 'Traffic',
    ),
    const NavigationDestination(
      icon: Icon(Icons.trending_up),
      label: 'Stock',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Way Home'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // TODO: 로그인 기능 구현
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _screens,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'My Way Home',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ..._navDestinations.asMap().entries.map((entry) {
              int idx = entry.key;
              NavigationDestination dest = entry.value;
              return ListTile(
                leading: dest.icon,
                title: Text(dest.label),
                selected: _selectedIndex == idx,
                selectedTileColor: Colors.blue.withOpacity(0.1),
                onTap: () {
                  setState(() => _selectedIndex = idx);
                  _pageController.jumpToPage(idx);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() => _selectedIndex = index);
          _pageController.jumpToPage(index);
        },
        destinations: _navDestinations,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
