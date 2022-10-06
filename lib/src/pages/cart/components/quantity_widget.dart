import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          QuantityButton(icon: Icons.remove, onPressed: () {}),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          QuantityButton(icon: Icons.add, onPressed: () {}),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const QuantityButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 25,
        width: 25,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 12,
        ),
      ),
    );
  }
}
