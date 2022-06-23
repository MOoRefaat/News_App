abstract class NewsAppStates {}

class NewsIntialState extends NewsAppStates {}

class NewsBottomNavState extends NewsAppStates {}

class NewsLoadingState extends NewsAppStates {}

class NewsGetBusinessSucessState extends NewsAppStates {}

class NewsGetBusinessErrorState extends NewsAppStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetHealthSucessState extends NewsAppStates {}

class NewsGetHealthErrorState extends NewsAppStates {
  final String error;
  NewsGetHealthErrorState(this.error);
}

class NewsGetSportsSucessState extends NewsAppStates {}

class NewsGetSportsErrorState extends NewsAppStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetTechnologySucessState extends NewsAppStates {}

class NewsGetTechnologyErrorState extends NewsAppStates {
  final String error;
  NewsGetTechnologyErrorState(this.error);
}

class NewsChangeModeState extends NewsAppStates {}
