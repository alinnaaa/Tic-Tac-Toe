part of 'home_page.dart';

class GameTitleWidget extends StatelessWidget {
  const GameTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Tic Tac Toe",
          style: TextStyle(
            fontSize: 65,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'DancingScript'
          ),
        ),
        const SizedBox(height: 30.0),
        
      ],
    );
  }
}