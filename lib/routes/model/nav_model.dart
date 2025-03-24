class NavitemModel {
  final String title;
  final String src;

  NavitemModel({required this.title, required this.src});
}

List<NavitemModel> bottomNavItems = [
  NavitemModel(title: 'home', src: "lib/assets/svg/home.svg"),

  NavitemModel(title: 'profile', src: "lib/assets/svg/profile.svg"),
];
