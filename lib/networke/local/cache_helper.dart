import 'package:shared_preferences/shared_preferences.dart';
//example
// class CacheHelper
// {
//   static SharedPreferences? _preferences;
//
//   static Future  init() async
//   {
//     SharedPreferences _preferences= await SharedPreferences.getInstance();
//   }
//   void putData()
//   {
//
//   }
// }
class CacheHelper

{
  static SharedPreferences ? sharedPreferences;
  static init ()async
  {
    sharedPreferences= await SharedPreferences.getInstance();
  }
static  Future<bool?> putBoolean(
  {
  required String key,
    required bool value
}
      )async
  {
   return await  sharedPreferences?.setBool(key, value);
  }
static bool? getBoolean({required String key}){
    return sharedPreferences?.getBool(key);
}
}
