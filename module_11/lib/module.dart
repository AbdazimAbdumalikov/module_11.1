class Azik {
  final int id;
  final String image;
  final String description;

  Azik({required this.id, required this.image, required this.description});
}

final List<Azik> azik = [
  Azik(
    id: 1,
    image: 'https://upload.wikimedia.org/wikipedia/commons/6/66/Central_Downtown_Astana_2.jpg',
    description: 'Astana',
  ),
  Azik(
    id: 2,
    image: 'https://www.travelandleisure.com/thmb/91pb8LbDAUwUN_11wATYjx5oF8Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/new-york-city-evening-NYCTG0221-52492d6ccab44f328a1c89f41ac02aea.jpg',
    description: 'New York',
  ),
  Azik(
    id: 3,
    image: 'https://media.cntravellerme.com/photos/65016eeed1c33603e64ad3ad/4:3/w_4284,h_3213,c_limit/1310961962',
    description: 'Almaty',
  )
];