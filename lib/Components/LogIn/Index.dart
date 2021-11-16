import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:control_empleados/Components/LogIn/Metodos.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  LoginPageState_ createState() => LoginPageState_();
}

class LoginPageState_ extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _snackbar = SnackBar(content: Text('Ha ocurrido un error'));
  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool bandera = false;

  void initState() {
    username.text = ""; //innitail value of text field
    password.text = "";
    super.initState();
  }

  void Imprimir() {
    bandera = Autenticacion().Autenticar(username.text, password.text);
    print(bandera);
    if (bandera) {
      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/FondoInicio.png",
                fit: BoxFit.fill, width: double.infinity, height: 350),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
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
                                controller: username,
                                cursorColor: HexColor('#6C63FF'),
                                style: TextStyle(color: HexColor('#6C63FF')),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor('#6C63FF'), width: 4.5),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor('#6C63FF'), width: 4.5),
                                  ),
                                  labelStyle: TextStyle(
                                      color: HexColor('#6C63FF'), fontSize: 22),
                                  labelText: "Usuario",
                                  prefixIcon: Icon(Icons.account_circle,
                                      color: HexColor(
                                          '#6C63FF')), //icon at head of input
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              cursorColor: HexColor('#6C63FF'),
                              style: TextStyle(color: HexColor('#6C63FF')),
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor('#6C63FF'), width: 4.5),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor('#6C63FF'), width: 4.5),
                                  ),
                                  labelStyle: TextStyle(
                                      color: HexColor('#6C63FF'), fontSize: 22),
                                  labelText: "Contraseña",
                                  prefixIcon: Icon(Icons.lock,
                                      color: HexColor('#6C63FF'))),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.black,
                                  backgroundColor: HexColor('#6C63FF'),
                                  padding: EdgeInsets.all(20),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  minimumSize: Size(double.infinity, 50),
                                ),
                                onPressed: Imprimir,
                                child: Text(
                                  "Iniciar Sesión",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: HexColor("#FFFFFF"),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
            new Container(
                margin: const EdgeInsets.all(40),
                child:
                    new Container(child: Text('Power by Qubit Systems 2021'))),
          ],
        ),
      ),
    );
  }
}
