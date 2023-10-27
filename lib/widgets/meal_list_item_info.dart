import 'package:flutter/material.dart';

class MealItemInfo extends StatelessWidget {
  const MealItemInfo({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 5),
        Text(label,
            style: Theme.of(context).textTheme.bodyLarge,
            softWrap: true,
            overflow: TextOverflow.fade,
            maxLines: 1,
            textAlign: TextAlign.center),
      ],
    );
  }
}
