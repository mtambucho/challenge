enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  @override
  String toString() {
    return switch (this) {
      DayOfWeek.monday => 'Lunes',
      DayOfWeek.tuesday => 'Martes',
      DayOfWeek.wednesday => 'Miercoles',
      DayOfWeek.thursday => 'Jueves',
      DayOfWeek.friday => 'Viernes',
      DayOfWeek.saturday => 'Sabado',
      DayOfWeek.sunday => 'Domingo'
    };
  }
}
