class AppStrings {
  ///common
  static const appName = 'Challenge';
  static const notImplementedYet = 'Not implemented yet';
  static const home = 'Recipes';
  static const excercise = 'Excercise';
  static const monday = 'Lunes';
  static const tuesday = 'Martes';
  static const wednesday = 'Miercoles';
  static const thursday = 'Jueves';
  static const friday = 'Viernes';
  static const saturday = 'Sabado';
  static const sunday = 'Domingo';

  ///Week menu
  static const weekMenu = 'Menu Semanal';

  ///Settings
  static const settings = 'Settings';
  static const startupPage = 'Startup page';

  ///Challenge
  static const challenge = 'Reto';
  static const firstDay = 'Primer día del reto';

  ///Recipes
  static const recipes = 'Recetas';
  static const preparation = 'Preparación';
  static const ingredients = 'Ingredientes';
  static typeForWeek(String type, int week) => '$type de la Semana $week';
  static cantOfUnit(String cant, String unit) =>
      ' $cant${unit.isNotEmpty ? ' $unit de' : ''} ';
  static const breakfast = 'Desayuno';
  static const morningSnack = 'Colación';
  static const lunch = 'Almuerzo';
  static const snack = 'Merienda';
  static const dinner = 'Cena';
  static portions(int portions) => 'Porciones $portions';

  ///cart
  static const cart = 'Carrito';
  static const purchaseList = 'Lista de la compra';
  static const shoppingList = 'Lista de compras';

  ///Fasting
  static const fasting = 'Ayuno';
}
