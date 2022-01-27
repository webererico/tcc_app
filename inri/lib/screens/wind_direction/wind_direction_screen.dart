import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/wind_model.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class WindDirectionScreen extends StatelessWidget {
  static const routeName = '/wind-speed-direction-screen';

  const WindDirectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Wind Direction',
      body: Container(
          child: FutureBuilder<List<WindModel>>(
        future: Provider.of<WindProvider>(context, listen: false).fetchDirection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return const Center(
              child: Loader(),
            );
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Container(
                  padding: const EdgeInsetsDirectional.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 3.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Text(
                    '${snapshot.data!.last.average!}º',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Center(
                child: Icon(
                  Icons.arrow_downward,
                  size: 30,
                  color: kSecondaryColor,
                ),
              ),
              Material(
                shape: const CircleBorder(side: BorderSide.none),
                clipBehavior: Clip.antiAlias,
                shadowColor: kPrimaryColor,
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: Transform.rotate(
                    angle: snapshot.data!.last.average! * math.pi / 180 * -1,
                    child: Image.asset(
                      'assets/png/compass.png',
                      width: 250,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Last data: ${dateFormat.format(snapshot.data!.last.createdAt!)}'),
              ),
              const SizedBox(
                height: 20,
              ),
              const AllDataTile(dataType: DataType.windDirection)
            ],
          );
        },
      )),
    );
  }
}
