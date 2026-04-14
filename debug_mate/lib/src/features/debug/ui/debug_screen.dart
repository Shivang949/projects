import 'dart:async';

import 'package:debug_mate/debug_mate.dart';
import 'package:debug_mate/src/core/logger/log_model.dart';
import 'package:flutter/material.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  LogLevel? selectedLevel;
  late final Timer _timer;

  // final logModel = [
  //   LogModel(
  //       message: "App started",
  //       level: LogLevel.info,
  //       userId: "shiv",
  //       timeStamp: DateTime.now()),
  //   LogModel(
  //       message: "API failed",
  //       level: LogLevel.error,
  //       userId: "shiv",
  //       timeStamp: DateTime.now()),
  //   LogModel(
  //       message: "Button clicked",
  //       level: LogLevel.debug,
  //       userId: "shiv",
  //       timeStamp: DateTime.now()),
  // ];

  List<LogModel> _filterLogs() {
    final logs = DebugMateService.getLogs();
    if (selectedLevel == null) return logs;

    return logs.where((log) => log.level == selectedLevel).toList();
  }
  
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logs = _filterLogs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Screen'),
        actions: [
          IconButton(
              onPressed: () {
                DebugMateService.clearLogs();
                setState(() {});
              },
              icon: const Icon(Icons.delete)),
          _buildFilter(),
        ],
      ),
      body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          return _logItems(log);
        },
      ),
    );
  }

  Widget _logItems(LogModel model) {
    return ListTile(
      title: Text(model.message),
      subtitle: Text('${model.userId} : ${model.timeStamp}'),
      trailing: Text(
        model.level.name,
        style: TextStyle(
          color: _getColor(model.level),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getColor(LogLevel level) {
    switch (level) {
      case LogLevel.error:
        return Colors.red;
      case LogLevel.warning:
        return Colors.orange;
      case LogLevel.info:
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  Widget _buildFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButton<LogLevel?>(
            value: selectedLevel,
            hint: const Text("Filter"),
            items: [
              const DropdownMenuItem(
                value: null,
                child: Text("All"),
              ),
              ...LogLevel.values.map(
                (level) => DropdownMenuItem(
                  value: level,
                  child: Text(level.name),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedLevel = value;
              });
            },
          )),
    );
  }
}
