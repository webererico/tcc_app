import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/constants/colors.dart';

class MenuDrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function() onPressed;

  const MenuDrawerTile({
    required this.icon,
    required this.title,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(color: isSelected ? kSecondaryColor : kPrimaryColor),
          ),
          trailing: FaIcon(
            icon,
            color: isSelected ? kSecondaryColor : kPrimaryColor,
          ),
          onTap: () => onPressed(),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

