import 'package:api_page_lab/models/categorise_model.dart';
import 'package:flutter/material.dart';

class CategotyRowWidget extends StatelessWidget {
  const CategotyRowWidget({
    super.key,
    required this.categorisModel
  });

  final CategorisModel categorisModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            // shape: BoxShape.rectangle,
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5)),
        child:  Row(
          children: [
            Text(
              categorisModel.name!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.edit_outlined)
          ],
        ),
      ),
    );
  }
}
