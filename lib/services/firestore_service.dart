import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/characters.dart';

class FirestoreService {
  //the static method because it can be accessed directly without instantiating the class

  //static lasses and methods arent accessed from the class itself instead they are accessed from the instances

  static final ref = FirebaseFirestore.instance
  .collection('characters')
  .withConverter(
    fromFirestore: Character.fromFirestore,  
    toFirestore: (Character c, _) => c.toFirestore(),
    );
  

  //add a new character
  static Future<void> addCharacter(Character character) async{
    await ref.doc(character.id).set(character);
  }

  //query data from the database
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

  //updating the character even after being  created
  static Future<void> updateCharacter(Character character) async{
   await ref.doc(character.id).update({
    'stats': character.statsAsMap, 
    'points': character.points,
    'skills': character.skills.map((skill)=> skill.id).toList(),
    'isFav': character.isFav,
   });
  }


}