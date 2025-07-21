import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  final List<Map<String, String>> _deliveries = const [
    {
      'vendor': 'Jollof Hut',
      'time': 'July 21, 2024 - 2:00 PM',
      'image':
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80',
    },
    {
      'vendor': 'Pasta Palace',
      'time': 'July 22, 2024 - 6:00 PM',
      'image':
          'https://images.unsplash.com/photo-1523987355523-c7b5b0723c6b?auto=format&fit=crop&w=400&q=80',
    },
    {
      'vendor': 'Suya Spot',
      'time': 'July 23, 2024 - 12:00 PM',
      'image':
          'https://images.unsplash.com/photo-1464306076886-debca5e8a6b0?auto=format&fit=crop&w=400&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 24),
          const Text(
            'Your Upcoming Deliveries',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ..._deliveries.map(
            (delivery) => Card(
              child: ListTile(
                leading: ClipOval(
                  child: Image.network(
                    delivery['image']!,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/jollof.jpg',
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(delivery['vendor']!),
                subtitle: Text(delivery['time']!),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
