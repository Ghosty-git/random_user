// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadedState extends UserState {
    final UserModel userModel;
  UserLoadedState({
    required this.userModel,
  });
}

class UserLoadingState extends UserState{}

class UserErrorState extends UserState {
  final CatchException error;
  UserErrorState({
    required this.error,
  });
}
