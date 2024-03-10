import 'package:api_app/view/deteailes_page.dart';
import 'package:api_app/view/proudect_page.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
class ProusectWidget extends StatelessWidget {
  const ProusectWidget({
    super.key,
    //  required this.product,
  });
// final AllProduct product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child:   DeteailesPage (productName: 'Classic Grey Hooded Sweatshirt',
      productDescription: "Elevate your casual wear with our Classic Grey Hooded Sweatshirt. Made from a soft cotton blend, this hoodie features a front kangaroo pocket, an adjustable drawstring hood, and ribbed cuffs for a snug fit. Perfect for those chilly evenings or lazy weekends, it pairs effortlessly with your favorite jeans or joggers.",
      productPrice: 90,
       productImageUrls: [

     "https://i.imgur.com/R2PN9Wq.jpeg",
            "https://i.imgur.com/IvxMPFr.jpeg",
            "https://i.imgur.com/7eW9nXP.jpeg"
      ],
    
          ),
                ),
              );
       
      },
      child: Container(
        height: 200,
       
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.blueGrey[800]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
              Container(
                 height: 170,
        width: 200,
        decoration: BoxDecoration(
             borderRadius: const BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
            color: Colors.blueGrey[400]),
            child: Card(child: Image.network("https://i.imgur.com/R2PN9Wq.jpeg",fit: BoxFit.fill,)),
              ),
             
               Expanded(child: const Text('Classic Grey Hooded Sweatshirt',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white),)),
               const Text('90 SAR',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),],),
      ),
    );
  }
}class catalogewidget extends StatelessWidget {
  const catalogewidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
             Navigator.push(
                    context,
                    PageTransition(
    type: PageTransitionType.rightToLeft,
    child:  const ProudectPage(),
                    ),
                  );
           
          },
          child: Container(
            height: 200,
           
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.blueGrey[800]),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                  Container(
                     height: 170,
            width: 200,
            decoration: BoxDecoration(
                 borderRadius: const BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                color: Colors.blueGrey[400]),
                child: Card(child: Image.network("https://i.imgur.com/R2PN9Wq.jpeg",fit: BoxFit.cover,)),
                  ),
                  const SizedBox(height: 5,),
                   const Text('New Category',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                 ],),
          ),
        );
  }
}