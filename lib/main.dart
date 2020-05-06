import 'package:flutter/material.dart';

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final textsty = TextStyle(color: Colors.white);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primarySwatch: Colors.blue,
          ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> home = [Caculator(), Login()];
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("大頭菜計算機"),
              onTap: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            ListTile(
              title: Text("登入"),
              onTap: () {
                setState(() {
                  _index = 1;
                });
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("動森工具箱"),
      ),
      body: home[_index],
    );
  }
}

class Caculator extends StatefulWidget {
  @override
  _CaculatorState createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  List<bool> _firsttimebuy = [false, true];
  List<bool> _lasttimemodule = List.generate(5, (index) => false);
  List<TextEditingController> text =
      List.generate(2 * 6 + 1, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          shape: CircularNotchedRectangle(),
          child: Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.table_chart),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.terrain),
              onPressed: (){},
            )
          ], mainAxisAlignment: MainAxisAlignment.spaceAround),
        ),
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 92, 151, 1),
                Color.fromRGBO(54, 55, 149, 1),
                // Color.fromRGBO(36, 36, 62, 1)
              ],
            )),
          ),
          Container(
            height: double.infinity,
            // width: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "大頭菜計算機",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Container(),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("這是你第一次購買大頭菜嗎", style: textsty),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: ToggleButtons(
                            children: <Widget>[Text("否"), Text("是")],
                            constraints:
                                BoxConstraints(minHeight: 50, minWidth: 50),
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < _firsttimebuy.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    _firsttimebuy[buttonIndex] =
                                        !_firsttimebuy[buttonIndex];
                                  } else {
                                    _firsttimebuy[buttonIndex] = false;
                                  }
                                }
                              });
                            },
                            isSelected: _firsttimebuy,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "上次的大頭菜模型",
                          style: textsty,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: ToggleButtons(
                            children: <Widget>[
                              Text("不知道"),
                              Text("波型"),
                              Text("四期型"),
                              Text("三期型"),
                              Text("遞減型"),
                            ],
                            isSelected: _lasttimemodule,
                            constraints:
                                BoxConstraints(minHeight: 50, minWidth: 50),
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < _lasttimemodule.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    _lasttimemodule[buttonIndex] =
                                        !_lasttimemodule[buttonIndex];
                                  } else {
                                    _lasttimemodule[buttonIndex] = false;
                                  }
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  enterfield(text[0], "買入菜價"),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          enterfield(text[1], "周一早上"),
                          SizedBox(height: 10),
                          enterfield(text[2], "周一下午")
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          enterfield(text[3], "周二早上"),
                          SizedBox(height: 10),
                          enterfield(text[4], "周二下午")
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          enterfield(text[5], "周三早上"),
                          SizedBox(height: 10),
                          enterfield(text[6], "周三下午")
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          enterfield(text[7], "周四早上"),
                          SizedBox(height: 10),
                          enterfield(text[8], "周四下午")
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          enterfield(text[9], "周五早上"),
                          SizedBox(height: 10),
                          enterfield(text[10], "周五下午")
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          enterfield(text[11], "周六早上"),
                          SizedBox(height: 10),
                          enterfield(text[12], "周六下午")
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]));
  }

  Widget enterfield(TextEditingController controller, String text) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: textsty,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 75),
                  )),
              width: 150,
            ),
          )
        ],
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Login"),
    );
  }
}
