import 'package:flutter/material.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/components/text_input.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/user_model.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/screens/login/login_screen.dart';
import 'package:inri/utils/snackbar_message.dart';
import 'package:inri/utils/validators/field_validators.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  ProfileScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  initData(context) async {
    await Provider.of<UserProvider>(context, listen: false).fetchProfile().then((value) {
      _nameController.text = value.name ?? '';
      _occupationController.text = value.occupation ?? '';
      _emailController.text = value.email ?? '';
      _courseController.text = value.course ?? '';
      _contactController.text = value.contact ?? '';
    });
  }

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
      body: FutureBuilder(
          future: initData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                margin: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextInput(
                          controller: _nameController,
                          hintText: 'Name',
                          label: 'Name',
                          validator: emptyField,
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _occupationController,
                          hintText: 'Occupation',
                          label: 'Occupation',
                          validator: emptyField,
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _courseController,
                          hintText: 'Course',
                          label: 'Course',
                          validator: emptyField,
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _contactController,
                          hintText: 'Contact',
                          label: 'Contact',
                          validator: emptyField,
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _emailController,
                          hintText: 'Email',
                          label: 'Email',
                          validator: validatorEmail,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: Loader());
            }
          }),
      floatingActionButton: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          if (userProvider.isLoading)
            return const Center(
              child: Loader(),
            );
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    userProvider
                        .updateProfile(
                          UserModel(
                            contact: _contactController.text,
                            name: _nameController.text,
                            course: _courseController.text,
                            email: _emailController.text,
                            occupation: _occupationController.text,
                          ),
                        )
                        .catchError((onError) => showSnackbar(context, onError.toString(), messageType.ERROR))
                        .then((value) => showSnackbar(context, 'Profiel Updated', messageType.SUCCESS));
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Update'),
              ),
            ],
          );
        },
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
                onTap: () => Provider.of<AuthProvider>(context, listen: false)
                    .delete()
                    .catchError(
                      (onError) => showSnackbar(context, onError.toString(), messageType.ERROR),
                    )
                    .then((value) {
                  showSnackbar(context, 'Profile Deleted!', messageType.SUCCESS);
                  return Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                }),
              ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: const Text('Cancel'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
