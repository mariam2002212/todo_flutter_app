class TodoDM {
  static const String collectionName = 'todo';
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TodoDM(
      {required this.id,
        required this.title,
        required this.description,
        required this.dateTime,
        required this.isDone});

  //data ready to be added to db
  Map<String, dynamic> toFireStore() => {
    'id': id,
    'title': title,
    'description': description,
    'dateTime': dateTime,
    'isDone': isDone,
  };

  //read data from db "named constructor"
  TodoDM.fromFireStore(Map<String, dynamic> data)
      : this(
    id: data['id'],
    title: data['title'],
    description: data['description'],
    //toDate dy bt convert mn dateTime l timestamp 34an fl db el type bta3o timestamp
    dateTime: data['dateTime'].toDate(),
    isDone: data['isDone'],
  );
}