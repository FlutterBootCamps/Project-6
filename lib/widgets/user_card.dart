import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/user_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key, required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: 240,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: productBgColor, borderRadius: BorderRadius.circular(40),),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(user.avatar,
                width: 60,
                height: 60,
                fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null){
                    return child;
                  }else {
                    return const Center(child: CircularProgressIndicator(color: blackColor,),);
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/default_profile.png");
                },
                ),
              ),
              const SizedBox(width: 16,),
              SizedBox(
                width: context.getWidth(context) * .64,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Text("Name: ${user.name}", style: const TextStyle(color: blackColor, fontFamily: workSansFont, fontSize: 18, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis), maxLines: 1,)),
                    const SizedBox(height: 8,),
                    Flexible(child: Text("ID: ${user.id}", style: const TextStyle(color: blackColor, fontFamily: workSansFont, fontSize: 16, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis), maxLines: 1,)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          Flexible(child: Text("Email: ${user.email}", style: const TextStyle(color: blackColor, fontFamily: workSansFont, fontSize: 14, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis), maxLines: 1,)),
          const SizedBox(height: 8,),
          Flexible(child: Text("Password: ${user.password}", style: const TextStyle(color: blackColor, fontFamily: workSansFont, fontSize: 14, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis), maxLines: 1,)),
          const SizedBox(height: 8,),
          Flexible(child: Text("Role: ${user.role}", style: const TextStyle(color: blackColor, fontFamily: workSansFont, fontSize: 14, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis), maxLines: 1,)),
        ],
      ),
    );
  }
}