import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with SingleTickerProviderStateMixin {
  Duration _duration = Duration(minutes: 1);
  Duration _remainingTime = Duration(minutes: 1);
  Timer? _timer;
  bool _isRunning = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AnimationController _animationController;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    _animation = IntTween(begin: 0, end: 2).animate(_animationController);
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _remainingTime = _duration;
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -= Duration(seconds: 1);
        } else {
          _timer!.cancel();
          _isRunning = false;
          _playBellSound();
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _isRunning = false;
      _remainingTime = _duration;
    });
  }

  void _setDuration(Duration duration) {
    setState(() {
      _duration = duration;
      _remainingTime = duration;
    });
  }

  Future<void> _playBellSound() async {
    try {
      await _audioPlayer.play(AssetSource('timer_bell.wav'));
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_remainingTime.inMinutes.toString().padLeft(2, '0')}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _isRunning
                ? ElevatedButton(
              onPressed: _stopTimer,
              child: Text('Stop Timer'),
            )
                : ElevatedButton(
              onPressed: _startTimer,
              child: Text('Start Timer'),
            ),
            SizedBox(height: 20),
            _isRunning
                ? AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Image.asset(
                  'assets/bear${_animation.value + 1}.png',
                  height: 150,
                );
              },
            )
                : Column(
              children: [
                DurationPicker(
                  initialDuration: _duration,
                  onDurationChanged: _setDuration,
                ),
                SizedBox(height: 20),
                Text('Preset Times'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PresetButton(duration: Duration(minutes: 5), label: '5 min', onPressed: _setDuration),
                    PresetButton(duration: Duration(minutes: 10), label: '10 min', onPressed: _setDuration),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PresetButton(duration: Duration(minutes: 15), label: '15 min', onPressed: _setDuration),
                    PresetButton(duration: Duration(minutes: 20), label: '20 min', onPressed: _setDuration),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DurationPicker extends StatelessWidget {
  final Duration initialDuration;
  final ValueChanged<Duration> onDurationChanged;

  DurationPicker({required this.initialDuration, required this.onDurationChanged});

  void _openTimeInputDialog(BuildContext context, Duration initialDuration) {
    final TextEditingController _timeController = TextEditingController(
      text: '${initialDuration.inMinutes.toString().padLeft(2, '0')}:${(initialDuration.inSeconds % 60).toString().padLeft(2, '0')}',
    );
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter time (MM:SS)'),
          content: TextField(
            controller: _timeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter time in MM:SS"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final timeParts = _timeController.text.split(':');
                if (timeParts.length == 2) {
                  final minutes = int.tryParse(timeParts[0]) ?? 0;
                  final seconds = int.tryParse(timeParts[1]) ?? 0;
                  if (minutes >= 0 && seconds >= 0 && seconds < 60) {
                    onDurationChanged(Duration(minutes: minutes, seconds: seconds));
                  }
                }
                Navigator.pop(context);
              },
              child: Text('Set'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select Timer Duration',
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _openTimeInputDialog(context, initialDuration),
              child: NumberPicker(
                initialValue: initialDuration.inMinutes,
                minValue: 0,
                maxValue: 59,
                onChanged: (value) {
                  onDurationChanged(Duration(minutes: value, seconds: initialDuration.inSeconds % 60));
                },
              ),
            ),
            Text(':'),
            GestureDetector(
              onTap: () => _openTimeInputDialog(context, initialDuration),
              child: NumberPicker(
                initialValue: initialDuration.inSeconds % 60,
                minValue: 0,
                maxValue: 59,
                onChanged: (value) {
                  onDurationChanged(Duration(minutes: initialDuration.inMinutes, seconds: value));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NumberPicker extends StatelessWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;

  NumberPicker({
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_drop_up),
          onPressed: () {
            if (initialValue < maxValue) onChanged(initialValue + 1);
          },
        ),
        Text(
          initialValue.toString().padLeft(2, '0'),
          style: TextStyle(fontSize: 24),
        ),
        IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () {
            if (initialValue > minValue) onChanged(initialValue - 1);
          },
        ),
      ],
    );
  }
}

class PresetButton extends StatelessWidget {
  final Duration duration;
  final String label;
  final ValueChanged<Duration> onPressed;

  PresetButton({required this.duration, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(duration),
        child: Text(label),
      ),
    );
  }
}
