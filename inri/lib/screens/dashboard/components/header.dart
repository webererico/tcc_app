import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/constants/colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 1000,
      color: kAppBarBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  const Text(
                    'Temperature',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.temperatureLow,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '34 ºC',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Santa Maria, RS',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Card(
                color: kSecondaryColor,
                elevation: 0,
                margin: const EdgeInsets.all(8),
                child: Container(
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Inversor \n Status',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Icon(
                        Icons.error,
                        color: kError,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: kSecondaryColor,
                elevation: 0,
                margin: const EdgeInsets.all(8),
                child: Container(
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'PowerGrid \n Status',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Icon(
                        Icons.check_circle_sharp,
                        color: kSuccess,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
