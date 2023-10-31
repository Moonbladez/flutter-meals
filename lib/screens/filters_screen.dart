import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/tabs.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          if (identifier == "meals") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const TabsScreen(),
            ));
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      body: Column(
        children: [
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 20,
            ),
            onChanged: (value) {
              setState(() {
                _isGlutenFree = value;
              });
            },
            subtitle: Text(
              "Only include gluten-free meals",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            title: Text(
              "Gluten-Free",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            value: _isGlutenFree,
          ),
        ],
      ),
    );
  }
}
