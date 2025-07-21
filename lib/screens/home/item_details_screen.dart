import 'package:flutter/material.dart';
import '../../cart_manager.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.network(
            'https://placehold.co/600x350/ADD8E6/000000?text=White+Rice+Salad', // Placeholder item image
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 250,
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.broken_image)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'White rice and vegetable salad',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Grilled chicken salad with eggs, tomato, cabbage, sweet peas',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '£20 per portion',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.red,
                        size: 18,
                      ),
                      Text('Mildy Spicy'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNutritionInfo('Calories', '124k'),
                      _buildNutritionInfo('Carbs', '65g'),
                      _buildNutritionInfo('Fat', '80g'),
                      _buildNutritionInfo('Protein', '100g'),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: _decrementQuantity,
                      ),
                      Text(
                        '$_quantity',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _incrementQuantity,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add to tray logic
                      CartManager().addItem(
                        CartItem(
                          name: 'Sample Item',
                          quantity: _quantity,
                          price: 20.0,
                          vendor: 'Jollof Hut',
                          image: 'assets/jollof.jpg',
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Add £${(_quantity * 20).toStringAsFixed(0)}'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionInfo(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
