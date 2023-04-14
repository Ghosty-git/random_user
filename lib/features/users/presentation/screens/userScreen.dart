import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user/features/users/presentation/logic/bloc/user_bloc.dart';
import 'package:random_user/features/users/presentation/widgets/email_info_card.dart';
import 'package:random_user/features/users/presentation/widgets/location_info_card.dart';
import 'package:random_user/features/users/presentation/widgets/main_info_card.dart';
import 'package:random_user/internal/dependencies/get%20_it.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UserBloc userbloc;

  @override
  void initState() {
    userbloc = getIt<UserBloc>();
    userbloc.add(GetRandomUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<UserBloc, UserState>(
          bloc: userbloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserLoadedState) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      state.userModel.results?.first.picture?.large ?? "",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.userModel.results?.first.name?.first ?? "",
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 30),
                  TabBar(
                    labelPadding: const EdgeInsets.only(bottom: 10),
                    indicatorColor: Colors.red[300],
                    tabs: const [
                      Text(
                        "Main Info",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "Location",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TabBarView(
                        children: [
                          MainInfoCard(
                          name:
                              state.userModel.results?.first.name?.title ?? '',
                          nameF:
                              state.userModel.results?.first.name?.first ?? '',
                          nameL:
                              state.userModel.results?.first.name?.last ?? '',
                          gender: state.userModel.results?.first.gender ?? '',
                          bDay:
                              '${state.userModel.results?.first.dob?.date ?? ''}',
                          age:
                              '${state.userModel.results?.first.dob?.age ?? ''}',
                        ),
                        LocationInfoCard(
                          phoneNumber:
                              state.userModel.results?.first.phone ?? '',
                          location: state
                                  .userModel.results?.first.location?.country ??
                              '',
                          city: state.userModel.results?.first.location?.city ??
                              '',
                          email: state.userModel.results?.first.email ?? '',
                          age:
                              '${state.userModel.results?.first.dob?.age ?? ''}',
                        ),
                        EmailInfoCard(
                          name:
                              state.userModel.results?.first.name?.title ?? '',
                          email: state.userModel.results?.first.email ?? '',
                          userName:
                              state.userModel.results?.first.login?.username ??
                                  '',
                          phone: state.userModel.results?.first.phone ?? '',
                          cell: state.userModel.results?.first.cell ?? '',
                          registred:
                              '${state.userModel.results?.first.registered?.date ?? ''}',
                        )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            print("stateeeeeeeeee ====== $state");
            return const Center();
          },
        ), 
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            userbloc.add(GetRandomUserEvent());
          },
        ),
      ),
    );
  }
}
