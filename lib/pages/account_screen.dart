import 'package:asignmet4/helper/colors.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        backgroundColor:dark,
        title: const Center(
            child: Text(
          "Profile",
          style: TextStyle(fontSize: 20,color: white,fontWeight: FontWeight.bold),
        )),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(150),
              ),
              clipBehavior: Clip.antiAlias,
              height: 120,
              width: 120,
              child: Image.asset(
                "image/avatar.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            //Sign in Button
            SizedBox(
              width: 200,
              height: 33,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor:brownOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    )),
                child: const Text(
                  "Edit Your Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 19),

            Container(
              color: const Color(0xfff8f8f8),
              width: 350,
              height: 90,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        
                        Text("  Saud",style: TextStyle(color: black,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Icon(
                          (Icons.edit),
                          color: brownOrange,
                          size: 17,
                        )
                      ],
                    ),
                    Divider(indent: 10, endIndent: 10),
                    Row(
                      children: [
                      
                        Text("  Saod@gmail.com",style: TextStyle(color: black,fontWeight: FontWeight.bold),),
                        Spacer(),
                         Icon(
                          (Icons.edit),
                          color: brownOrange,
                          size: 17,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            Container(
              color: const Color(0xfff8f8f8),
              width: 350,
              height: 130,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                      Icon(Icons.abc_outlined),
                        Text("  Social Responsibility"),
                        Spacer(),
                        Icon(
                          (Icons.arrow_forward_ios),
                          color: Color(0xffc3c3c3),
                          size: 17,
                        )
                      ],
                    ),
                    Divider(indent: 10, endIndent: 10),
                    Row(
                      children: [
                      Icon(Icons.abc_outlined),
                        Text("  FAQ"),
                        Spacer(),
                        Icon(
                          (Icons.arrow_forward_ios),
                          color: Color(0xffc3c3c3),
                          size: 17,
                        )
                      ],
                    ),
                    Divider(indent: 10, endIndent: 10),
                    Row(
                      children: [
                       Icon(Icons.abc_outlined),
                        Text("  Terms & Conditions"),
                        Spacer(),
                        Icon(
                          (Icons.arrow_forward_ios),
                          color: Color(0xffc3c3c3),
                          size: 17,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}