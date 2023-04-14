import 'package:flutter/material.dart';
import 'package:random_user/features/users/presentation/widgets/info_row.dart';

class MainInfoCard extends StatelessWidget {
  final String name;
  final String nameF;
  final String nameL;
  final String gender;
  final String bDay;
  final String age;

  const MainInfoCard({
    super.key,
    required this.name,
    required this.nameF,
    required this.nameL,
    required this.gender,
    required this.bDay,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          RowInfo(
            title: 'Name',
            subTitle: name,
          ),
          RowInfo(
            title: 'First name',
            subTitle: nameF,
          ),
          RowInfo(
            title: 'Last name',
            subTitle: nameL,
          ),
          RowInfo(
            title: 'Gender',
            subTitle: gender,
          ),
          RowInfo(
            title: 'Date of birth',
            subTitle: bDay,
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