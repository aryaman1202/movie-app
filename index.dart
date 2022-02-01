import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movie.dart';
void main() => runApp(MovieApp());
class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final List genres = ["Action and Adventure","Horror","War Drama","Sci-Fi","Comedy","Kids","Suspense","Recommended"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount: genres.length,itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4.5,
              color: Colors.black,
              child: ListTile(
                title: Text(genres[index],style: TextStyle(color: Colors.red,fontSize: 18),),
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.red,),
                onTap: (){
                  if(index==0){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList()));
                  }
                  else if(index==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList2()));
                  }
                  else if(index==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList3()));
                  }
                  else if(index==3){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList4()));
                  }
                  else if(index==4){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList5()));
                  }
                  else if(index==5){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList6()));
                  }
                  else if(index==6){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList7()));
                  }
                  else if(index==7){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList8()));
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final List<ActionMovie> movieList = ActionMovie.getMovies1();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount:movieList.length,itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 4.5,
            color: Colors.black,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movieList[index].poster),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              title: Text(movieList[index].title,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              subtitle: Text("${movieList[index].theme}, ${movieList[index].ageRating}",style: TextStyle(color: Colors.red.shade400,fontSize: 13),),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: movieList[index])));
              },
            ),
          );
        }),
      ),
    );
  }
}
class MovieDetails extends StatelessWidget {
  final ActionMovie movie;

  const MovieDetails({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              MoviePoster(Movie: movie),
              MovieThumbnail(movie: movie),
              MovieAbout(movie: movie),
              MovieImages(posters: movie.photos)
            ],
          )
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final ActionMovie Movie;

  const MoviePoster({Key? key, required this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(Movie.images),
                  fit: BoxFit.cover
                )
              ),
            ),
            Icon(Icons.play_circle_outline,color: Colors.white,size: 100,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.transparent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}
class MovieThumbnail extends StatelessWidget {
  final ActionMovie movie;

  const MovieThumbnail({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movie.images),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${movie.theme.toUpperCase()},  ${movie.ageRating}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                              Text("${movie.title}",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.bold),),
                              Text("${movie.year}       Rated: ${movie.imdb}/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                              Text("${movie.runTime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                              Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton.icon(onPressed: (){
                                        print("Watch Trailer");
                                      }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Trailer",style: TextStyle(color: Colors.black),),color: Colors.red,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton.icon(onPressed: (){
                                        print("Play");
                                      }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Play",style:TextStyle(color: Colors.black),),color: Colors.red,),
                                    )
                                  ],
                                ),
                            ],
                          ),
                    ),
                  ),
                ),
          ],
          ),
        ),
      ),
    );
  }
}
class MovieAbout extends StatelessWidget {
  final ActionMovie movie;

  const MovieAbout({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.2,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(color: Colors.red,fontSize: 27,fontWeight: FontWeight.bold),),
              Text("${movie.about}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Text(" "),
              Row(
                children: [
                  Text("Director:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(movie.director,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Cast:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                          children: [
                            Text(movie.cast,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                          ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Language:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.languages,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImages extends StatelessWidget {
  final List posters;

  const MovieImages({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Images",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 8,),
                        itemCount: posters.length,
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(posters[index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                  )),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
class MovieList2 extends StatefulWidget {
  @override
  _MovieList2State createState() => _MovieList2State();
}

class _MovieList2State extends State<MovieList2> {
  final List<HorrorMovie> movieList2 = HorrorMovie.getMovies2();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount:movieList2.length,itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 4.5,
            color: Colors.black,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieList2[index].poster),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              title: Text(movieList2[index].title,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              subtitle: Text("${movieList2[index].theme}, ${movieList2[index].ageRating}",style: TextStyle(color: Colors.red.shade400,fontSize: 13),),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails2(movie: movieList2[index])));
              },
            ),
          );
        }),
      ),
    );
  }
}
class MovieDetails2 extends StatelessWidget {
  final HorrorMovie movie;

  const MovieDetails2({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              MoviePoster2(Movie: movie),
              MovieThumbnail2(movie: movie),
              MovieAbout2(movie: movie),
              MovieImages2(posters: movie.photos)
            ],
          )
      ),
    );
  }
}

class MoviePoster2 extends StatelessWidget {
  final HorrorMovie Movie;

  const MoviePoster2({Key? key, required this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Movie.images),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,color: Colors.white,size: 100,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.transparent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}
class MovieThumbnail2 extends StatelessWidget {
  final HorrorMovie movie;

