import 'package:flutter/material.dart';

class CustomPhoneField extends StatelessWidget {
  final String label;
  final String prefixText;

  const CustomPhoneField({
    super.key,
    required this.label,
    required this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'e.g. 788 123 456',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.flag, color: Colors.grey), // Placeholder for flag
                  const SizedBox(width: 4),
                  Text(prefixText, style: const TextStyle(color: Colors.black)),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  const SizedBox(width: 8),
                  Container(width: 1, height: 24, color: Colors.grey[400]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
