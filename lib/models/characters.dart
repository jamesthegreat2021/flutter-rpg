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



}

List<Character> characters = [
  Character(id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
   Character(id: '2', name: 'Jonny', vocation: Vocation.junkie, slogan: 'Light me up...'),
  Character(id: '3', name: 'Crimson', vocation: Vocation.raider, slogan: 'Fire in the hole!'),
  Character(id: '4', name: 'Shaun', vocation: Vocation.ninja, slogan: 'Alright then gang.'),
];