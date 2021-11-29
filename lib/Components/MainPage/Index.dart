import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Supervision_Empleados/Components/MainPage/Presentacion.dart';
import 'package:Supervision_Empleados/Components/MainPage/Cartas.dart';
import 'package:Supervision_Empleados/Components/MainPage/Metodos.dart';
import 'package:intl/intl.dart';
import 'package:Supervision_Empleados/Components/Constants/Index.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Empleado with ChangeNotifier {
  final String Nombre;
  final String Agencia;
  final String urlFoto;
  final String Genero;
  final String Estado;
  final DateTime Tiempo;
  final String Region;
  final String ID_EMPLEADO;

  Empleado(
      {required this.Nombre,
      required this.Agencia,
      required this.urlFoto,
      required this.Genero,
      required this.Estado,
      required this.Tiempo,
      required this.Region,
      required this.ID_EMPLEADO});
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  MainPage_ createState() {
    return new MainPage_();
  }
}

class MainPage_ extends State<MainPage> {
  TextEditingController UsuarioBusqueda = TextEditingController();
  TextEditingController RegionBusqueda = TextEditingController();

  List<Empleado> ListaEmpleados = [];
  String DPI = "";
  bool Loading = false;
  String ID_AIRTABLE = "";

  void initState() {
    UsuarioBusqueda.text = ""; //innitail value of text field
    RegionBusqueda.text = "";
    super.initState();
  }

  Future<String> getDPI() async {
    final prefs = await SharedPreferences.getInstance();
    String DPI = '';
    final res = prefs.getString('DPI');
    DPI = '$res';
    return DPI;
  }

  Future<String> getID() async {
    final prefs = await SharedPreferences.getInstance();
    String ID = '';
    final res = prefs.getString('IdAIRTABLE');
    ID = '$res';
    return ID;
  }

  Future<List<Empleado>> getList(String DPI) async {
    final lst = await Principal().DataEmpleados(DPI);
    List<Empleado> newlst = [];
    int contador = 0;
    if (lst.length > 0) {
      for (var i in lst) {
        print(i.Nombre);
        newlst.add(Empleado(
            Nombre: i.Nombre,
            Agencia: i.Agencia,
            urlFoto: i.urlFoto,
            Genero: i.Genero,
            Estado: i.Estado,
            Tiempo: i.Tiempo,
            Region: i.Region,
            ID_EMPLEADO: i.ID_EMPLEADO));
      }
      contador = contador + 1;
    }
    return newlst;
  }

  Future<bool> getBandera() async {
    print(!Loading);
    return !Loading;
  }

  MainPage_() {
    getBandera().then((val) => setState(() {
          Loading = val;
        }));

    getID().then((val) => setState(() {
          ID_AIRTABLE = val;
        }));

    getDPI().then((val) => setState(() {
          DPI = val;

          getList(val).then((val2) => setState(() {
                ListaEmpleados = val2;
                Loading = false;
              }));
        }));
  }

  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Presentacion(),
          Column(children: [
            Container(
                color: HexColor('#f16623'),
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.50,
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFieldDinamico__(
                            UsuarioBusqueda, 'Usuario', 'UsuarioB')),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFieldDinamico__(
                            RegionBusqueda, 'Macroregión', 'Region')),
                  ],
                ))
          ]),
          for (var i in Principal().ListaFiltrada(ListaEmpleados,
              UsuarioBusqueda.text.toString(), RegionBusqueda.text.toString()))
            Cartas(i.Nombre, i.Agencia, i.urlFoto, i.Genero, now, i.Estado,
                i.Tiempo, i.Region, i.ID_EMPLEADO, ID_AIRTABLE)
        ],
      )),
      inAsyncCall: Loading,
      // demo of some additional parameters
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(
        valueColor:
            new AlwaysStoppedAnimation<Color>(Color.fromRGBO(255, 255, 255, 1)),
      ),
    ));
  }

  Widget TextFieldDinamico__(
      TextEditingController controlador, String Label, String Llave) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                        onChanged: (text) => Principal()
                            .storage_(Llave, controlador.text.toString()),
                        controller: controlador,
                        cursorColor: HexColor("#C4C4C4"),
                        style: TextStyle(color: HexColor("#C4C4C4")),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor("#C4C4C4"), width: 4.5),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor("#C4C4C4"), width: 4.5),
                          ),
                          labelStyle: TextStyle(
                              color: HexColor("#FFFFFF"), fontSize: 22),
                          labelText: Label,
                          prefixIcon: Icon(Icons.manage_search_sharp,
                              color:
                                  HexColor("#FFFFFF")), //icon at head of input
                        )),
                  ),
                ],
              ))
            ],
          ),
        )
      ],
    );
  }
}
