import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:random_user/features/users/data/models/user_model.dart';
import 'package:random_user/features/users/domain/use_cases/user_use_case.dart';
import 'package:random_user/internal/helpers/catch_exceptions_helper.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UseUserCase useCase;
  UserBloc(this.useCase) : super(UserInitial()) {
    on<GetRandomUserEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        await useCase
            .getRandomUser()
            .then(
              (userModel) => emit(
                UserLoadedState(userModel: userModel),
              ),
            )
            .onError(
              (error, stackTrace) => emit(
                UserErrorState(
                  error: CatchException.convertException(error),
                ),
              ),
            );
      },
    );
  }
}
