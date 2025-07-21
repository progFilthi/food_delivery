import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _vendors = [
    {
      'name': 'Jollof hut',
      'priceRange': 'Prices from £20',
      'rating': '4.2',
      'reviews': '128',
      'fsaRating': 'FSA rating(5)',
      'status': 'Open',
      'image': 'assets/jollof.jpg',
      'isPrivate': false,
    },
    {
      'name': 'The Marseilles',
      'priceRange': 'Prices from £25',
      'rating': '4.5',
      'reviews': '200',
      'fsaRating': 'FSA rating(4)',
      'status': 'Private vendor',
      'image': 'assets/jollof.jpg',
      'isPrivate': true,
    },
    {
      'name': 'Pasta Palace',
      'priceRange': 'Prices from £15',
      'rating': '3.9',
      'reviews': '90',
      'fsaRating': 'FSA rating(3)',
      'status': 'Open',
      'image': 'assets/jollof.jpg',
      'isPrivate': false,
    },
    {
      'name': 'Suya Spot',
      'priceRange': 'Prices from £18',
      'rating': '4.0',
      'reviews': '75',
      'fsaRating': 'FSA rating(4)',
      'status': 'Open',
      'image': 'assets/jollof.jpg',
      'isPrivate': false,
    },
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Jollof Rice',
      'price': 20.0,
      'image': 'assets/jollof.jpg',
      'vendor': 'Jollof hut',
    },
    {
      'name': 'Pasta Special',
      'price': 15.0,
      'image': 'assets/jollof.jpg',
      'vendor': 'Pasta Palace',
    },
    {
      'name': 'Suya Platter',
      'price': 18.0,
      'image': 'assets/jollof.jpg',
      'vendor': 'Suya Spot',
    },
    {
      'name': 'Marseilles Chicken',
      'price': 25.0,
      'image': 'assets/jollof.jpg',
      'vendor': 'The Marseilles',
    },
  ];

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
        Navigator.pushNamed(context, '/events');
        break;
      case 2:
        Navigator.pushNamed(context, '/orders');
        break;
      case 3:
        Navigator.pushNamed(context, '/schedule');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
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
            Column(
              children: _vendors
                  .map(
                    (vendor) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/vendor_details',
                            arguments: vendor,
                          );
                        },
                        child: _buildVendorCard(
                          vendor['name'],
                          vendor['priceRange'],
                          vendor['rating'],
                          vendor['reviews'],
                          vendor['fsaRating'],
                          vendor['status'],
                          vendor['image'],
                          isPrivate: vendor['isPrivate'],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 32),
            const Text(
              'Popular Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/item_details',
                        arguments: product,
                      );
                    },
                    child: _buildProductCard(product),
                  );
                },
              ),
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(
                imageUrl.isNotEmpty ? imageUrl : 'assets/jollof.jpg',
              ),
            ),
          ),
          Expanded(
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

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product['image'],
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              product['vendor'],
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              '£${product['price'].toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
