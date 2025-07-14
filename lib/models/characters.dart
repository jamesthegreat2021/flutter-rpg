import 'package:cloud_firestore/cloud_firestore.dart';
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
//this method can be called to any character instance
//remember in dart the object is managed by dart
//and it is being passed automatically as a reference
Map<String, dynamic> toFirestore(){
  return {
    'name': name,
    'slogan': slogan,
    'isFav': _isFav,
    'vocation': vocation.toString(),
    'skills': skills.map((s)=> s.id).toList(), 
    'stats': statsAsMap, 
    'points': points, 
  };
}


//characrer from firestore
factory Character.fromFirestore(
  DocumentSnapshot<Map<String,dynamic>> snapshot,
  SnapshotOptions? options,
)
{
  //get data from the snapshot
  final data = snapshot.data()!; 

  //making the character instance
  Character character = Character(
     name: data['name'],
     slogan: data['slogan'],
     id: snapshot.id,
     vocation: Vocation.values.firstWhere((v)=> v.toString() == data['vocation'])
); 
   //updating the skills

  for (String id in data['skills'])
  {
    Skill skill = allSkills.firstWhere((element) => element.id == id );
    character.updateSkill(skill); 

  }
  //the last thing that is the set is fav 

  if (data['isFav'] == true) {
    character.toggleIsFav();
  }

  //setter to set the stats and points to the newly created object indeed
  character.setStats(points: data['points'], stats: data['stats']); 


return character;

}

}