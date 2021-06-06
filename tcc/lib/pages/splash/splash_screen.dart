import 'package:flutter/material.dart';
import 'package:tcc/pages/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text('Criar conta')),
              TextButton(
                
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen())),
                child: Text('Entrar'),
              )
            ],
          )
        ],
      ),
    );
  }
}
