import 'package:api_app/models/proudect_model.dart';
import 'package:api_app/view/proudect_page.dart';

import 'package:api_app/widgets/proudect_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//Future<AllProduct> postData;
  @override
  Widget build(BuildContext context) {
    return  Builder(
      builder: (context) {
        return Scaffold(
            backgroundColor: Colors.amber[50],
            appBar: AppBar(
              backgroundColor: Colors.amber[50],
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ],
          
            
            ),
        
        body:GridView.builder(
                padding: const EdgeInsets.only(left: 16, right: 16),
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                    childAspectRatio: 0.75),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return  catalogewidget();
                },
              ),
          // ),
        );
      }
    );
  }
}




  //    bottom: TabBar(
          //   padding: const EdgeInsets.only(left: 10, right: 10),
          //   dividerColor: const Color(0xffffffff), //Color(0xffb7a098),
          //   labelPadding: const EdgeInsets.all(1),
          //   indicatorColor: const Color(0xffb7a098),
          //   indicatorWeight: 3,
          //   indicatorSize: TabBarIndicatorSize.tab,
          //   labelColor: const Color.fromARGB(255, 0, 0, 0),
          //   unselectedLabelColor: const Color(0xff888888),
          //   overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          //   tabs: const [
          //     Tab(text: '1'),
          //     Tab(text: '2'),
          //     Tab(text: '3'),
          //     Tab(text: '4'),
          //      Tab(text: '5'),
          //     Tab(text: '6'),
          //     Tab(text: '7'),
          //     Tab(text: '8'),
          //      Tab(text: '9'),
          //     Tab(text: '10'),
          //     Tab(text: '11'),
          //     Tab(text: '12'),
          //     Tab(text: '13'),
          //     Tab(text: '14'),
          //     Tab(text: '15'),
          //     Tab(text: '16'),
          //      Tab(text: '17'),
          //     Tab(text: '18'),
          //     Tab(text: '19'),
          //     Tab(text: '20'),
          //      Tab(text: '21'),
          //     Tab(text: '22'),
            
          //   ],
          // ),

//         body: const TabBarView(children: [
         
// GrideWidget(),
// GrideWidget(),
// GrideWidget(),
// GrideWidget(),
         
        
        
//         ]),