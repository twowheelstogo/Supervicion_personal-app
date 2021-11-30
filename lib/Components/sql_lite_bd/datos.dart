class Esquema {
  String Fecha;
  String ID_AIRTABLE;
  String ID_USUARIO;
  String Tipo;

  Esquema(
      {required this.Fecha,
      required this.ID_AIRTABLE,
      required this.ID_USUARIO,
      required this.Tipo});

  Map<String, dynamic> toMap() {
    return {
      'Fecha': Fecha,
      'ID_AIRTABLE': ID_AIRTABLE,
      'ID_USUARIO': ID_USUARIO,
      'Tipo': Tipo
    };
  }
}
