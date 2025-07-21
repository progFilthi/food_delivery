import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on index
    switch (index) {
      case 0:
        // Home
        break;
      case 1:
        // Events (placeholder)
        break;
      case 2:
        Navigator.pushNamed(context, '/orders'); // Navigate to Orders
        break;
      case 3:
        // Schedule (placeholder)
        break;
      case 4:
        // Profile (placeholder)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivering to',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Row(
              children: const [
                Icon(Icons.location_on, size: 18, color: Colors.black),
                SizedBox(width: 4),
                Text(
                  'No 3 Guru Manaji street...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for restaurants, meals',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Vendors close to you',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/vendor_details');
              },
              child: _buildVendorCard(
                'Jollof hut',
                'Prices from £20',
                '4.2',
                '128',
                'FSA rating(5)',
                'Open',
                'assets/jollof.jpg', // Placeholder image
                isPrivate: false,
              ),
            ),
            const SizedBox(height: 16),
            _buildVendorCard(
              'The Marseilles',
              'Prices from £25',
              '4.5',
              '200',
              'FSA rating(4)',
              'Private vendor',
              'assets/jollof.jpg', // Placeholder image
              isPrivate: true,
            ),
            const SizedBox(height: 16),
            _buildVendorCard(
              'Pasta Palace',
              'Prices from £15',
              '3.9',
              '90',
              'FSA rating(3)',
              'Open',
              'assets/jollof.jpg', // Placeholder image
              isPrivate: false,
            ),
          ],
        ),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildVendorCard(
    String name,
    String priceRange,
    String rating,
    String reviews,
    String fsaRating,
    String status,
    String imageUrl, {
    bool isPrivate = false,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isPrivate
                            ? Colors.grey[300]
                            : Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: isPrivate ? Colors.black : Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(priceRange, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text('$rating ($reviews)'),
                    const SizedBox(width: 12),
                    const Icon(Icons.verified, color: Colors.green, size: 16),
                    Text(fsaRating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
