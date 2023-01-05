import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trojan_machinetest/model/category_model.dart';
import 'package:trojan_machinetest/model/topcourses.dart';
import 'package:trojan_machinetest/services/categories_services.dart';
import 'package:trojan_machinetest/services/top_courses_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Course>? _courseList = [];
  late List<Categories>? _categoriesList = [];


  

  @override
  void initState() {
    super.initState();
    _getCourseData();
    _getCategoriesData();
  }

  void _getCourseData() async {
    _courseList = (await TopCoursesService().getCourses())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getCategoriesData() async {
    _categoriesList = (await CategoriesServices().getCategories())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black, child: Icon(Icons.filter,), onPressed: (){}),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'logo',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(),
            Row(
              children: [
                Text(
                  'Top Courses',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: SizedBox()),
                Text(
                  'All Courses >',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            Container(
              height: 200,
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _courseList!.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 120,
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: 100,
                                child: Image.network(
                                    _courseList![index].thumbnail.toString())),
                            Text(
                              _courseList![index].title.toString(),
                              maxLines: 2,
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  _courseList![index].price.toString(),
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text('Categories',style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Expanded(
                // child: GridView.count(crossAxisCount: 2,children: [Text('data'),Text('data'),Text('data'),Text('data'),],),
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 280,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: _categoriesList!.length,
              itemBuilder: (context, index) => Container(
                child: Card(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)] ,
                  elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(_categoriesList![index].thumbnail.toString()),
                    SizedBox(height: 5,),
                    Text(_categoriesList![index].name.toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    Text(
                        '${_categoriesList![index].number_of_courses.toString()} courses',style: TextStyle(fontSize: 10,color: Colors.white),)
                  ],
                )),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14), items: [BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,),label: 'Course'),BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,),label: 'Course'),BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,),label: 'Course'),BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,),label: 'Course')]),
    );
  }
}
