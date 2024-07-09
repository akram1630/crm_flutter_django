import 'package:dio/dio.dart';

const LOGIN = 'login' ; // from url postman
// const REGISTER = 'register' ;
// const HOME = 'home' ; // from url postman
// const GET_CATEGORIES = 'categories' ; // from url postman
// const FAVORITES = 'favorites';
// const GET_FAV = 'favorites';
// const PROFILE = 'profile';
// const UPDATE_PROFILE = 'update-profile';
// const SEARCH_PRODUCT = 'products/search';


class dioHelper{

  static Dio ? dioForShop;

  // it should be called in main():
  //the compiler in this class search the main() called init and run it auto
  static init(){
    dioForShop = Dio(
        BaseOptions(
            baseUrl: 'https://student.valuxapps.com/api/',
            receiveDataWhenStatusError: true,
            //news app we don't use headers here cuz this func is
            // called only one time (in main()) so there is no overriding
            // headers used only with ShopApp cuz of postman
            headers: {
              'Content-Type' : 'application/json',
              'lang' : 'en'
            }
        )
    );
  }


  // static Future<Response>  getDataForShopApp({ // future cuz the func includ .get() func
  //   required String url, //sub url
  //   Map<String, dynamic> ? query ,
  //   String lang = 'ar',
  //   String ? token
  // }) async
  // {
  //   // we use headers here to do override when calling func
  //   dioForShop!.options.headers = {  //override : dio.opt = Dio( base option : is done only when init but now like we add
  //     'lang' : lang,
  //     'Authorization' : token ?? '', // "If token is null, use an empty string ''
  //     'Content-Type' : 'application/json',
  //   };
  //   return  await dioForShop!.get(url , queryParameters: query);
  // }


  static Future<Response> postDataForShopApp({ // future cuz the func includ .get() func
    required String url,
    required Map<String, dynamic> data, // the original
    Map<String, dynamic> ? query,
    String lang = 'en',
    String  ? token
  }) async
  {
    // we use headers here to do override when calling func
    dioForShop!.options.headers = { // no overriding .headers == .add
      'lang' : lang,
      'Content-Type' : 'application/json',
      'Authorization' : token  ,
    };
    return  dioForShop!.post(
        url ,
        queryParameters: query ,
        data: data // the original
    );
  }
  //
  // static Future<Response> putDataForShopApp({ // future cuz the func includ .get() func
  //   required String url,
  //   required Map<String, dynamic> data, // like update
  //   Map<String, dynamic> ? query,
  //   String lang = 'en',
  //   String  ? token
  // }) async
  // {
  //   // we use headers here to do override when calling func
  //   dioForShop!.options.headers = { // no overriding .headers == .add
  //     'lang' : lang,
  //     'Content-Type' : 'application/json',
  //     'Authorization' : token  ,
  //   };
  //   return  dioForShop!.put(
  //       url ,
  //       queryParameters: query ,
  //       data: data
  //   );
  // }
}

void userLogin ({
  required String email ,
  required String password ,
}){
  //emit(shopLoginLoadingStates()); // to scroll for 2 second with consitionalBuilder help
  dioHelper.postDataForShopApp(
      url: LOGIN ,
      data: {
        'email' : email ,
        'password' : password
      }
  ).then((value ){
    //if (value.data != null) {
      print(value.data);
      // loginModel = shopAppLoginModel.fromJson(value.data!);
      // emit(shopLoginSeccessStates(loginModel!)); //go to bloc obvioser
    //}
    // else{
    //   // emit(shopLoginErrorStates("Invalid response data"));
    // }

  }).catchError((error){
    print('----\n${error.toString()}--\n');
    // emit(shopLoginErrorStates(error.toString()));
  });
}
void main(){
  dioHelper.init();
  userLogin(email: 'akram@gmail.com', password: '123456');
}