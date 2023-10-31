import 'package:flutter/material.dart';

class MealDetailList extends StatelessWidget {
  const MealDetailList({super.key, required this.items, required this.title});

  final List<String> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return ListTile(
                dense: true,
                title: Text(items[index]),
              );
            },
            itemCount: items.length,
          ),
        ],
      ),
    );
  }
}
