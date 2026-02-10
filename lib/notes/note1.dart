// class TicTacToePage extends StatefulWidget {
//   const TicTacToePage({super.key});
//   @override
//   State<TicTacToePage> createState() => _TicTacToePageState();
// }
// class _TicTacToePageState extends State<TicTacToePage> {
//   List<String> moves = List.filled(9, "-");
//   String currentMove = "X";
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tic Tac Toe',
//           style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Current Move: $currentMove",
//               style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 300,
//               width: 300,
//               child: GridView.builder(
//                 primary: true,
//                 padding: const EdgeInsets.all(6),
//                 itemCount: 9,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       if (moves[index] == "-") {
//                         setState(() {
//                           moves[index] = currentMove;
//                           currentMove = currentMove == "O" ? "X" : "O";
//                           count++;
//                           if (_checkWinner()) {
//                             _showDialog(context, "Winner!", "The winner is ${moves[index]}");
//                           } else if (count == 9) {
//                             _showDialog(context, "Draw!", "Match is DRAW");
//                           }
//                         });
//                       }
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black),
//                         color: moves[index] == "-"
//                             ? Colors.white
//                             : (moves[index] == "X"
//                             ? Colors.blue.shade100
//                             : Colors.red.shade100),
//                       ),
//                       child: Center(
//                         child: Text(
//                           moves[index],
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//               ),
//               onPressed: _resetGame,
//               child: const Text("Restart Game"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }