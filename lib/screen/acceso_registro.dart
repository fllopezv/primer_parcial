import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:acceso_registro/utils/mycolors.dart';

class VistaAccesoRegistro extends StatefulWidget {
  @override
  _VistaAccesoRegistroState createState() => _VistaAccesoRegistroState();
}

class _VistaAccesoRegistroState extends State<VistaAccesoRegistro> {
  bool EsLaPantallaDeRegistro = true;
  bool EsHombre = true;
  bool EsRecuerdame = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/background.jpg"),
                  fit: BoxFit.fill
                )
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color.fromARGB(87, 207, 22, 22).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: EsLaPantallaDeRegistro ? "Bienvenido a la " : "Bienvenido de ",
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                        text: EsLaPantallaDeRegistro ? "UFPSO" : "Nuevo",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)
                        ]
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      EsLaPantallaDeRegistro ? "Registrate para continuar" : "Ingresa a continuacion",
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(true),
          Positioned(
            top: EsLaPantallaDeRegistro ? 200 : 230,
            child: Container(
              height: EsLaPantallaDeRegistro ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width-40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5),
                ]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            EsLaPantallaDeRegistro = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "ACCEDER", 
                              style: TextStyle(
                                  fontSize: 16, 
                                  fontWeight: FontWeight.bold,
                                  color: !EsLaPantallaDeRegistro? mycolors.activeColor : mycolors.textColor1),
                            ),
                            if(!EsLaPantallaDeRegistro) 
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            EsLaPantallaDeRegistro = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "REGISTRARSE", 
                              style: TextStyle(
                                  fontSize: 16, 
                                  fontWeight: FontWeight.bold,
                                  color: EsLaPantallaDeRegistro? mycolors.activeColor : mycolors.textColor1),
                            ),
                            if(EsLaPantallaDeRegistro)    
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 90,
                              color: Colors.black,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  if(EsLaPantallaDeRegistro) BuildSignupSection(),
                  if(!EsLaPantallaDeRegistro) BuildSigninSection()
                ],
              ),
            ),
          ),
          buildBottomHalfContainer(false),
          Positioned(
            top: MediaQuery.of(context).size.height-100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(EsLaPantallaDeRegistro ? "O registrate con:": "O inicia sesion con:", style: TextStyle(
                                  fontSize: 15),),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildTextButton(MaterialCommunityIcons.facebook, "Facebook", mycolors.facebookColor),
                      BuildTextButton(MaterialCommunityIcons.google_plus, "Google", mycolors.googleColor),
                    ],
                  ),
                )
              ]
            ),
          )
        ],
      ),
    );
  }

  Container BuildSigninSection() {
    return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                    buildTextField(
                      Icons.email_outlined, "Correo Electronico", false, true),
                    buildTextField(
                      MaterialCommunityIcons.lock_outline, "Contraseña", true, false),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: EsRecuerdame,
                                activeColor: mycolors.textColor2,
                                onChanged: (value) {
                                  setState(() {
                                    EsRecuerdame = !EsRecuerdame;
                                  });
                                },
                              ),
                              Text("Recordarme",
                              style: TextStyle(
                                fontSize: 15, color: mycolors.textColor1))
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Olvidaste tu contraseña?",
                            style: TextStyle(
                                fontSize: 15, color: mycolors.textColor1))
                            )
                        ],
                      )
                    ],
                  ),
                );
  }

  Container BuildSignupSection() {
    return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      buildTextField(
                        MaterialCommunityIcons.account_outline, "Nombre de Usuario", false, false),
                      buildTextField(
                        MaterialCommunityIcons.email_outline, "Correo Electronico", false, false),
                      buildTextField(
                        MaterialCommunityIcons.lock_outline, "Contraseña", false, false),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  EsHombre = true;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: EsHombre ? mycolors.textColor2 : Colors.transparent,
                                        border: Border.all(
                                            width: 1,
                                            color: EsHombre ? Colors.transparent : mycolors.textColor1),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Icon(
                                      MaterialCommunityIcons.account_outline,
                                      color: EsHombre ? Colors.white : mycolors.iconColor,
                                    ),
                                  ),
                                  Text(
                                    "Hombre",
                                    style: TextStyle(color: mycolors.textColor1),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  EsHombre = false;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: EsHombre ? Colors.transparent : mycolors.textColor2,
                                        border: Border.all(
                                            width: 1,
                                            color: EsHombre ? mycolors.textColor1 : Colors.transparent),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Icon(
                                      MaterialCommunityIcons.account_outline,
                                      color: EsHombre ? mycolors.iconColor: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Mujer",
                                    style: TextStyle(color: mycolors.textColor1),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(top: 15),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Al presionar 'enviar' usted acepta nuestros ",
                            style: TextStyle(color: mycolors.textColor2),
                            children: [
                              TextSpan(
                                text: "terminos y condiciones",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }

  TextButton BuildTextButton(IconData icon, String title, Color backgroundColor) {
    return TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      side: BorderSide(width: 1, color: Colors.grey),
                      minimumSize: Size(145,40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      primary: Colors.white,
                      backgroundColor: backgroundColor
                    ),
                    child: Row(
                      children: [
                        Icon(
                          icon,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          title,
                        )
                      ],
                    ),
                  );
  }

  Positioned buildBottomHalfContainer(bool showShadow) {
    return Positioned(
          top: EsLaPantallaDeRegistro ? 535 : 430,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              height: 90,
              width: 90,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if(showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
                ]
              ),
              child: !showShadow ? Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0,1)
                  )
                ]
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white,),
              ) : Center(),
            ),
          ),
        );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: mycolors.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: 
                BorderSide(color: mycolors.textColor1
            ),
            borderRadius: 
                BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: 
                BorderSide(color: mycolors.textColor1
            ),
            borderRadius: 
            BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey)
        ),
      ),
    );
  }
}