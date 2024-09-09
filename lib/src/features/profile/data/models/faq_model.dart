class FAQModel {
  final String title;
  final String description;

  FAQModel({required this.title, required this.description});
}

List<FAQModel> faqData = [
  FAQModel(
    title: 'What is Jumma?',
    description:
        'Jumma is a platform designed to [provide prayer times, facilitate community engagement, and offer halal product shopping], among other features.',
  ),
  FAQModel(
    title: 'How do I reset my password?',
    description:
        'If you\'ve forgotten your password, go to the user page and click on "Edit profile." Click on "Don’t know current password?" and we will send you an email with a link to reset your password.',
  ),
  FAQModel(
    title: 'Can I delete my account?',
    description:
        'Yes, you can request account deletion through the "Account Settings" section.',
  ),
];
