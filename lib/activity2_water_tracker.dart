
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: studentColor),
      home: const WaterTrackerPage(),
    );
  }
}

class WaterTrackerPage extends StatefulWidget {
  const WaterTrackerPage({super.key});

  @override
  State<WaterTrackerPage> createState() => _WaterTrackerPageState();
}

class _WaterTrackerPageState extends State<WaterTrackerPage> {
  int _glasses = 0;
  static const int _goal = 6;

  // Adds one glass and refreshes the screen.
  void _addGlass() {
    setState(() {
      if (_glasses < _goal) {
        _glasses++;
      }
    });
  }

  void _removeGlass() {
    setState(() {
      if (_glasses > 0) {
        _glasses--;
      }
    });
  }

  void _reset() {
    setState(() {
      _glasses = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build() called: $_glasses glasses');

    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool goalReached = _glasses >= _goal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 2 - $studentName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_drink,
              size: 96,
              color: goalReached ? Colors.green : colors.primary,
            ),
            const SizedBox(height: 16),
            Text(
              '$_glasses / $_goal glasses',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              goalReached
                  ? 'Awesome! You reached your daily water goal!'
                  : 'Keep drinking water!',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 240,
              child: LinearProgressIndicator(
                value: _glasses / _goal,
                minHeight: 12,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _glasses > 0 ? _removeGlass : null,
                  icon: const Icon(Icons.remove_circle_outline),
                  iconSize: 40,
                  tooltip: 'Remove one glass',
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _glasses < _goal ? _addGlass : null,
                  icon: const Icon(Icons.add),
                  label: const Text('Add glass'),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  iconSize: 32,
                  tooltip: 'Reset',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
