import 'package:firebase_auth/firebase_auth.dart';
import 'package:sorttrash/BackEnd/AuthService/user_info.dart';
import 'package:sorttrash/player_box.dart';

import '../../main.dart';
//Une classe pour gérer le processus d'authentification des utilisateurs (Connexion, Inscription,)
class AuthService {
  bool error = false; //booléen pour garder une trace de l'erreur
  String errorMessage = ''; // cChaîne pour garder une trace du message d'erreur
  final FirebaseAuth _auth = FirebaseAuth.instance; // Création d'une instance de FirebaseAuth
  //Fonction qui permet de connecter en une maniére anonyme 
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromfirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
 // Fonction qui connecte l'utilisateur
  Future logIn(String email, String password) async {
  try {
    // Tentative de connexion avec l'email et le mot de passe fournis
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    // Récupération des données parent associées à l'utilisateur connecté d'apres Firebase
    onlineProgress.setParent(await onlineParent.fetchParentData(
        FirebaseAuth.instance.currentUser!.uid));

    // Vérification si l'utilisateur est déjà connecté ailleurs
    if (await onlineProgress.returnParent().isUserAlreadyLoggedIn()) {
      error = true;
      errorMessage = 'Vérifier plus tard';
    }
  } on FirebaseAuthException catch (e) {
    // Si une exception FirebaseAuthException est levée, l'erreur est traitée ici
    error = true; // Définition de la variable "error" à true pour indiquer qu'une erreur s'est produite
    errorMessage = e.message!; // Récupération du message d'erreur de l'exception FirebaseAuthException
  } on Exception catch (e) {
    // Si une exception générale est levée, l'erreur est traitée ici
    print(e.toString());
    error = true;
    errorMessage = e.toString();
  }

  if (!error) {
    // Si aucune erreur ne s'est produite, redirection vers la page '/ChildSelector'
    navigatorKey.currentState!.pushNamed('/ChildSelector');
  }
}

  
  Future registerWithEmail( String email, String password ) async { //Procédure qui prend l'email et le mot de passe de et crée un nouvel utilisateur si les données sont nouvelles dans la base de données
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email, password: password); //creation d'un utilisateur
    }
    on FirebaseAuthException catch (e) {
      print(e);
      error  = true;     // Définition de la variable "error" à true pour indiquer qu'une erreur s'est produite
      errorMessage = e.message!;     // Récupération du message d'erreur de l'exception FirebaseAuthException
    }
      // Vérification si aucune erreur ne s'est produite
    if ( !error  ) {
      navigatorKey.currentState!.pushReplacementNamed('/VerifyUserEmail');    // Si aucune erreur ne s'est produite, redirection vers la page '/VerifyUserEmail'
    }
  }
  // Fonction qui déconnecte l'utilisateur
  Future signOut() async {
    try {
      return await _auth.signOut(); 
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}
