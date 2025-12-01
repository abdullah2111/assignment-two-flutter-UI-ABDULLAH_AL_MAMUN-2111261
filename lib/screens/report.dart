import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  // Mock data for the spending report
  static const double totalExpenses = 1270.00;
  static const List<Map<String, dynamic>> spendingData = [
    {'category': 'Food & Drink', 'amount': 450.00, 'color': Color(0xFFE57373)},
    {'category': 'Shopping', 'amount': 320.00, 'color': Color(0xFF64B5F6)},
    {'category': 'Housing', 'amount': 280.00, 'color': Color(0xFFFFB74D)},
    {'category': 'Transport', 'amount': 150.00, 'color': Color(0xFF81C784)},
    {'category': 'Other', 'amount': 70.00, 'color': Color(0xFF90A4AE)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. App Bar / Header Section (Reusing structure from Home)
            _buildAppBar(),

            // 2. Page Title
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 10.0,
                bottom: 20.0,
              ),
              child: Text(
                'Monthly Spending Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[900],
                ),
              ),
            ),

            // 3. Total Expenses Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildTotalExpensesCard(),
            ),

            // 4. Spending Breakdown Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 10.0),
              child: Text(
                'Spending Breakdown',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),

            // 5. Spending Breakdown List
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: _SpendingBreakdownList(
                spendingData: spendingData,
                totalExpenses: totalExpenses,
              ),
            ),

            // Padding for the bottom
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

  Widget _buildTotalExpensesCard() {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Expenses (Last 30 days)',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 8),

            // Expense Amount (FIXED: Removed 'const')
            Text(
              // Removed const here
              '-\$${totalExpenses.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),

            // Percentage change
            Row(
              children: [
                const Icon(Icons.arrow_upward, color: Colors.red, size: 16),
                Text(
                  'Up 12% from last month',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for the list of spending categories
class _SpendingBreakdownList extends StatelessWidget {
  final List<Map<String, dynamic>> spendingData;
  final double totalExpenses;

  const _SpendingBreakdownList({
    required this.spendingData,
    required this.totalExpenses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: spendingData.length,
      itemBuilder: (context, index) {
        final item = spendingData[index];
        final double amount = item['amount'];
        final Color color = item['color'] as Color;

        // Calculate percentage (e.g., 450 / 1270 = 0.354 * 100 = 35.4%)
        final double percentage = amount / totalExpenses;
        final String percentageText = (percentage * 100).toStringAsFixed(0);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Name and Value
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['category'] as String,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    '\$${amount.toStringAsFixed(2)} (${percentageText}%)',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Progress Bar
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Background of the bar
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
