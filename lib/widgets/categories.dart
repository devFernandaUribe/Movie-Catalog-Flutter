import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/categorie_model.dart';

import '../controllers/categories_controller.dart';

// class Categories extends StatelessWidget {
  // const Categories({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   // return futureList();
  // }
// }

// Widget futureList() {
//   print("CategoriesController().getAllCategories()----------- ");
//   print(CategoriesController().getAllCategories());
//   return FutureBuilder(
//       future: CategoriesController().getAllCategories(),
//       builder: (context, snapshot) {
//         List<Widget> children;
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasError) {
//             children = [const Text("XXX")];
//           } else {
//             return getAllCategoriesView(snapshot.data, context);
//           }
//         } else if (snapshot.connectionState == ConnectionState.waiting) {
//           children = [const Text("...")];
//         } else {
//           children = [const Text("XXX")];
//         }
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: children,
//         );
//       });
// }

// Widget getAllCategoriesView(data, BuildContext context) {
//   var categories = data as List<CategorieModel>;

//   return ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       itemCount: categories.length,
//       itemBuilder: (BuildContext context, int index) {
//         return getCategorieView(categories[index], context);
//       });
// }

// Widget getCategorieView(CategorieModel categorie, BuildContext context) {
//   return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
//       child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//             border: Border.all(color: Colors.yellow, width: 2.0),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//           child: Text(categorie.categorieName)));
// }
