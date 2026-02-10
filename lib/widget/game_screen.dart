import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();

}

class _GameState extends State<Game>  {

  bool isPlayer1 = true;
  List<int> user1=[];
  List<int> user2=[];

  int user1Score = 0;
  int user2Score = 0;

  final List<List<int>> winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];

  bool checkWinner(List<int> user) {
    for (var combination in winningCombination){
      if(user.contains(combination[0]) && user.contains(combination[1]) && user.contains(combination[2])){
        return true;

      }

    }
    return false;
  }

  bool checkDraw(){
    return user1.length + user2.length == 9;

  }

  void showWinnerDialog(String message){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('Game Over'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed : () {
                  Navigator.of(context).pop();
                  clearText();
                },
                child: const Text('Play Again'),
              ),
            ],
          );
        }
    );
  }



  void  clearText(){
    setState(() {
      user1.clear();
      user2.clear();
      isPlayer1 = true;
    });
  }



  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game', style: TextStyle(color: Colors.white)),
        foregroundColor: Colors.red,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('XO GAME',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            SizedBox(height: 50,),


            Text('Results', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                children: [
                  Expanded(child: Text('User1 : $user1Score',textAlign: TextAlign.left,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                  Expanded(child: Text('User2 : $user2Score',textAlign: TextAlign.right,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),

            SizedBox(height: 10,),

            SizedBox(
              height: 300,
              width: 300,
              child: GridView.builder(
                itemCount: 9,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {

                  String symbol = '';

                  if (user1.contains(index)){
                    symbol='X';
                  }else if(user2.contains(index)){
                    symbol = 'O';
                  }
                  return GestureDetector(
                    onTap: () {
                      if(!user1.contains(index) && !user2.contains(index)){
                        setState(() {
                          if (isPlayer1){
                            user1.add(index);

                            if(checkWinner(user1)){
                              user1Score++;
                              showWinnerDialog("User1 (X) Wins");
                              return;
                            }
                          }else{
                            user2.add(index);
                            if(checkWinner(user2)){
                              user2Score++;
                              showWinnerDialog("User2 (O) Wins");
                              return;
                            }
                          }

                          if (checkDraw()) {
                            showWinnerDialog("Match Draw ");
                            return;
                          }


                          isPlayer1 = !isPlayer1;
                          }
                        );
                      }
                    },


                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),

                      child:Center(
                        child: Text(symbol, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                      ),
                    ),


                  );
                },
              ),




            ),

            SizedBox(height: 10,),

            ElevatedButton(
                onPressed: clearText,
                child: Text('Clear and play Again'),
            ),




          ],
        ),
      ),

    );

  }




}


