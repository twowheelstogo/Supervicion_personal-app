import 'package:flutter/material.dart';

class Comentarios {
  void Calificar(String tipo) {
    switch (tipo) {
      case 'Camisa':
        print('opcion 1');
        break;

      case 'Pantalon':
        print('opcion 2');
        break;

      case 'Zapatos':
        print('opcion 3');
        break;
    }
  }

  void Comentario(String Comentario, int Opcion) {
    if (Opcion == 1) {
      print(Comentario);
    }
  }

  void Calificacion(String Tipo, double total) {
    print('Total $total - Tipo $Tipo');
  }
}
