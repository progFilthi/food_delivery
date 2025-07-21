import 'package:flutter/material.dart';
import '../../cart_manager.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _showOngoingOrders = true;

  @override
  void initState() {
    super.initState();
    CartManager().addListener(_onCartChanged);
  }

  @override
  void dispose() {
    CartManager().removeListener(_onCartChanged);
    super.dispose();
  }

  void _onCartChanged() {
    setState(() {});
  }

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
          'Orders',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showOngoingOrders = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _showOngoingOrders
                              ? Colors.orange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'On-going orders',
                            style: TextStyle(
                              color: _showOngoingOrders
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showOngoingOrders = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: !_showOngoingOrders
                              ? Colors.orange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Completed orders',
                            style: TextStyle(
                              color: !_showOngoingOrders
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _showOngoingOrders
                ? _buildOngoingOrdersList(context)
                : _buildCompletedOrdersList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 2, // Highlight Orders tab
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle bottom navigation tap
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          }
          // Other tabs are placeholders for now
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildOngoingOrdersList(BuildContext context) {
    final cartItems = CartManager().items;
    if (cartItems.isEmpty) {
      return const Center(child: Text('No ongoing orders.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildOrderCard(
            item.vendor,
            'Estimated delivery time: 05:42pm',
            'Today',
            'Order #${index + 1}',
            'Single',
            'Current status: Order is being prepared',
            image: item.image,
            itemName: item.name,
            quantity: item.quantity,
            price: item.price,
          ),
        );
      },
    );
  }

  Widget _buildCompletedOrdersList() {
    return const Center(child: Text('No completed orders yet.'));
  }

  Widget _buildOrderCard(
    String vendorName,
    String deliveryTime,
    String orderDate,
    String orderNumber,
    String orderType,
    String status, {
    String? image,
    String? itemName,
    int? quantity,
    double? price,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(image ?? 'assets/jollof.jpg'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendorName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (itemName != null)
                        Text(itemName, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Text(
                  orderNumber,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              deliveryTime,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              orderDate,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            if (quantity != null && price != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Qty: $quantity  |  £${(price * quantity).toStringAsFixed(2)}',
                ),
              ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: const TextStyle(fontSize: 14, color: Colors.orange),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    orderType,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
