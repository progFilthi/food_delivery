import 'package:flutter/material.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Order Status',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusStep(
              context,
              'Order accepted',
              'Vendor has accepted your order',
              '04:48pm',
              isCompleted: true,
            ),
            _buildStatusStep(
              context,
              'Preparing your order',
              'Order will be ready in 8 minutes',
              '',
              isCompleted: true,
            ),
            _buildStatusStep(
              context,
              'Order is ready',
              'Order will be ready in 8 minutes',
              '',
              isCompleted: false, // Assuming this is the current step
            ),
            _buildStatusStep(
              context,
              'Order is in transit',
              'Order will be ready in 8 minutes',
              '',
              isCompleted: false,
            ),
            _buildStatusStep(
              context,
              'Order has arrived',
              'Order will be ready in 8 minutes',
              '',
              isCompleted: false,
              isLast: true,
            ),
            const SizedBox(height: 32),
            const Text(
              'Pick up code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCodeBox('2'),
                _buildCodeBox('0'),
                _buildCodeBox('2'),
                _buildCodeBox('4'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStep(
      BuildContext context, String title, String subtitle, String time, {bool isCompleted = false, bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isCompleted ? Colors.orange : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey[300],
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isCompleted ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (time.isNotEmpty)
                      Text(
                        time,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                if (!isLast) const SizedBox(height: 24), // Spacing between steps
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildCodeBox(String code) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          code,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
