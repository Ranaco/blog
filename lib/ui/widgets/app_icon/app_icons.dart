class AppIcons{
  const AppIcons._(this.name);
  final String name;

  static const AppIcons menu = AppIcons._('menu');
  static const AppIcons bell = AppIcons._('bell');
  static const AppIcons options = AppIcons._('options'); 
  static const AppIcons home = AppIcons._('home');
  static const AppIcons favorite = AppIcons._('favorite');
  static const AppIcons sun = AppIcons._('sun');
  static const AppIcons moon = AppIcons._('moon');
  static const AppIcons bookmark = AppIcons._('bookmark');
  static const AppIcons profile = AppIcons._('profile');

  @override
  String toString(){
    return name;
  }
}
