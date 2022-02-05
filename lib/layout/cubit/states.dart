abstract class NewsStates{}
class NewInitialState extends NewsStates{}
class NewsBottomNave extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{

}
class NewsGetBusinessErrorState extends NewsStates{}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{

}
class NewsGetScienceErrorState extends NewsStates{}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{}
class AppChangeModeState extends NewsStates{}
class NewGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewGetSearchErrorState extends NewsStates{
  late final String error;
  NewGetSearchErrorState(this.error);

}