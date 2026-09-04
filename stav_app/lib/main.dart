import 'package:flutter/material.dart';
import 'package:state_shell/state_shell.dart';
import 'package:state_shell/nebula_mist.dart';

App app = const App();

void main() {
  app.lightTheme = GradientHomeTheme.lightTheme;
  app.darkTheme = GradientHomeTheme.darkTheme;
  app.run(
    appRoot: () => MaterialApp(
      theme: appTheme(),
      home: const CosmicHomeApp()
          .animate(onComplete: (controller) => controller.repeat(reverse: true))
          .shimmer(
            duration: 14.seconds,
            color: app.currentTheme == "light"
                ? const Color.fromARGB(62, 218, 225, 240)
                : const Color.fromARGB(36, 0, 0, 0),
          ),
    ),
  );
  app.useSystemTheme();
}

class CosmicHomeApp extends StatefulWidget {
  const CosmicHomeApp({super.key});

  final List<String> _roomsList = const [
    "All Devices",
    "Living Room",
    "Bedroom",
    "Kitchen",
    "Yard",
  ];
  @override
  State<CosmicHomeApp> createState() => _CosmicHomeAppState();
}

class _CosmicHomeAppState extends State<CosmicHomeApp> {
  final _tabSelectorIndex = 0.toNotifier<int>();

  int _activeSceneIndex = 1;
  // "Welcome Back Scenario" active initially
  bool _acState = true;
  bool _lightState = true;
  bool _cameraState = true;
  bool _tvState = false;
  double _slider = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Calculate dynamic power attributes depending on switch levels
    double loadFactor = 0.15;
    int activeCount = 0;

    if (_acState) {
      loadFactor += 0.40;
      activeCount++;
    }
    if (_lightState) {
      loadFactor += 0.15;
      activeCount++;
    }
    if (_cameraState) {
      loadFactor += 0.10;
      activeCount++;
    }
    if (_tvState) {
      loadFactor += 0.20;
      activeCount++;
    }

    return Scaffold(
      backgroundColor: GradientHomeTheme.getBg(context),
      appBar: AppBar(
        backgroundColor: GradientHomeTheme.getCard(context),
        elevation: 12,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientHomeTheme.getPrimaryGradient(context),
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.blur_on_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cosmic Home",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight
                        .w900, // Replaced FontWeight.black with FontWeight.w900
                    color: GradientHomeTheme.getTextPrimary(context),
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  "Air Quality: Excellent",
                  style: TextStyle(
                    fontSize: 11,
                    color: GradientHomeTheme.getTextSecondary(context),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: app.toggleTheme,
            icon: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              color: GradientHomeTheme.getTextPrimary(context),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=80&q=80',
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18.0),
          children: [
            // Master System Overview Panel
            SystemOverviewCard(
              activeCount: activeCount,
              totalCount: 4,
              loadFactor: loadFactor,
            ),
            const SizedBox(height: 18),

            // Horizontal Room Selector Toolbar
            Observer(
              notifier: _tabSelectorIndex,
              builder: () => TabsSelector(
                rooms: widget._roomsList,
                selectedIndex: _tabSelectorIndex.data,
                onRoomSelected: (idx) {
                  _tabSelectorIndex.update((_) => idx);
                },
              ),
            ),

            const SizedBox(height: 18),

            const SizedBox(height: 10),

            // Responsive Controls Grid layout
            GridView.extent(
              maxCrossAxisExtent: 530,
              mainAxisExtent: 200,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.25,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                EnergyManagementCard(
                  totalPower: "${(loadFactor * 2.8).toStringAsFixed(2)} kW/h",
                  loadFactor: loadFactor,
                ),

                ToggleSmartDeviceCard(
                  name: "Climate Controller",
                  status: "Cooling to 21°C",
                  icon: Icons.ac_unit_rounded,
                  isSwitchedOn: _acState,
                  onToggle: (val) => setState(() => _acState = val),
                ),
                ToggleSmartDeviceCard(
                  name: "Smart Ambient Lights",
                  status: "Electric Amethyst Flow",
                  icon: Icons.lightbulb_outline,
                  isSwitchedOn: _lightState,
                  onToggle: (val) => setState(() => _lightState = val),
                ),
                ToggleSmartDeviceCard(
                  name: "Home Security Sentinel",
                  status: "Surveillance Active",
                  icon: Icons.security_rounded,
                  isSwitchedOn: _cameraState,
                  onToggle: (val) => setState(() => _cameraState = val),
                ),
                ToggleSmartDeviceCard(
                  name: "Media Station TV",
                  status: "Console Gaming Active",
                  icon: Icons.tv_rounded,
                  isSwitchedOn: _tvState,
                  onToggle: (val) => setState(() => _tvState = val),
                ),

                SliderSmartDeviceCard(
                  name: "Media Station TV",
                  status: "Console Gaming Active",
                  icon: Icons.tv_rounded,
                  isConnected: true,
                  max: 10,
                  min: 0,
                  value: _slider,
                  onToggle: (val) => setState(() => _slider = val),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Fast Automations Section Header
            Text(
              "QUICK RUN SCENARIOS",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: GradientHomeTheme.getTextSecondary(context),
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 10),

            SceneShortcutWidget(
              title: "Leave Home Automation (Secure Everything)",
              icon: Icons.exit_to_app_rounded,
              isActive: _activeSceneIndex == 0,
              onTap: () {
                setState(() {
                  _activeSceneIndex = 0;
                  _acState = false;
                  _lightState = false;
                  _tvState = false;
                  _cameraState = true;
                });
              },
            ),
            SceneShortcutWidget(
              title: "Welcome Back Scenario (Activate Comfort)",
              icon: Icons.home_rounded,
              isActive: _activeSceneIndex == 1,
              onTap: () {
                setState(() {
                  _activeSceneIndex = 1;
                  _acState = true;
                  _lightState = true;
                  _tvState = true;
                  _cameraState = true;
                });
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
