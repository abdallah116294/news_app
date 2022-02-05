// import 'package:bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/businesse/businesse_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';
import 'package:newsapp/networke/local/cache_helper.dart';
import 'package:newsapp/networke/remoot/dio_helper.dart';
// import 'package:newsapp/layout/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitialState());

  // static NewsCubit get(context)=>B.of(context);
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.settings), label: 'settings'),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  //  const SettingsScreen()
  ];

  void changeBottomNave(int index) {
    currentIndex = index;
 if (index==1) {
   getSports();
 }
 if(index==2)
   {
     getScience();
   }
    emit(NewsBottomNave());
  }
/*
    query: {
      'country': 'eg',
      'category ': 'business',
      'apiKey': 'bf2a0c8166cc46efa3b7b0ca4c696bdf'
    })
 */


  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'bf2a0c8166cc46efa3b7b0ca4c696bdf',
        }).then((value) {

      // print(value.data);
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState());
    });
  }
  /*
         //https://api.thenewsapi.com/v1/news/all?api_token=nODbbXdoGZNuuP8ULwMOH1qYC96EzZ8gPOqzrYx7
          //'https://newsapi.org/v2/top-headlines -G '//v2/top-headlines
            url: 'v2/top-headlines', query: {
          'country': 'eg',
          'category ': 'sports',
          //65f7f556ec76449fa7dc7c0069f040ca
          //2d67bec92e064231acee04166b6502c4
          //nODbbXdoGZNuuP8ULwMOH1qYC96EzZ8gPOqzrYx7
          //bf2a0c8166cc46efa3b7b0ca4c696bdf
          'apiKey': 'bf2a0c8166cc46efa3b7b0ca4c696bdf'
        })
   */
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length==0)
      {
        DioHelper.getData
          (
          //https://api.thenewsapi.com/v1/news/all?api_token=nODbbXdoGZNuuP8ULwMOH1qYC96EzZ8gPOqzrYx7
          //'https://newsapi.org/v2/top-headlines -G '//v2/top-headlines
            url: 'v2/top-headlines',  query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'bf2a0c8166cc46efa3b7b0ca4c696bdf',
        }).then((value) {

          // print(value.data);
          sports=value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetSportsErrorState());
        });

      }else{
      emit(NewsGetSportsSuccessState());
    }
  }
  /*
  query: {
          'country': 'eg',
          'category ': 'science',
          'apiKey': 'bf2a0c8166cc46efa3b7b0ca4c696bdf'
        }).
   */
  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if(science.length==0)
      {
        DioHelper.getData(url: 'v2/top-headlines',  query: {
          'country':'eg',
          'category':'science',
          'apiKey':'bf2a0c8166cc46efa3b7b0ca4c696bdf',
        }).then((value) {

          // print(value.data);
          science=value.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetScienceErrorState());
        });
      }else{
      emit(NewsGetScienceSuccessState());
    }

  }

  // bool isDark=false;
  // void changedAppMode({bool? fromShared} ){
  //   if (fromShared!=null ) {
  //     isDark=fromShared;
  //     emit(AppChangeModeState());
  //   }else {
  //     isDark=!isDark;
  //     CacheHelper.putBoolean(value:isDark,key: 'isDark' ).then((value) {
  //       emit(AppChangeModeState());
  //     } );
  //     emit(AppChangeModeState());
  //   }
  //
  // }
bool isDark=false;
  void ChangeAppMode({bool? fromShared})
  {
    if(fromShared!=null)
      {
        isDark=fromShared;
        emit(AppChangeModeState());
      }else
        {
          isDark=!isDark;
          CacheHelper.putBoolean(key: 'isDark',  value: isDark).then((value){
          });
        }
  }
  List<dynamic> search=[];
  void getSearch(String value)
  {
    emit(NewGetSearchLoadingState());
     search=[];
    DioHelper.getData(url: 'v2/everything',  query: {
      'q':value,
      'apiKey':'bf2a0c8166cc46efa3b7b0ca4c696bdf',
    }).then((value) {
      search=value.data['articles'];
      // print(search[0]['titles']);
      emit(NewsGetSearchSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewGetSearchErrorState(error));
    });
  }

}
//bf2a0c8166cc46efa3b7b0ca4c696bdf