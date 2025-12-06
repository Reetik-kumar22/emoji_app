import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {

var counter=0;

  List<String> emogis = ["😂","🥰","😡","😭","😉"];

  List<Color?> colors = [
    Colors.red[300],
    Colors.orange[300],
    Colors.yellow[300],
    Colors.green[300],
    Colors.blue[300],
  ];

List<BorderRadius> shapes = [
  BorderRadius.circular(0),
  BorderRadius.circular(25),
  BorderRadius.circular(100),
];

int colorIndex = 0;

  String emogi() => emogis[counter % emogis.length];
Color? color() => colors[colorIndex % colors.length];
  BorderRadius shape() => shapes[counter % shapes.length];

double fontSize = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("DICEE")),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          height: 600,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: shape(),
            color: color(),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text("COUNTER",style: TextStyle(fontSize:fontSize, fontWeight: FontWeight.bold),),
              ),

              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(emogi(),style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),),
              ),

              GestureDetector(
                onTap: (){
                  setState((){
                    counter++;
                    counter--;
                  });
                },
                  child: Text("$counter",style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),)),

              SizedBox(height: 20,),

              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState((){
                        counter++;
                        if (fontSize < 45) fontSize += 2;
                        colorIndex = (colorIndex + 1) % colors.length;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text("Increment",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                    ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  GestureDetector(
                    onTap: (){
                      setState((){
                        counter--;
                        if (fontSize > 15) fontSize -= 2;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text("Decrement",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                    ),
                  )
                ]
              ),

              SizedBox(height: 15,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          counter = 0;
                          colorIndex = 0;
                          fontSize = 30;
                        });
                      },
                      child:Text("Reset Button",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),

                    SizedBox(width: 10,),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          colorIndex = (colorIndex + 1) % colors.length;
                        });
                      },
                      child:Text("Change Color",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ]
              ),
            ],
          ),
        ),
      )
    );
  }
}
