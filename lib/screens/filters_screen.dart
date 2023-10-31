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
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
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
          // TODO:move to single widget
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
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 20,
            ),
            onChanged: (value) {
              setState(() {
                _isLactoseFree = value;
              });
            },
            subtitle: Text(
              "Only include lactose-free meals",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            title: Text(
              "Lactose-Free",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            value: _isLactoseFree,
          ),
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 20,
            ),
            onChanged: (value) {
              setState(() {
                _isVegetarian = value;
              });
            },
            subtitle: Text(
              "Only include vegetarain meals",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            title: Text(
              "Vegatarian",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            value: _isVegetarian,
          ),
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 20,
            ),
            onChanged: (value) {
              setState(() {
                _isVegan = value;
              });
            },
            subtitle: Text(
              "Only include vegan meals",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            value: _isVegan,
          ),
        ],
      ),
    );
  }
}