  const MovieThumbnail2({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movie.images),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${movie.theme.toUpperCase()},  ${movie.ageRating}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.title}",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.bold),),
                        Text("${movie.year}       Rated: ${movie.imdb}/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.runTime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Watch Trailer");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Trailer",style: TextStyle(color: Colors.black),),color: Colors.red,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Play");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Play",style:TextStyle(color: Colors.black),),color: Colors.red,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MovieAbout2 extends StatelessWidget {
  final HorrorMovie movie;

  const MovieAbout2({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(color: Colors.red,fontSize: 27,fontWeight: FontWeight.bold),),
              Text("${movie.about}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Text(" "),
              Row(
                children: [
                  Text("Director:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(movie.director,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Cast:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.cast,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Language:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.languages,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImages2 extends StatelessWidget {
  final List posters;

  const MovieImages2({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Images",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 8,),
                        itemCount: posters.length,
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(posters[index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
class MovieList3 extends StatefulWidget {
  @override
  _MovieList3State createState() => _MovieList3State();
}

class _MovieList3State extends State<MovieList3> {
  final List<WarMovie> movieList3 = WarMovie.getMovies3();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount:movieList3.length,itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 4.5,
            color: Colors.black,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieList3[index].poster),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              title: Text(movieList3[index].title,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              subtitle: Text("${movieList3[index].theme}, ${movieList3[index].ageRating}",style: TextStyle(color: Colors.red.shade400,fontSize: 13),),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails3(movie: movieList3[index])));
              },
            ),
          );
        }),
      ),
    );
  }
}
class MovieDetails3 extends StatelessWidget {
  final WarMovie movie;

  const MovieDetails3({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              MoviePoster3(Movie: movie),
              MovieThumbnail3(movie: movie),
              MovieAbout3(movie: movie),
              MovieImages3(posters: movie.photos)
            ],
          )
      ),
    );
  }
}

class MoviePoster3 extends StatelessWidget {
  final WarMovie Movie;

  const MoviePoster3({Key? key, required this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Movie.images),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,color: Colors.white,size: 100,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.transparent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}
class MovieThumbnail3 extends StatelessWidget {
  final WarMovie movie;

  const MovieThumbnail3({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movie.images),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${movie.theme.toUpperCase()},  ${movie.ageRating}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.title}",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.bold),),
                        Text("${movie.year}       Rated: ${movie.imdb}/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.runTime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Watch Trailer");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Trailer",style: TextStyle(color: Colors.black),),color: Colors.red,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Play");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Play",style:TextStyle(color: Colors.black),),color: Colors.red,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MovieAbout3 extends StatelessWidget {
  final WarMovie movie;

  const MovieAbout3({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(color: Colors.red,fontSize: 27,fontWeight: FontWeight.bold),),
              Text("${movie.about}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Text(" "),
              Row(
                children: [
                  Text("Director:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(movie.director,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Cast:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.cast,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Language:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.languages,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImages3 extends StatelessWidget {
  final List posters;

  const MovieImages3({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Images",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 8,),
                        itemCount: posters.length,
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(posters[index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
class MovieList4 extends StatefulWidget {
  @override
  _MovieList4State createState() => _MovieList4State();
}

class _MovieList4State extends State<MovieList4> {
  final List<SciFiMovie> movieList4 = SciFiMovie.getMovies4();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount:movieList4.length,itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 4.5,
            color: Colors.black,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieList4[index].poster),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              title: Text(movieList4[index].title,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              subtitle: Text("${movieList4[index].theme}, ${movieList4[index].ageRating}",style: TextStyle(color: Colors.red.shade400,fontSize: 13),),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails4(movie: movieList4[index])));
              },
            ),
          );
        }),
      ),
    );
  }
}
class MovieDetails4 extends StatelessWidget {
  final SciFiMovie movie;

  const MovieDetails4({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              MoviePoster4(Movie: movie),
              MovieThumbnail4(movie: movie),
              MovieAbout4(movie: movie),
              MovieImages4(posters: movie.photos)
            ],
          )
      ),
    );
  }
}

class MoviePoster4 extends StatelessWidget {
  final SciFiMovie Movie;

  const MoviePoster4({Key? key, required this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Movie.images),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,color: Colors.white,size: 100,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.transparent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}
class MovieThumbnail4 extends StatelessWidget {
  final SciFiMovie movie;

  const MovieThumbnail4({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movie.images),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${movie.theme.toUpperCase()},  ${movie.ageRating}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.title}",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.bold),),
                        Text("${movie.year}       Rated: ${movie.imdb}/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.runTime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Watch Trailer");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Trailer",style: TextStyle(color: Colors.black),),color: Colors.red,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Play");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Play",style:TextStyle(color: Colors.black),),color: Colors.red,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MovieAbout4 extends StatelessWidget {
  final SciFiMovie movie;

