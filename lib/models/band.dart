class Band {

    String id;
    String name;
    int votes;
    //Contructor coon propiedades que son requeridas obligatoriamente
    Band({
      required this.id,
      required this.name,
      required this.votes
    });
    //objetivo regresar una instancia de la clase
    factory Band.fronMap( Map<String, dynamic> obj) 
    => Band(
      id: obj['id'], 
      name: obj['name'], 
      votes: obj['votes']
      );
}