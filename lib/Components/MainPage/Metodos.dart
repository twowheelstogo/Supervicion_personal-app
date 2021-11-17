import 'package:flutter/material.dart';

class Empleado with ChangeNotifier {
  final String Nombre;
  final String Agencia;
  final String urlFoto;
  final String Genero;

  Empleado(
      {required this.Nombre, required this.Agencia, required this.urlFoto,required this.Genero});
}

class Principal {
  List<Empleado> DataEmpleados() {
    List<Empleado> lista = [
      Empleado(Nombre: 'Iván Arango', Agencia: 'Miraflores', urlFoto: 'https://th.bing.com/th/id/R.6ab0d39f40424221268ceb87a6465f28?rik=ykZdXGHJa4qVHg&riu=http%3a%2f%2f2.bp.blogspot.com%2f-PGA8jn3WdMU%2fUc-IgtfXu9I%2fAAAAAAAAB80%2fjg9kc8H7WW0%2fs324%2fCristiano%2bRonaldo%2bProfile%2bAnd%2bBiography.jpg&ehk=RLf%2fcQtiHSQqs%2bj%2f8RTv%2fpvm4OIBSCVr7rBKU6wfTjY%3d&risl=&pid=ImgRaw&r=0',Genero: 'Masculino'),
      Empleado(Nombre: 'Andrés Arango', Agencia: 'Oakland mall', urlFoto: "https://th.bing.com/th/id/R.f40041f655bdf10e7869baa46121877c?rik=%2b7Dm6osNoELyNw&riu=http%3a%2f%2flaronda.es%2fwp-content%2fuploads%2f2018%2f10%2fimg_femartinez_20181010-125104_imagenes_md_otras_fuentes_captura-kcOG-U452531892714hYG-980x554%40MundoDeportivo-Web.jpg&ehk=bYDzXLk6%2bGFGmHewjoEP1g39sl%2fsHcCuc30HIVubcWY%3d&risl=&pid=ImgRaw&r=0",Genero: 'Masculino'),
      Empleado(Nombre: 'Andrea Arango', Agencia: 'Eskala Roosvelt', urlFoto: "https://i.pinimg.com/736x/c4/4a/c9/c44ac91076187a9a4bbb8e6499a13cb6--flapper-hairstyles-long-short-hair.jpg",Genero: 'Femenino'),
    ];
    return lista;
  }
}
