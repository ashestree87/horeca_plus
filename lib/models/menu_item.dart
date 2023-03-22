class MenuItem {
  final String title;
  final List<String> files;

  MenuItem({required this.title, required this.files});

  static List<MenuItem> getMenuItems() {
    return [
      MenuItem(
        title: 'Starters',
        files: [
          'assets/menus/starters/demo-7.jpg',
          'assets/menus/starters/demo-8.jpg',
          'assets/menus/starters/demo-9.jpg',
        ],
      ),
      MenuItem(
        title: 'Mains',
        files: [
          'assets/menus/mains/demo-5.jpg',
          'assets/menus/mains/demo-6.jpg',
          'assets/menus/mains/demo-10.jpg',
        ],
      ),
      MenuItem(
        title: 'Desserts',
        files: [
          'assets/menus/desserts/demo-11.jpg',
          'assets/menus/desserts/demo-12.jpg',
          'assets/menus/desserts/demo-13.jpg',
        ],
      ),
      MenuItem(
        title: 'Drinks',
        files: [
          'assets/menus/drinks/demo-1.jpg',
          'assets/menus/drinks/demo-2.jpg',
          'assets/menus/drinks/demo-3.jpg',
          'assets/menus/drinks/demo-4.jpg',
        ],
      ),
    ];
  }
}
