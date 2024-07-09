import 'package:crm_django/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/login.dart';
import '../components.dart';
import 'create.dart';

class read extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              navigateAndFinish(context, create());
            }, child: Text('Create new')),
            ElevatedButton(onPressed: (){
              navigateAndFinish(context, login());
            }, child: Text('logout')),
            Consumer<Prov>(
              builder: (context,prov,child){
                return Expanded(
                  child: ListView.builder(
                      itemCount: prov.people.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                              children: [
                              Card(
                                margin: EdgeInsets.all(30),
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text(prov.people[index].id.toString(),style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                              ),),
                                              width: 140,
                                            ),
                                            Text('akramo',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),),

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text('name:',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                              ),),
                                              width: 140,
                                            ),
                                            Text('akramo',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),),

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text('address:',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                              ),),
                                              width: 140,
                                            ),
                                            Text('akramo',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),),

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text('city:',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                              ),),
                                              width: 140,
                                            ),
                                            Text('akramo',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),),

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text('state:',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                              ),),
                                              width: 140,
                                            ),
                                            Text('akramo',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),),

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text('zipCode:',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                              ),),
                                              width: 140,
                                            ),
                                            Text('akramo',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),),

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    prov.deletePerson(prov.people[index]);
                                  },
                                  icon: Icon(Icons.remove_circle_outline,size: 40,color: Colors.red,)
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 165),
                                child: IconButton(
                                      onPressed: (){
                                        prov.updatePerson(prov.people[index]);
                                      },
                                      icon: Icon(Icons.update,size: 40,color: Colors.blue,)
                                  ),
                              )
                            ]
                          ),
                        );
                      }
                  ),
                );
              }

            )

          ],
        ),
      ),
    );
  }
}
