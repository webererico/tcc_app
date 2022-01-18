import 'package:flutter/material.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/screens/change_password/change_password_screen.dart';
import 'package:inri/screens/login/login_screen.dart';
import 'package:inri/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

enum MenuOptions { profile, password, logout }

class PopUpMenu extends StatelessWidget {
  const PopUpMenu();

  @override
  Widget build(BuildContext context) {
    Color _iconColor = Theme.of(context).iconTheme.color!;
    return PopupMenuButton<MenuOptions>(
      icon: const Icon(Icons.person),
      itemBuilder: (context) => [
        _popUpMenuItem(
          icon: Icons.person,
          title: 'My Profile',
          value: MenuOptions.profile,
          color: _iconColor,
        ),
        _popUpMenuItem(
          icon: Icons.vpn_key_sharp,
          title: 'Change Password',
          value: MenuOptions.password,
          color: _iconColor,
        ),
        _popUpMenuItem(
          icon: Icons.exit_to_app,
          title: 'Logout',
          value: MenuOptions.logout,
          color: _iconColor,
        ),
      ],
      onSelected: (onSelected) {
        switch (onSelected) {
          case MenuOptions.profile:
            Navigator.of(context).pushNamed(ProfileScreen.routeName);
            break;
          case MenuOptions.password:
            Navigator.of(context).pushNamed(ChangePasswordScreen.routeNamed);
            break;
          case MenuOptions.logout:
            Provider.of<AuthProvider>(context, listen: false)
                .doLogout().catchError((value) => Navigator.of(context).pushReplacementNamed(LoginScreen.routeName))
                .then((value) => Navigator.of(context).pushReplacementNamed(LoginScreen.routeName));
            break;
          default:
            break;
        }
      },
    );
  }
}

PopupMenuItem<MenuOptions> _popUpMenuItem(
    {required MenuOptions value, required IconData icon, required String title, required Color color}) {
  return PopupMenuItem<MenuOptions>(
    value: value,
    child: Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(
          width: 8,
        ),
        Text(title),
      ],
    ),
  );
}
