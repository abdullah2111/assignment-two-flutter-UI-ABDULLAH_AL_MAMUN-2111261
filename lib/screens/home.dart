import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the safe area size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. App Bar / Header Section
            _buildAppBar(),

            // 2. Total Balance Card
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: _buildBalanceCard(screenWidth),
            ),

            // 3. Action Buttons (Transfer, Pay Bills, Invest)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ActionButton(
                    icon: Icons.currency_exchange,
                    label: 'Transfer',
                  ),
                  _ActionButton(icon: Icons.payment, label: 'Pay Bills'),
                  _ActionButton(icon: Icons.link, label: 'Invest'),
                ],
              ),
            ),

            // 4. Recent Transactions Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Action for View All
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF5A58FE),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 5. Recent Transactions List
            const _TransactionList(),

            // Add some padding at the bottom to ensure the last item isn't covered by the navbar
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // --- Widgets ---

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.only(
        top: 50.0,
        left: 16.0,
        right: 16.0,
        bottom: 10.0,
      ),
      // Use the scaffold background color for a clean transition
      color: const Color(0xFFF7F7F7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Student Initial Circle (S)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF5A58FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'S',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Welcome Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  const Text(
                    'ABDULLAH AL MAMUN',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          // Notification Bell Icon
          Stack(
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                color: Colors.grey,
                size: 28,
              ),
              // Red dot for notification
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(double screenWidth) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFF5A58FE),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5A58FE).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Title and Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total Balance',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Icon(Icons.credit_card, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 8),

          // Row 2: Balance Amount
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text(
                '\$8,945',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                '.32',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Row 3: Savings and Last 30 days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Savings: \$5,500',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Row(
                children: const [
                  Text(
                    'Last 30 days: +\$300',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, color: Colors.white70, size: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom widget for the action buttons below the card
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          elevation: 4,
          child: InkWell(
            onTap: () {
              // Action for the button
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: const Color(0xFF5A58FE), size: 28),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom widget for the list of transactions
class _TransactionList extends StatelessWidget {
  const _TransactionList();

  // Mock data for transactions
  final List<Map<String, dynamic>> transactions = const [
    {
      'name': 'Netflix Subscription',
      'category': 'Entertainment',
      'time': 'Today',
      'amount': -19.99,
      'icon': Icons.movie_outlined,
    },
    {
      'name': 'Coffee Shop',
      'category': 'Food & Drink',
      'time': 'Today',
      'amount': -4.50,
      'icon': Icons.local_cafe_outlined,
    },
    {
      'name': 'Salary Deposit',
      'category': 'Income',
      'time': 'Yesterday',
      'amount': 3500.00,
      'icon': Icons.account_balance_wallet_outlined,
    },
    {
      'name': 'Grocery Store',
      'category': 'Shopping',
      'time': 'Yesterday',
      'amount': -55.80,
      'icon': Icons.shopping_cart_outlined,
    },
    {
      'name': 'Amazon Purchase',
      'category': 'Shopping',
      'time': '2 days ago',
      'amount': -120.45,
      'icon': Icons.shopping_bag_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Important for nested scrollable widgets
      physics:
          const NeverScrollableScrollPhysics(), // Managed by the parent SingleChildScrollView
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final isExpense = transaction['amount'] < 0;
        final amountText = isExpense
            ? '-\$${(-transaction['amount']).toStringAsFixed(2)}'
            : '+\$${(transaction['amount']).toStringAsFixed(2)}';
        final amountColor = isExpense ? Colors.red : Colors.green;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                transaction['icon'] as IconData,
                color: Colors.grey[700],
              ),
            ),
            title: Text(
              transaction['name'] as String,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            subtitle: Text(
              '${transaction['category']} \u2022 ${transaction['time']}',
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
            trailing: Text(
              amountText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: amountColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
