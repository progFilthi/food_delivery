import 'package:flutter/material.dart';

class VendorDetailsScreen extends StatelessWidget {
  const VendorDetailsScreen({super.key});

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
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/jollof.jpg', // Placeholder vendor image
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.broken_image)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'The Marseilles',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text('4.2 (209)'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Allergens and hygiene ratings',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterButton('All', true),
                        _buildFilterButton('Breakfast', false),
                        _buildFilterButton('Lunch', false),
                        _buildFilterButton('Dinner', false),
                        _buildFilterButton('Snacks', false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildMenuItem(
                    context,
                    'White rice and vegetable salad',
                    'Grilled chicken salad with eggs, tomato, cabbage, sweet peas',
                    '£20',
                    'Mildy Spicy',
                    'assets/jollof.jpg', // Placeholder image
                  ),
                  const SizedBox(height: 16),
                  _buildMenuItem(
                    context,
                    'Chin chin',
                    'Sweet deep fried chin chin',
                    '£10',
                    'Mid-level Spicy',
                    'assets/jollof.jpg',
                  ),
                  const SizedBox(height: 16),
                  _buildMenuItem(
                    context,
                    'Pasta Negroni',
                    'Grilled chicken salad with eggs, tomato, cabbage, sweet peas',
                    '£25',
                    'Spicy',
                    'assets/jollof.jpg', // Placeholder image
                  ),
                  const SizedBox(height: 16),
                  _buildMenuItem(
                    context,
                    'Party on the Grill',
                    'Grilled chicken salad with eggs, tomato, cabbage, sweet peas',
                    '£30',
                    'Spicy',
                    'assets/jollof.jpg', // Placeholder image
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle filter selection
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.orange : Colors.grey[200],
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String name, String description, String price, String spiciness, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/item_details');
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.local_fire_department, color: Colors.red, size: 16),
                        Text(spiciness),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
