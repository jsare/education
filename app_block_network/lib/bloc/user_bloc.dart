import 'package:app_block_network/bloc/user_event.dart';
import 'package:app_block_network/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../services/users_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc(this.usersRepository) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: _loadedUserList));
      } catch (_) {
        emit(UserErrorState());
      }
    });
    on<UserClearEvenet>((event, emit) async {
      emit(UserEmptyState());
    });
  }
}
