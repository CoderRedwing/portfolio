import 'package:flutter/material.dart';
import '../widgets/animated_button.dart';
import '../widgets/drawer_page.dart';
import '../widgets/footer.dart';
import '../widgets/responsive_layout.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Aligns text and icon on the same baseline
            children: [
              Text(
                '{AJITESH}',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 600 ? 20 : 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 160,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.teal[800], size: 28),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),

      endDrawer: const DrawerPage(),
      backgroundColor: Colors.teal.shade50,
      body: ResponsiveLayout(
        mobileLayout: _buildMobileLayout(context),
        desktopLayout: _buildDesktopLayout(context),
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 400;

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hi, I\'m Ajitesh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Mobile & Web Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal[700],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'I love creating efficient and beautiful applications for mobile and web.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 40),

              Image.asset(
                'assets/profile_picture.png',
                width: screenWidth * 0.5, // Scale image width to screen size
                height: screenWidth * 0.5, // Maintain aspect ratio
              ),
              const SizedBox(height: 40),

              // Buttons layout
              if (isSmallScreen)
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/projects'),
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
                        child: Text('Explore Projects'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/contact'),
                        style: ElevatedButton.styleFrom(primary: Colors.teal[800]),
                        child: Text('Contact Me'),
                      ),
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: screenWidth * 0.4, // Adjust button width on larger screens
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/projects'),
                          style: ElevatedButton.styleFrom(primary: Colors.teal),
                          child: Text('Explore Projects'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: SizedBox(
                        width: screenWidth * 0.4, // Adjust button width on larger screens
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
                          style: ElevatedButton.styleFrom(primary: Colors.teal[800]),
                          child: Text('Contact Me'),
                        ),
                      ),
                    ),
                  ],
                ),

               // Keep other sections as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, I\'m Ajitesh',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Mobile & Web Developer',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'I love creating efficient and beautiful applications for mobile and web.',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      AnimatedButton(
                        label: 'Explore Projects',
                        onPressed: () => Navigator.pushNamed(context, '/projects'),
                        backgroundColor: Colors.teal,
                      ),
                      const SizedBox(width: 20),
                      AnimatedButton(
                        label: 'Contact Me',
                        onPressed: () => Navigator.pushNamed(context, '/contact'),
                        backgroundColor: Colors.teal[800]!,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset('assets/profile_picture.png'),
            ),
          ],
        ),
      ),
    );
  }
}
