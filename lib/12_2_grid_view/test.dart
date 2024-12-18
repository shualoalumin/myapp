import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {'name': 'MacBook', 'price': 1200000, 'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fGxhcHRvcHxlbnwwfHx8fDE2NzE0MDY1NTQ&ixlib=rb-1.2.1&q=80&w=400'},
      {'name': 'iPhone', 'price': 800000, 'image': 'https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/article/Apple-iPhone-16-Pro-hero-geo-240909_inline.jpg.large.jpg'},
      {'name': 'Headphone', 'price': 150000, 'image': 'https://i.ebayimg.com/images/g/2X4AAOSwzHNgmSTq/s-l1200.jpg'},
      {'name': 'Apple Watch', 'price': 250000, 'image': 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/HQWW2?wid=4000&hei=4000&fmt=jpeg&qlt=95&.v=1681150922615'},
      {'name': 'Samsung TV', 'price': 2000000, 'image': 'https://m.media-amazon.com/images/I/61w7r46U39L._AC_UF1000,1000_QL80_.jpg'},
      {'name': 'Cannon', 'price': 1800000, 'image': 'https://i5.walmartimages.com/seo/Canon-EOS-4000D-DSLR-Camera-EF-S-18-55-mm-f-3-5-5-6-III-Lens_7446dc1e-5d9f-4943-be75-5d17eee9db8d_1.426f180a993ce5c99f3e318f8b086f30.jpeg'},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product Grid'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: 10, 
              mainAxisSpacing: 10, 
              childAspectRatio: 4 / 3, 
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${product['price']}원',
                              style: const TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
