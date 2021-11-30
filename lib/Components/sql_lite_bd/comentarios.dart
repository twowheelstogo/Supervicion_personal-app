class Esquema_Comentario {
  String Fecha;
  String ID_AIRTABLE;
  String ID_USUARIO;
  String Tipo;
  String Comentario;
  String Area;

  Esquema_Comentario(
      {required this.Fecha,
      required this.ID_AIRTABLE,
      required this.ID_USUARIO,
      required this.Tipo,
      required this.Comentario,
      required this.Area});

  Map<String, dynamic> toMap() {
    return {
      'Fecha': Fecha,
      'ID_AIRTABLE': ID_AIRTABLE,
      'ID_USUARIO': ID_USUARIO,
      'Tipo': Tipo,
      'Comentario': Comentario,
      'Area': Area
    };
  }
}
