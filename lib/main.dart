import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('PIG WEIGHT',style: TextStyle(
                  fontSize: 36.0, color: Colors.purple.shade200)),
                  Text('CALCULATOR',style: TextStyle(
                      fontSize: 36.0, color: Colors.purple.shade200)),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('asset/images/pig.png',width: 500.0,),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children:[
                            Text('Length'),
                            Text('(cm.)'),
                            TextField(
                              textAlign: TextAlign.center,
                              controller: _controller,
                              decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.7),
                                hintText: 'Enter Length',
                            )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children:[
                            Text('GIRTH'),
                            Text('(cm.)'),
                            TextField(
                                textAlign: TextAlign.center,
                                controller: _controller2,
                                decoration: InputDecoration(
                                  fillColor: Colors.white.withOpacity(0.7),
                                  hintText: 'Enter Length',
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 300.0
                ),
                child: ElevatedButton(
                  child: Text('Calculate'),
                   onPressed: () {
                var input = _controller.text;
                var input2 = _controller2.text;
                var answer = double.tryParse(input);
                var answer2 = double.tryParse(input2);
                if(answer==null||answer2==null){
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('ERROR'),
                    content: Text('ไม่ให้เว้นว่าง'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                    }
                    );
                }
                else{
                var weight = cal(answer/100,answer2/100);
                var lowweight = weight-3;
                var upweight =  weight+3;
                var lowp = lowweight*112.50;
                var upp = upweight*112.50;
                showDialog(context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Result'),
                    content: Text('Weight : $lowweight - $upweight Kg \n Price : $upp - $lowp baht'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                }
                );
                }
                },
              )

              )
            ],
          ),
        ),
    ),
  );

  }
  cal(double? answer, double? answer2 ) {
      return (answer2! * answer2 * answer! * 69.3);
    }
  }

