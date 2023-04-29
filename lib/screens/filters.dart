import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch.dart';
import "package:meals/providers/filters_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          FilterSwitch(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
              title: "Gluten-free",
              subTitle: "Only include gluten-free meals"),
          FilterSwitch(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              },
              title: "Lactose-free",
              subTitle: "Only include lactose-free meals"),
          FilterSwitch(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
              title: "Vegetarian",
              subTitle: "Only include vegetarian meals"),
          FilterSwitch(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
              title: "Vegan",
              subTitle: "Only include vegan meals"),
        ],
      ),
    );
  }
}
