import 'package:flutter/material.dart';
import '../services/report_service.dart';
import '../models/drink_type.dart';

class ReportsTab extends StatefulWidget {
  final ReportService reportService;
  const ReportsTab({Key? key, required this.reportService}) : super(key: key);

  @override
  _ReportsTabState createState() => _ReportsTabState();
}

class _ReportsTabState extends State<ReportsTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<DrinkType, int>>(
      future: widget.reportService.topSellingByDrink(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        final counts = snapshot.data!;
        return Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Top-selling drinks:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              ...counts.entries.map((e) => Text('${e.key.label}: ${e.value}')).toList(),
              SizedBox(height: 16),
              FutureBuilder<int>(
                future: widget.reportService.totalServed(),
                builder: (ctx, snap2) {
                  if (!snap2.hasData) return Container();
                  return Text('Total served: ${snap2.data}', style: TextStyle(fontSize: 16));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
