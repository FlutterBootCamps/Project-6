import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget  {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xfff6f7f2),
      
      elevation: 0, 
      leading:
      
       const Padding(
         padding: EdgeInsets.only(top: 10),
    
       ),
     
    
      title: const Column(
        children: [
          SizedBox(height: 12),
          Text(
            'Deliver to Recipient in',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight:FontWeight.w400 
            ),
          ),
        
       
        ],
      ),
      
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2.0), 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              
              hintText: 'What are you looking for?',hintStyle: const TextStyle(color: Colors.teal), 
              prefixIcon: const Icon(Icons.search, color: Colors.teal), 
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0), 
              border: const OutlineInputBorder(
              
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Colors.grey[200], 
               constraints: const BoxConstraints( 
                  minHeight: 80, 
                  maxHeight: 80, 
              ),
            ),
          ),
        ),
      ),
    );
  }


}

