
import 'package:crm_django/CRUD/read.dart';
import 'package:crm_django/components.dart';
import 'package:crm_django/dio.dart';
import 'package:flutter/material.dart';

import 'models/person.dart';

class Prov extends ChangeNotifier{
  List<person> _people = [
    person(name: 'akram',id: '1',address: 'beo',
    city: 'lotfi',state: 'dz',zipCode: '33000'
    )
  ];
  int ? _count ;
  List<person> get people{
    return _people ;
  }
  void createPerson(person p){
    _people.add(p);
    notifyListeners();
  }
  void deletePerson(person p){
    _people.remove(p);
    notifyListeners();
  }
  void updatePerson(person p) {
    for (int i = 0; i < _people.length; i++) {
      if (_people[i].id == p.id) {
        _people[i].id = '50';
        break;
      }
    }
    notifyListeners();
  }

  void userLogin ({
    required String email ,
    required String password ,
    BuildContext ? context
  }){
    //emit(shopLoginLoadingStates()); // to scroll for 2 second with consitionalBuilder help
    dioHelper.postDataForShopApp(
        url: LOGIN ,
        data: {
          'email' : email ,
          'password' : password
        }
    ).then((value){
      print(value.data);
      if(context != null)
        navigateAndFinish(context, read());
      notifyListeners();
    }).catchError((error){
      print('----\n${error.toString()}--\n');
    });
  }

}