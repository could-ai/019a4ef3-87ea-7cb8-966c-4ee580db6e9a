import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        backgroundColor: const Color(0xFF16213E),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF16213E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balance',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                  Text(
                    '\$10,000.00',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFF16213E),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Icon(
                        index % 2 == 0 ? Icons.arrow_upward : Icons.arrow_downward,
                        color: index % 2 == 0 ? Colors.green : Colors.red,
                      ),
                      title: Text(
                        'Transaction ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        index % 2 == 0 ? 'Deposit' : 'Withdrawal',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: Text(
                        index % 2 == 0 ? '+\$500' : '-\$200',
                        style: TextStyle(
                          color: index % 2 == 0 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
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
}