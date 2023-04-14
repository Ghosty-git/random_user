import 'package:flutter/material.dart';
import 'package:random_user/features/users/presentation/widgets/info_row.dart';

class LocationInfoCard extends StatelessWidget {
  final String phoneNumber;
  final String location;
  final String city;
  final String email;
  final String age;

  const LocationInfoCard({
    super.key,
    required this.age,
    required this.phoneNumber,
    required this.location,
    required this.city,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          RowInfo(
            title: 'Phone Number',
            subTitle: phoneNumber,
          ),
          RowInfo(
            title: 'Location',
            subTitle: location,
          ),
          RowInfo(
            title: 'City',
            subTitle: city,
          ),
          RowInfo(
            title: 'Email',
            subTitle: email,
          ),
          RowInfo(
            title: 'Age',
            subTitle: age,
          )
        ],
      ),
    );
  }
}