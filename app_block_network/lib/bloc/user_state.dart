abstract class UserState {}

// Состояние, когда список пустой
class UserEmptyState extends UserState {}

// Состояние, когда данные подгружаются
class UserLoadingState extends UserState {}

// Состояние когда данные успещно загружены
class UserLoadedState extends UserState {
  List<dynamic> loadedUser;
  UserLoadedState({required this.loadedUser}) : assert(loadedUser != null);
}

//Состояние когда произошла ошибка

class UserErrorState extends UserState {}
