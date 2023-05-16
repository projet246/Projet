import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/BackEnd/PlayerProgress/player.dart';
import 'package:uuid/uuid.dart';
import '../../main.dart';


// Class pour vérifier l'utilisateur en cas d'inscription
class VerifyUserEmail extends StatefulWidget {
  const VerifyUserEmail({Key? key}) : super(key: key);
  @override
  State<VerifyUserEmail> createState() => _VerifyUserEmailState();
}

class _VerifyUserEmailState extends State<VerifyUserEmail> {
  late User user; // l'utilisateur qui vient d'essayer de s'enregistrer
  late Timer timer; // la minuterie utilisée pour vérifier si l'utilisateur a vérifié son e-mail dans un intervalle de temps donné
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!; // obtenir l'utilisateur à partir des données de firebase
    user.sendEmailVerification(); // envoi d'un e-mail de vérification à l'adresse e-mail de l'utilisateur
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      verifyUser(); // toutes les 3 secondes, l'apk vérifie si l'utilisateur a vérifié son e-mail ou non
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) { // le UI de la page du vérification
    return Container(
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
      ),
      child: const Center(
        child: Text(
          'Please Verify Your Email to proceed !',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Digital',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future verifyUser() async { // Fonction qui permet de verifier si le user a verifier son email
    Parent methodParent = Parent([], 0, const Uuid().v4().toString());
    try {
      User user = FirebaseAuth.instance.currentUser!; // on récuper le useer
      await user.reload();
      if (user.emailVerified) { // si le user a vérifer son email 
        timer.cancel(); // on arréte la  minuterie
        methodParent.createData(user.uid); // on crée de nouvelles données pour l'utilisateur 
        await navigatorKey.currentState!.pushReplacementNamed('/ChildSelector'); // Redirection vers la page '/ChildSelector' en remplaçant la route actuelle
      }
    } on FirebaseAuthException catch (e) { // si une erreur s'est produite, elle est imprimée sur le terminal
      print(e);
    }
  }
}
