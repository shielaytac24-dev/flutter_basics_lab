
import 'package:flutter/material.dart';

void main() {
  runApp(const CafeMenuApp());
}

class CafeMenuApp extends StatelessWidget {
  const CafeMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 4 - Campus Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF795548),
        ),
        useMaterial3: true,
      ),
      home: const CafeMenuPage(),
    );
  }
}

class CafeItem {
  final String name;
  final String description;
  final double price;
  final IconData icon;
  final bool isBestSeller;

  const CafeItem({
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
    this.isBestSeller = false,
  });
}

class CafeMenuPage extends StatelessWidget {
  const CafeMenuPage({super.key});

  static const List<String> categories = [
    'All',
    'Coffee',
    'Drinks',
    'Snacks',
    'Desserts',
  ];

  static const List<CafeItem> menuItems = [
    CafeItem(
      name: 'Cafe Latte',
      description: 'Espresso with steamed milk',
      price: 120,
      icon: Icons.coffee,
      isBestSeller: true,
    ),
    CafeItem(
      name: 'Cappuccino',
      description: 'Coffee with creamy foam',
      price: 110,
      icon: Icons.local_cafe,
    ),
    CafeItem(
      name: 'Iced Coffee',
      description: 'Chilled coffee refreshment',
      price: 95,
      icon: Icons.icecream,
    ),
    CafeItem(
      name: 'Chocolate Cake',
      description: 'Rich and moist chocolate cake',
      price: 85,
      icon: Icons.cake,
    ),
    CafeItem(
      name: 'Club Sandwich',
      description: 'Fresh sandwich with tasty filling',
      price: 100,
      icon: Icons.lunch_dining,
    ),
    CafeItem(
      name: 'French Fries',
      description: 'Crispy golden potato fries',
      price: 75,
      icon: Icons.fastfood,
    ),

    // Two additional menu items for the activity task
    CafeItem(
      name: 'Strawberry Sundae',
      description: 'Creamy ice cream with strawberry',
      price: 90,
      icon: Icons.icecream,
    ),
    CafeItem(
      name: 'Blueberry Cheesecake',
      description: 'Cheesecake topped with blueberries',
      price: 105,
      icon: Icons.cake,
      isBestSeller: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text('Activity 4 - Campus Café'),
        backgroundColor: const Color(0xFFFFF8F0),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cafe banner using Stack
          Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 165,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF795548),
                          Color(0xFF4E342E),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_cafe,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Campus Café',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Good coffee, good mood!',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'OPEN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Horizontal category list using ListView
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 58,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Chip(
                    label: Text(categories[index]),
                    backgroundColor: index == 0
                        ? const Color(0xFFE0C3A3)
                        : Colors.white,
                    side: BorderSide.none,
                  ),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Text(
              'Our Menu',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Menu grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: menuItems.length,

              // Activity task: try 3, then change back to 2
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.88,
              ),

              itemBuilder: (context, index) {
                final item = menuItems[index];

                return Card(
                  elevation: 2,
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Icon(
                                  item.icon,
                                  size: 58,
                                  color: const Color(0xFF795548),
                                ),
                              ),
                            ),
                            Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '₱${item.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF795548),
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (item.isBestSeller)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFC107),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'BEST SELLER',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
