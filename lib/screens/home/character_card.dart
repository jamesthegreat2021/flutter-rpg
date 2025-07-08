import 'package:flutter/material.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {


  const CharacterCard(
    this.character,
    {super.key}
    );

    final String character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget> [
            Text(character),

            Expanded(
              child: const SizedBox(),
            ), 
            
            IconButton(
              onPressed: () {}, 
              icon: Icon(
                color: AppColors.textColor,
                Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}