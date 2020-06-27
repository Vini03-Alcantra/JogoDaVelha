import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  AssetImage cross = AssetImage("imagens/cross.png");
  AssetImage circle = AssetImage("imagens/circle.png");
  AssetImage edit = AssetImage("imagens/edit.png");
  
  int crossWin = 0;
  int circleWin = 0;
  int draw = 0;

  List<String> gameState;

  bool isCross = true;
  bool gameEnd = false;


  @override
  void initState(){
    super.initState();
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
    });
  }

  AssetImage getImage(String value){
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Jogo da Velha", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0
              ),
              itemCount: gameState.length,
              itemBuilder: (context, index){
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: MaterialButton(
                    onPressed: (){
                      playGame(index);
                    },
                    child: Image(
                      image: getImage(gameState[index])
                    ),
                  ),
                );
              }
            )
          ),
          SizedBox(
            height: 100.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Cross",
                        style: TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$crossWin',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold 
                        )
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Circle",
                        style: TextStyle(fontSize: 30, color: Colors.blueAccent, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$circleWin',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold 
                        )
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Draw",
                        style: TextStyle(fontSize: 30, color: Colors.orange, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$draw',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold 
                        )
                      )
                    ],
                  ),                  
                ],
              ),
            ),
          ), 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  color: Colors.blue,
                  minWidth: 50.0,
                  height: 50,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('New Game',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: (){
                    newGame();
                  }
                ),
                MaterialButton(
                  color: Colors.green,
                  minWidth: 50.0,
                  height: 50,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Play Again',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: (){
                    resetGame();
                  }
                ) 
              ],
            ),
          )
        ],
      ),
    );
  }

  playGame(int index){
    if (gameState[index] == 'empty') {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        }else{
          gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  checkWin(){
    if (!gameEnd) {
      if ((gameState[0]) != 'empty' && (gameState[0] == gameState[1]) && 
      (gameState[1] == gameState[2])) {
        setState(() {
          showWinner(gameState[0]);
          markPoints(gameState[0]);
          gameEnd = true;
        });
      }else if((gameState[3]) != 'empty' && (gameState[3] == gameState[4]) && 
      (gameState[4] == gameState[5])){
        setState(() {
          showWinner(gameState[3]);
          markPoints(gameState[3]);
          gameEnd = true;
        });
      }else if((gameState[6]) != 'empty' && (gameState[6] == gameState[7]) && 
      (gameState[7] == gameState[8])){
        setState(() {
          showWinner(gameState[6]);
          markPoints(gameState[6]);
          gameEnd = true;
        });
      }else if((gameState[0]) != 'empty' && (gameState[0] == gameState[3]) && 
      (gameState[3] == gameState[6])){
        setState(() {
          showWinner(gameState[0]);
          markPoints(gameState[0]);
          gameEnd = true;
        });
      }else if((gameState[1]) != 'empty' && (gameState[1] == gameState[4]) && 
      (gameState[4] == gameState[7])){
        setState(() {
          showWinner(gameState[1]);
          markPoints(gameState[1]);
          gameEnd = true;
        });
      }else if((gameState[2]) != 'empty' && (gameState[2] == gameState[5]) && 
      (gameState[5] == gameState[8])){
        setState(() {
          showWinner(gameState[2]);
          markPoints(gameState[2]);
          gameEnd = true;
        });
      }else if((gameState[0]) != 'empty' && (gameState[0] == gameState[4]) && 
      (gameState[4] == gameState[8])){
        setState(() {
          showWinner(gameState[0]);
          markPoints(gameState[0]);
          gameEnd = true;
        });
      }else if((gameState[2]) != 'empty' && (gameState[2] == gameState[4]) && 
      (gameState[4] == gameState[6])){
        showWinner(gameState[2]);
        markPoints(gameState[2]);
        setState(() {
          gameEnd = true;
        });
      }else if(!gameState.contains('empty')){
        setState(() {
          showWinner('Game Draw');
          markPoints('draw');
          gameEnd = true;
        });
      }
    }
  }

  resetGame(){
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      gameEnd = false;
    });
  }

  newGame(){
    resetGame();
    setState(() {
      crossWin = 0;
      circleWin = 0;
      draw = 0;
    });
  }

  markPoints(String mark){
    switch (mark) {
      case ('cross'):
        setState(() {
          crossWin += 1;
        });
        break;
        case ('circle'):
        setState(() {
          circleWin += 1;
        });
        break;
        case ('draw'):
        setState(() {
          draw += 1;
        });
        break;
    }
  }

  showWinner(String winner){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("$winner wins"),
      duration: Duration(seconds: 3)
      ),      
    );
  }

} 