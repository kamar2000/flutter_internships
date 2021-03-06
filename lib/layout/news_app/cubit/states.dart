abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

//Business
class NewsBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{

  final String error;

  NewsGetBusinessErrorState(this.error);
}

//Sports
class NewsSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{

  final String error;

  NewsGetSportsErrorState(this.error);
}


//Science
class NewsScienceLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{

  final String error;

  NewsGetScienceErrorState(this.error);
}