  const MovieAbout4({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(color: Colors.red,fontSize: 27,fontWeight: FontWeight.bold),),
              Text("${movie.about}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Text(" "),
              Row(
                children: [
                  Text("Director:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(movie.director,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Cast:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.cast,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Language:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.languages,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImages4 extends StatelessWidget {
  final List posters;

  const MovieImages4({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Images",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 8,),
                        itemCount: posters.length,
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(posters[index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
class MovieList5 extends StatefulWidget {
  @override
  _MovieList5State createState() => _MovieList5State();
}

class _MovieList5State extends State<MovieList5> {
  final List<ComedyMovie> movieList5 = ComedyMovie.getMovies5();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount:movieList5.length,itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 4.5,
            color: Colors.black,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieList5[index].poster),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              title: Text(movieList5[index].title,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              subtitle: Text("${movieList5[index].theme}, ${movieList5[index].ageRating}",style: TextStyle(color: Colors.red.shade400,fontSize: 13),),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails5(movie: movieList5[index])));
              },
            ),
          );
        }),
      ),
    );
  }
}
class MovieDetails5 extends StatelessWidget {
  final ComedyMovie movie;

  const MovieDetails5({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              MoviePoster5(Movie: movie),
              MovieThumbnail5(movie: movie),
              MovieAbout5(movie: movie),
              MovieImages5(posters: movie.photos)
            ],
          )
      ),
    );
  }
}

class MoviePoster5 extends StatelessWidget {
  final ComedyMovie Movie;

  const MoviePoster5({Key? key, required this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Movie.images),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,color: Colors.white,size: 100,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.transparent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}
class MovieThumbnail5 extends StatelessWidget {
  final ComedyMovie movie;

  const MovieThumbnail5({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movie.images),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${movie.theme.toUpperCase()},  ${movie.ageRating}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.title}",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.bold),),
                        Text("${movie.year}       Rated: ${movie.imdb}/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.runTime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Watch Trailer");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Trailer",style: TextStyle(color: Colors.black),),color: Colors.red,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Play");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Play",style:TextStyle(color: Colors.black),),color: Colors.red,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MovieAbout5 extends StatelessWidget {
  final ComedyMovie movie;

  const MovieAbout5({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(color: Colors.red,fontSize: 27,fontWeight: FontWeight.bold),),
              Text("${movie.about}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Text(" "),
              Row(
                children: [
                  Text("Director:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(movie.director,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Cast:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.cast,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Language:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.languages,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImages5 extends StatelessWidget {
  final List posters;

  const MovieImages5({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Images",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 8,),
                        itemCount: posters.length,
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(posters[index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
class MovieList6 extends StatefulWidget {
@override
_MovieList6State createState() => _MovieList6State();
}

class _MovieList6State extends State<MovieList6> {
  final List<KidsMovie> movieList6 = KidsMovie.getMovies6();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount:movieList6.length,itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 4.5,
            color: Colors.black,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieList6[index].poster),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              title: Text(movieList6[index].title,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              subtitle: Text("${movieList6[index].theme}, ${movieList6[index].ageRating}",style: TextStyle(color: Colors.red.shade400,fontSize: 13),),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails6(movie: movieList6[index])));
              },
            ),
          );
        }),
      ),
    );
  }
}
class MovieDetails6 extends StatelessWidget {
  final KidsMovie movie;

  const MovieDetails6({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              MoviePoster6(Movie: movie),
              MovieThumbnail6(movie: movie),
              MovieAbout6(movie: movie),
              MovieImages6(posters: movie.photos)
            ],
          )
      ),
    );
  }
}

class MoviePoster6 extends StatelessWidget {
  final KidsMovie Movie;

  const MoviePoster6({Key? key, required this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Movie.images),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,color: Colors.white,size: 100,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.transparent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}
class MovieThumbnail6 extends StatelessWidget {
  final KidsMovie movie;

  const MovieThumbnail6({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movie.images),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${movie.theme.toUpperCase()},  ${movie.ageRating}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.title}",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.bold),),
                        Text("${movie.year}       Rated: ${movie.imdb}/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.runTime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Watch Trailer");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Trailer",style: TextStyle(color: Colors.black),),color: Colors.red,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Play");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Play",style:TextStyle(color: Colors.black),),color: Colors.red,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MovieAbout6 extends StatelessWidget {
  final KidsMovie movie;

