import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title,
      required this.subTitle});

  final bool value;
  final void Function(bool isChecked) onChanged;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      subtitle: Text(subTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
    );
  }
}
