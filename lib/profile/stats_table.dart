import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {

  const StatsTable(this.character, {super.key});
  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: AppColors.secondaryColor,
            padding: EdgeInsets.all(8),
            child: Row(children: [
              Icon(Icons.star,
              color: widget.character.points > 0 ? Colors.yellow : Colors.grey,
              ), 
              const SizedBox(width: 20,), 
              const StyledText("Star Points Available"), 
              const Expanded(child: SizedBox(width: 20,)), 
              StyledHeading(widget.character.points.toString())
            ],),
          ),
          Table(
            children: widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                children: <Widget>[

                  //title stats
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8), 
                      //! ! is used to say that the value will not be null
                      child: StyledHeading(stat['title']!)
                    ),
                  ),
                 //stats values
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      //this is the case for the null safety
                      child: StyledHeading(stat['value']!),
                    ),
                  ), 
                 //an icon to increase stats
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward),
                      color: AppColors.textColor,
                      onPressed: (){},
                    ),
                  ),



                 // an icon to decrease stats
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_downward),
                      color: AppColors.textColor,
                      onPressed: (){},
                    ),
                  ),

                  

                ],
              );
            }).toList(),
          ),
        ],
      ),
      
      );
  }
}