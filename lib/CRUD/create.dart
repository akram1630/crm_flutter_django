import 'package:crm_django/CRUD/read.dart';
import 'package:crm_django/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/person.dart';
import '../provider.dart';

class create extends StatelessWidget {
  const create({super.key});

  @override
  Widget build(BuildContext context) {
    print('reload create page');
    return  Scaffold(
      appBar: AppBar(
        title: Text('CREATE'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: (){
                    navigateAndFinish(context, read());
                  },
                  child: Text('return Home')
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: myTextForm(label: 'name',),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: myTextForm(label: 'address',),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: myTextForm(label: 'city',),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: myTextForm(label: 'state',),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: myTextForm(label: 'zipCode',),
              ),
              Consumer<Prov>(
                builder: (context,prov,child){
                  print('consumer create person');
                  return ElevatedButton(
                      onPressed: (){
                        prov.createPerson(
                            person(name: 'ramy',id: '2',address: 'beo',
                                city: 'lotfi',state: 'dz',zipCode: '33000'
                            )
                        );
                      },
                      child: Text('create')
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
