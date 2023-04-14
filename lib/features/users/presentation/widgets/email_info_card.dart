
import 'package:flutter/material.dart';
import 'package:random_user/features/users/presentation/widgets/info_row.dart';

class EmailInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String userName;
  final String phone;
  final String cell;
  final String registred;

  const EmailInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.userName,
    required this.phone,
    required this.cell,
    required this.registred,
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
            title: 'Email',
            subTitle: email,
          ),
          RowInfo(
            title: 'User Name',
            subTitle: userName,
          ),
          RowInfo(
            title: 'Phone',
            subTitle: phone,
          ),
          RowInfo(
            title: 'Cell',
            subTitle: cell,
          ),
          RowInfo(
            title: 'Registred',
            subTitle: registred,
          )
        ],
      ),
    );
  }
}

