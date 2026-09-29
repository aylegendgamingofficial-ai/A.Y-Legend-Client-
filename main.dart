import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const AYLegendApp());

class AYLegendApp extends StatelessWidget {
  const AYLegendApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A.Y Legend Client',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF07080D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF147BFF),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, bool> features = {
    'Custom HUD': true,
    'PvP UI': true,
    'FPS Mode': false,
    'Low Graphics Mode': false,
    'Crosshair': true,
    'Keystrokes HUD': false,
    'A.Y Neon Theme': true,
  };

  Future<void> save(String key, bool value) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool(key, value);
  }

  void openMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF0C0E15),
      builder: (_) => StatefulBuilder(builder: (context, setSheet) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 45, height: 5,
                  decoration: BoxDecoration(color: Colors.white24,
                    borderRadius: BorderRadius.circular(5))),
                const SizedBox(height: 14),
                const Text('A.Y MOD MENU',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                const Text('Client features & UI controls',
                  style: TextStyle(color: Colors.white60)),
                const SizedBox(height: 12),
                ...features.entries.map((e) => SwitchListTile(
                  title: Text(e.key),
                  subtitle: Text(e.value ? 'Enabled' : 'Disabled'),
                  value: e.value,
                  onChanged: (v) {
                    setState(() => features[e.key] = v);
                    setSheet(() {});
                    save(e.key, v);
                  },
                )),
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A.Y LEGEND CLIENT',
          style: TextStyle(fontWeight: FontWeight.w900)),
        actions: [
          IconButton(icon: const Icon(Icons.tune), onPressed: openMenu)
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF101C42), Color(0xFF250B18)],
              ),
              border: Border.all(color: Colors.blueAccent.withOpacity(.45)),
              boxShadow: const [
                BoxShadow(color: Color(0x55207BFF), blurRadius: 25)
              ],
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('A.Y', style: TextStyle(fontSize: 54,
                  fontWeight: FontWeight.w900, letterSpacing: 2)),
                Text('LEGEND CLIENT', style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold, color: Colors.white70)),
                SizedBox(height: 8),
                Text('BEDROCK EDITION • MOBILE',
                  style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(
                'Minecraft launch integration can be connected here.'))),
            icon: const Icon(Icons.play_arrow),
            label: const Padding(
              padding: EdgeInsets.all(13),
              child: Text('LAUNCH MINECRAFT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: openMenu,
            icon: const Icon(Icons.dashboard_customize),
            label: const Text('OPEN MOD MENU'),
          ),
          const SizedBox(height: 22),
          const Text('ACTIVE FEATURES',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          ...features.entries.where((e) => e.value).map((e) => Card(
            child: ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(e.key),
              trailing: const Icon(Icons.chevron_right),
            ),
          )),
          const SizedBox(height: 12),
          const Text(
            'Note: This client uses Bedrock-compatible UI/resource features. '
            'It does not inject cheats or modify the Minecraft engine.',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
