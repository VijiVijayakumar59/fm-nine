class Onboard {
  final String image, title1, description1, description2;

  Onboard({
    required this.image,
    required this.title1,
    required this.description1,
    required this.description2,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: 'assets/images/FM 9  Logo.png',
    title1: 'Welcome to FM 9',
    description1: 'Enjoy your Non-stop live radio.',
    description2: 'Anywhere Anytime!',
  ),
  Onboard(
    image: 'assets/images/FM 9  Logo.png',
    title1: 'Get breaking news',
    description1: 'Listen to WorldWide news',
    description2: 'in 45 seconds.',
  ),
  Onboard(
    image: 'assets/images/FM 9  Logo.png',
    title1: 'Rich FM programs',
    description1: 'Enjoy the real entertainment world.',
    description2: 'Get the latest updates.',
  ),
];
