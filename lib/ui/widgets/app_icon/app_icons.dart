class AppIcons{
  const AppIcons._(this.name);
  final String name;

  static const AppIcons menu = AppIcons._('menu');
  static const AppIcons bell = AppIcons._('bell');
  static const AppIcons options = AppIcons._('options'); 
  static const AppIcons home = AppIcons._('home');
  static const AppIcons favorite = AppIcons._('favorite');

  @override
  String toString(){
    return name;
  }
}
