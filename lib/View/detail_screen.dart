import 'package:covid_tracker/View/world_states.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget {
  String name;
  String image;
   int totalCases , totalDeaths , totalRecovered , active, critical, todayRecovered , test ;

   DetailScreen({
     required this.name,
     required this.image,
     required this.totalCases,
     required this.totalDeaths,
     required this.todayRecovered,
     required this.active,
     required this.critical,
     required this.totalRecovered,
     required this.test,
   });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .06
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
              child: Card(
                child: Column(
                  children: [
                    ReusableRow(title: 'Cases', value: widget.totalCases.toString()),
                    ReusableRow(title: 'Deaths', value: widget.totalDeaths.toString(),),
                    ReusableRow(title: 'Recovered', value:widget.todayRecovered.toString(),),
                    ReusableRow(title: 'Active', value: widget.active.toString(),),
                    ReusableRow(title: 'Critical', value: widget.critical.toString(),),
                    ReusableRow(title: 'Today Recovered', value: widget.todayRecovered.toString(),),
                  ],
                ),
              ),
            ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image) ,
              ),
            ],
          )
        ],
      ),
    ),
    );
  }
}
