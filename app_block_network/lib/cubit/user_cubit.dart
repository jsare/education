import 'package:app_block_network/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../services/users_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UsersRepository usersRepository;

  UserCubit(this.usersRepository) : super(UserEmptyState());

  //Cubit работает не с Event, а с functions
  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());

      final List<User> _loadedUaserList = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUaserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}
