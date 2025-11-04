import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.amber,
    Colors.indigo,
    Colors.lime,
  ];

  Color? selectedColor;
  double betAmount = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game - Select Color'),
        backgroundColor: const Color(0xFF16213E),
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: selectedColor != null ? () {
              // Navigate to result screen
              Navigator.pushNamed(context, '/result');
            } : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE94560),
            ),
            child: const Text('Play'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a Color to Bet On',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              'Bet Amount: \\$${betAmount.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            Slider(
              value: betAmount,
              min: 10,
              max: 1000,
              divisions: 99,
              onChanged: (value) {
                setState(() {
                  betAmount = value;
                });
              },
              activeColor: const Color(0xFFE94560),
              inactiveColor: Colors.white30,
            ),
            const SizedBox(height: 20),
            const Text(
              'Available Colors',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  final color = colors[index];
                  final isSelected = selectedColor == color;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                        border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
                      ),
                      child: Center(
                        child: Text(
                          _getColorName(color),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getColorName(Color color) {
    if (color == Colors.red) return 'Red';
    if (color == Colors.green) return 'Green';
    if (color == Colors.blue) return 'Blue';
    if (color == Colors.yellow) return 'Yellow';
    if (color == Colors.purple) return 'Purple';
    if (color == Colors.orange) return 'Orange';
    if (color == Colors.pink) return 'Pink';
    if (color == Colors.teal) return 'Teal';
    if (color == Colors.cyan) return 'Cyan';
    if (color == Colors.amber) return 'Amber';
    if (color == Colors.indigo) return 'Indigo';
    if (color == Colors.lime) return 'Lime';
    return 'Color';
  }
}
