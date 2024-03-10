import 'package:api_app/widgets/proudect_widget.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProudectPage extends StatelessWidget {
  const ProudectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 appBar: AppBar(
              backgroundColor: Colors.blueGrey[50],
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ],
          
            
            ),
      backgroundColor: Colors.blueGrey[50],
      body:  SingleChildScrollView(child: GridView.builder(
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
                  return const ProusectWidget();
                },
              ),),
    );
  }
}