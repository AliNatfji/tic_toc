import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'logic.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = '';
  String activePlayer='X';
  bool isSwitched = false;
  bool gameOver = false;
  bool  onPressd=true;
  Game game = Game();
  int turn=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(),
      backgroundColor: onPressd?Theme.of(context).primaryColor:Color(0xFF74B9FF),
      body:SafeArea(
        child:MediaQuery.of(context).orientation== Orientation.portrait? Column(
          children:
          [
            ...firstBloc(),
            const SizedBox(
              height: 20,),
            _expanded(context),
            ...lastBloc(),
          ],
        ):Row(
          children:
        [
          Column(
          children:
          [
            ...firstBloc(),
            ...lastBloc(),
          ],),
          _expanded(context),
        ],
        ),
      ),
    );
  }

  List<Widget> firstBloc()
  {
    return
      [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Turn on two player',
                style: TextStyle(
                  fontSize: 25,
                  color:
                  onPressd ?Colors.white:Colors.black,
                ),
              ),
              Switch(value: isSwitched,
                // focusColor: Colors.red,
                // hoverColor:Colors.red,
                activeColor:onPressd ?Colors.white:Colors.black,
                onChanged:(bool onclick)
                {
                  setState(()
                  {
                    isSwitched=onclick;
                  });
                },
              ),
              IconButton(
                icon:  Icon(
                  Icons.brightness_4_outlined,
                  color: onPressd ?Colors.white:Colors.black,
                  size: 35,
                ),
                onPressed: ()
                {
                  setState(()
                  {
                    onPressd=!onPressd;
                  });

                },
              ),
            ],

          ),
        ),
        Text(
          'it\'s $activePlayer turn'.toUpperCase(),
          style:  TextStyle
            (
            color: onPressd ?Colors.white:Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
      ];
  }

  Expanded _expanded(BuildContext context)
  {
    return  Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(16.0),
        crossAxisCount:3,
        crossAxisSpacing:8,
        mainAxisSpacing:8,
        childAspectRatio: 1.0,
        children:List.generate(9, (index) => InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap:gameOver? null: () =>_onTab(index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: onPressd ?Theme.of(context).shadowColor:Colors.white, //Color(0xFFDFE6E9), //Color(0xFFDFE6E9),
              //  rgb(116, 185, 255)
              //border: Border.all(color: Colors.grey)
            ),
            child: Center(
              child: Text(
                Player.playerX.contains(index) ? 'X':
                Player.playerO.contains(index)?'O':'',
                style:  TextStyle(
                  color: Player.playerO.contains(index)?Colors.red:(onPressd?Colors.white:Colors.black),
                  fontSize: 75,
                ),
              ),
            ),
          ),
        ),),
      ),
    );
  }

  List<Widget> lastBloc()
  {
    return
      [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            result,
            style:  TextStyle(
              color: onPressd ?Colors.white:Colors.black,
              fontSize: 42,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: ElevatedButton.icon(
            onPressed:()
            {
              setState(()
              {
                activePlayer = 'X';
                result = '';
                gameOver = false;
                turn =0;
                Player.playerX=[];
                Player.playerO=[];
              });
            } ,
            icon: const Icon(
              Icons.replay,
              // color: onPressd ?Colors.white:Colors.black,
            ),
            label: const Text(
              'Repeat the game',
              // style: TextStyle
              //   (
              //    color: onPressd ?Colors.white:Colors.black,
              //   ),
            ),
            style:ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            ) ,
          ),
        ),
      ];
  }


  _onTab (int index) async{

    if((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index)))
    {
      game.playGame(index, activePlayer);
      updateState();

      if(!isSwitched && !gameOver && turn!=9)
      {
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState()
  {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
       String winnerPlayer = game.chekWinner();
       if(winnerPlayer !='')
      {
        gameOver=true;
        result = '$winnerPlayer is the winner';
      }
      else if(!gameOver && turn==9)
      {
        result = 'It\'s Draw!';
      }
    });
  }

}
