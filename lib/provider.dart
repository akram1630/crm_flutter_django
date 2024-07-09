
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
}