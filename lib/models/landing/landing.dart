class PageModel {
  final String title;
  final String body;
  final String image;

  PageModel({required this.title, required this.body, required this.image});
}

List<PageModel> onBoardingPagesModel = [
  PageModel(
    title: "Streamlined Companion App.",
    body:
        "Patients cant track prescriptions, contact their physicians, and get medication reminders.",
    image: "image (1).png",
  ),
  PageModel(
    title: "Real-Time Drug Interaction Alerts.",
    body:
        "Physicians get alerted about possible risky interactions as the medications are prescribed.",
    image: "image (2).png",
  ),
  PageModel(
    title: "100% Digital Prescription System.",
    body:
        "Paper-and-pen prescriptions are totally eliminated and replaced by a greener, more reliable, and more readable alternative.",
    image: "image (3).png",
  ),
  PageModel(
    title: "Cloud-Based Operation.",
    body:
        "PharmaLink requires no installation and a very minimal learning curve to get physicians started.",
    image: "image (4).png",
  ),
];
