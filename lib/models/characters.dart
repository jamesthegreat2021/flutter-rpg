import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
Character({
  required this.name, 
  required this.slogan, 
  required this.id,
  required this.vocation,
});

final Vocation vocation; 
final String name; 
final String slogan; 
final String  id;
final Set<Skill> skills = {};
bool _isFav = false;

//allows access to private properties, it is a return type function with bool expected to be returned
//accessed as a property indeed
bool get isFav => _isFav; 

void toggleIsFav(){
  _isFav = !_isFav;
}

void updateSkill(Skill skill){
  skills.clear(); 
  skills.add(skill);
}

//character to firestore
//recall the data needs to  be serialized to a certain format

Map<String, dynamic> toFirestore(){
  return {
    'name': name,
    'slogan': slogan,
    'isFav': _isFav,
    'vocation': vocation.toString(),
    'skills': skills.map((s)=>s.id).toList(), 
    'stats': statsAsMap, 
    'points': points
  };
}


}