  const MovieAbout6({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(color: Colors.red,fontSize: 27,fontWeight: FontWeight.bold),),
              Text("${movie.about}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Text(" "),
              Row(
                children: [
                  Text("Director:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(movie.director,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Cast:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.cast,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Language:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.languages,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImages6 extends StatelessWidget {
  final List posters;

  const MovieImages6({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Images",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 8,),
                        itemCount: posters.length,
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(posters[index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
class MovieList7 extends StatefulWidget {
  @override
  _MovieList7State createState() => _MovieList7State();
}

class _MovieList7State extends State<MovieList7> {
  final List<SuspenceMovie> movieList7 = SuspenceMovie.getMovies7();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount:movieList7.length,itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 4.5,
            color: Colors.black,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieList7[index].poster),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              title: Text(movieList7[index].title,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              subtitle: Text("${movieList7[index].theme}, ${movieList7[index].ageRating}",style: TextStyle(color: Colors.red.shade400,fontSize: 13),),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails7(movie: movieList7[index])));
              },
            ),
          );
        }),
      ),
    );
  }
}
class MovieDetails7 extends StatelessWidget {
  final SuspenceMovie movie;

  const MovieDetails7({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              MoviePoster7(Movie: movie),
              MovieThumbnail7(movie: movie),
              MovieAbout7(movie: movie),
              MovieImages7(posters: movie.photos)
            ],
          )
      ),
    );
  }
}

class MoviePoster7 extends StatelessWidget {
  final SuspenceMovie Movie;

  const MoviePoster7({Key? key, required this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Movie.images),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,color: Colors.white,size: 100,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.transparent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}
class MovieThumbnail7 extends StatelessWidget {
  final SuspenceMovie movie;

  const MovieThumbnail7({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movie.images),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${movie.theme.toUpperCase()},  ${movie.ageRating}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.title}",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.bold),),
                        Text("${movie.year}       Rated: ${movie.imdb}/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.runTime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Watch Trailer");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Trailer",style: TextStyle(color: Colors.black),),color: Colors.red,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Play");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Play",style:TextStyle(color: Colors.black),),color: Colors.red,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MovieAbout7 extends StatelessWidget {
  final SuspenceMovie movie;

  const MovieAbout7({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(color: Colors.red,fontSize: 27,fontWeight: FontWeight.bold),),
              Text("${movie.about}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Text(" "),
              Row(
                children: [
                  Text("Director:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(movie.director,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Cast:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.cast,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Language:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.languages,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImages7 extends StatelessWidget {
  final List posters;

  const MovieImages7({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Images",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 8,),
                        itemCount: posters.length,
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(posters[index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
class MovieList8 extends StatefulWidget {
  @override
  _MovieList8State createState() => _MovieList8State();
}

class _MovieList8State extends State<MovieList8> {
  final List<RecommendedMovie> movieList8 = RecommendedMovie.getMovies8();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView.builder(itemCount:movieList8.length,itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 4.5,
            color: Colors.black,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieList8[index].poster),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              title: Text(movieList8[index].title,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              subtitle: Text("${movieList8[index].theme}, ${movieList8[index].ageRating}",style: TextStyle(color: Colors.red.shade400,fontSize: 13),),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails8(movie: movieList8[index])));
              },
            ),
          );
        }),
      ),
    );
  }
}
class MovieDetails8 extends StatelessWidget {
  final RecommendedMovie movie;

  const MovieDetails8({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("NETFLIX",style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              MoviePoster8(Movie: movie),
              MovieThumbnail8(movie: movie),
              MovieAbout8(movie: movie),
              MovieImages8(posters: movie.photos)
            ],
          )
      ),
    );
  }
}

class MoviePoster8 extends StatelessWidget {
  final RecommendedMovie Movie;

  const MoviePoster8({Key? key, required this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Movie.images),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,color: Colors.white,size: 100,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.transparent,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}
class MovieThumbnail8 extends StatelessWidget {
  final RecommendedMovie movie;

  const MovieThumbnail8({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movie.images),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${movie.theme.toUpperCase()},  ${movie.ageRating}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.title}",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.bold),),
                        Text("${movie.year}       Rated: ${movie.imdb}/10",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${movie.runTime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Watch Trailer");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Trailer",style: TextStyle(color: Colors.black),),color: Colors.red,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(onPressed: (){
                                print("Play");
                              }, icon: Icon(Icons.play_arrow,color: Colors.black,), label: Text("Play",style:TextStyle(color: Colors.black),),color: Colors.red,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MovieAbout8 extends StatelessWidget {
  final RecommendedMovie movie;

  const MovieAbout8({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(color: Colors.red,fontSize: 27,fontWeight: FontWeight.bold),),
              Text("${movie.about}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Text(" "),
              Row(
                children: [
                  Text("Director:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(movie.director,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Cast:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.cast,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Language:  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: [
                          Text(movie.languages,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MovieImages8 extends StatelessWidget {
  final List posters;

  const MovieImages8({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 0.2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Images",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 8,),
                        itemCount: posters.length,
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(posters[index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}









