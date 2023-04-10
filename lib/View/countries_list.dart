import 'package:covid_tracker/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
     appBar: AppBar(
       elevation: 0,
       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
     ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: TextFormField(
                controller: searchController,
                decoration:  InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 22),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                  future: statesServices.countriesListApi(),
                  builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
                    if(!snapshot.hasData){
                       return ListView.builder(
                     itemCount: 4,
                     itemBuilder: (context,index)
                       {
                         return Shimmer.fromColors(
                           baseColor: Colors.grey.shade700,
                           highlightColor: Colors.grey.shade700,
                           child: Column(
                             children: [
                               ListTile(
                                 title: Container(
                                   height: 10, width: 89, color: Colors.white,),
                                 subtitle: Container(
                                   height: 10, width: 89, color: Colors.white,),
                                 leading: Container(
                                   height: 50, width: 50, color: Colors.white,),
                               ),
                             ],
                           ),
                         );
                       });
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                          String name = snapshot.data![index]['country'];
                          if(){

                          }else{

                          }else{

                            }
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(snapshot.data![index]['country']),
                              subtitle: Text(snapshot.data![index]['cases'].toString()),
                              leading: Image(
                                height:50,
                                width: 55,
                                image: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']
                                ),
                              ),
                                ),
                              ],
                            );
                          }
                      );
                    }

                  },
                ),
            ),
          ],
        ) ,
      ),
    );
  }
}
