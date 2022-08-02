import 'dart:convert';
import 'package:json_serializable/json_serializable.dart';

class User {
  //atributos
  late String _email;
  late String _nome;

  //default constructor
  User();

  User.withParameter(String email, String nome);

  //constructor nomeado que recebera um json e vai criar um objeto com os dados dele
  User.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _nome = json['nome'];
  }

  //getters and setters
  String get getEmail => _email;

  set email(String email) => _email = email;

  get getNome => _nome;

  set nome(String nome) => _nome = nome;
}
