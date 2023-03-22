import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'screens/video_screensaver.dart';

void main() {
  runApp(HorecaPlusApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class HorecaPlusApp extends StatefulWidget {
  @override
  _HorecaPlusAppState createState() => _HorecaPlusAppState();
}

class _HorecaPlusAppState extends State<HorecaPlusApp> {
  Timer? _inactivityTimer;
  bool _isScreensaverActive = false;

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 30), _showScreensaver);
  }

  void _showScreensaver() {
    if (!_isScreensaverActive) {
      setState(() {
        _isScreensaverActive = true;
      });
    }
  }

  void _hideScreensaver() {
    if (_isScreensaverActive) {
      setState(() {
        _isScreensaverActive = false;
      });
      _resetInactivityTimer();
    }
  }

  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple HORECA',
      theme: ThemeData.dark(),
      home: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _resetInactivityTimer,
        onPanDown: (_) => _resetInactivityTimer(),
        child: Navigator(
          pages: [
            MaterialPage(child: HomeScreen()),
            if (_isScreensaverActive)
              MaterialPage(
                child: GestureDetector(
                  onTap: _hideScreensaver,
                  child: VideoScreensaver(
                    videoAssets: const [
                      'assets/videos/screensaver1.mp4',
                      'assets/videos/screensaver2.mp4',
                      'assets/videos/screensaver3.mp4',
                    ],
                  ),
                ),
              ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
