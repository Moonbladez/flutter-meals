import 'package:flutter/material.dart';
import 'package:flutter_meals_app/main.dart';

class DrawerListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onSelect;

  const DrawerListItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      splashColor: kThemeData.primaryContainer,
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      onTap: onSelect,
    );
  }
}
