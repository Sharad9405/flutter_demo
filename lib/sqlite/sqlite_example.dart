import 'package:flutter/material.dart';
import 'package:flutter_app/provider/common/text_styles.dart';
import 'package:flutter_app/provider/common/theme.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Dog.dart';

 List<Dog> dogList;

class SQLiteExample extends StatefulWidget {
  @override
  _SQLiteExampleState createState() => _SQLiteExampleState();
}

class _SQLiteExampleState extends State<SQLiteExample> {
  var database;

  List<Dog> newList = List();

  @override
  Widget build(BuildContext context) {
    initDatabase();

    return MaterialApp(
      title: 'SQLite Example',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'SQLite Example',
            style: headerStyle,
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              StaticDataList(context),

              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'SQLite :', style: subHeaderStyle,
                ),
              ),

              Expanded(
                child: dbList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView dbList(BuildContext context){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: newList.length,
      itemBuilder: (_, index) {
        return Card(
          elevation: 2.0,
          child:  ListTile(
            title: Text(/*'${index + 1} ' +*/ newList[index].name),
//          subtitle: Text("Sub Title"),
//            leading: Icon(Icons.thumb_up),
//          trailing: Icon(Icons.arrow_forward),
//          onTap: (){
//            Navigator.push(context,
//            MaterialPageRoute(builder: (context) => IconBtn(index)));
//          },
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              splashColor: Colors.red,
              onPressed: (){
//                navigate(context,index);
              },
            ),
          ),
        );
      },
    );
  }

  ListView StaticDataList(BuildContext context) {
    dogList = getItems();

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: dogList.length,
        itemBuilder: (_, index) {
          return Card(
              elevation: 2,
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          '${dogList[index].name}'
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (Icon(Icons.add)),
                        color: Colors.green[500],
                        onPressed: () {
                          insert(dogList[index]);
                          getAllDogs();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (Icon(Icons.delete)),
                        color: Colors.red[500],
                        onPressed: () {
                          deleteDog(dogList[index].id);
                          getAllDogs();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (Icon(Icons.edit)),
                        color: Colors.grey[500],
                        onPressed: () {
                          updateDog(dogList[index]);
                          getAllDogs();
                        },
                      ),
                    ),
                  ],
                ),
              )
          );
        });
  }

  List<Dog> getItems() {
    List<Dog> list = [];

    for (var i = 1; i <= 5; i++) {
      var d = Dog();
      d.id = i;
      d.name = "Dog $i";
      d.age = i * i;
      list.add(d);
    }
    return list;
  }

  void initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
        join(await getDatabasesPath(), 'doggie_database_db'),
        // When the database is first created, create a table to store dogs.
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
          );
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1
    );
  }

  void insert(Dog dog) async {
    // Get a reference to the database.
    final Database db = await database;
    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.

    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> getAllDogs() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    var list =  List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });

    print(list.toString());

    setState(() {
      newList = list;
    });

    return list;
  }

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
