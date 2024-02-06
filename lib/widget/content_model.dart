class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      image: 'images/screen1.png',
      title: 'Select from out\n Best Menu',
      description: 'Pick your food from menu\n  More than 35 times'),
  UnboardingContent(
      image: 'images/screen2.png',
      title: 'Easy and Online Payment',
      description:
          'You can pay cash on delivery and\n  Card payment is avalible'),
  UnboardingContent(
      image: 'images/screen3.png',
      title: 'Quick delivery at Your Doorstep',
      description: 'Delevery your food at your\n Doorstep'),
];
