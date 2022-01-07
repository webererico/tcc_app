import 'package:flutter/material.dart';
import 'package:inri/components/text_input.dart';
import 'package:inri/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  ProfileScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextInput(
                controller: _nameController,
                hintText: 'Name',
                label: 'Name',
              ),
              const SizedBox(height: 20),
              TextInput(
                controller: _occupationController,
                hintText: 'Occupation',
                label: 'Occupation',
              ),
              const SizedBox(height: 20),
              TextInput(
                controller: _emailController,
                hintText: 'Email',
                label: 'Email',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            heroTag: 'deleteAccount',
            onPressed: () => _deleteAccountMenu(context),
            backgroundColor: kError,
            icon: const Icon(Icons.delete),
            label: const Text('Delete Account'),
          ),
          const SizedBox(width: 10),
          FloatingActionButton.extended(
            heroTag: 'updateAccount',
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('Update'),
          ),
        ],
      ),
    );
  }
}

_deleteAccountMenu(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 120,
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Confirm'),
                onTap:  (){},
              ),
              ListTile(
                leading:const Icon(Icons.cancel),
                title: const Text('Cancel'),
                onTap:  () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
