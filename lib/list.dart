import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'country.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  Country usa = Country("USA", "images/usa.jpg",
      "The U.S. is a country of 50 states covering a vast swath of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into the Pacific Ocean. Major Atlantic Coast cities are New York, a global finance and culture center, and capital Washington, DC. Midwestern metropolis Chicago is known for influential architecture and on the west coast, Los Angeles' Hollywood is famed for filmmaking.");
  Country england = Country("England", "images/england.jpg",
      "England is a country that is part of the United Kingdom. It shares land borders with Wales to its west and Scotland to its north. The Irish Sea lies northwest of England and the Celtic Sea to the southwest. England is separated from continental Europe by the North Sea to the east and the English Channel to the south.");
  Country france = Country("France", "images/france.jpg",
      "France, in Western Europe, encompasses medieval cities, alpine villages and Mediterranean beaches. Paris, its capital, is famed for its fashion houses, classical art museums including the Louvre and monuments like the Eiffel Tower. The country is also renowned for its wines and sophisticated cuisine. Lascaux’s ancient cave drawings, Lyon’s Roman theater and the vast Palace of Versailles attest to its rich history.");
  Country russia = Country("Russia", "images/russia.jpg",
      "Russia, or the Russian Federation, is a transcontinental country located in Eastern Europe and Northern Asia.");
  Country canada = Country("Canada", "images/canada.jpg",
      "Canada is a country in the northern part of North America. Its ten provinces and three territories extend from the Atlantic to the Pacific and northward into the Arctic Ocean, covering 9.98 million square kilometres, making it the world's second-largest country by total area.");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Colors.white,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            padding: const EdgeInsets.all(5.0),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            children: <Country>[usa, england, france, russia, canada]
                .map((Country country) {
              return GestureDetector(
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(fit: StackFit.expand, children: <Widget>[
                      Hero(
                          tag: country.imagePath,
                          transitionOnUserGestures: true,
                          child: Image.asset(country.imagePath,
                              fit: BoxFit.cover)),
                      Container(
                          margin: EdgeInsets.only(left: 10, bottom: 10),
                          alignment: Alignment.bottomLeft,
                          child: Hero(
                            tag: country.title,
                            transitionOnUserGestures: true,
                            child: Text(country.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black12,
                                      offset: Offset(3.0, 3.0),
                                    ),
                                  ],
                                )),
                          ))
                    ]),
                  ),
                  onTap: () => Navigator.pushNamed(context, "/DetailsScreen",
                      arguments: country));
            }).toList(),
          )),
    );
  }
}
