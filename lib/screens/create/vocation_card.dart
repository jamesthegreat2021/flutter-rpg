import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class VocationCard extends StatelessWidget {

  const VocationCard(
    {super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,
    
    });

    final Vocation vocation;
    final void Function(Vocation) onTap;
    final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: (){
         onTap(vocation);
         },
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              //vocation image
              Image.asset('assets/img/vocations/${vocation.image}',
              width: 80,
              //color blend mode does the magic
              colorBlendMode: BlendMode.color,
              color: !selected ? Colors.black.withOpacity(0.8) : Colors.transparent,
              ),
      
              const SizedBox(width: 10,), 
      
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    StyledHeading(vocation.title),
                    StyledText(vocation.description)
                  ],
                ),
              ),
            ],),
        ),
      ),
    ); 
  }
}