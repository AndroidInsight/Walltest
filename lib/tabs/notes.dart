class Note {
  late String img;

  Note(this.img);

  Note.fromJson(Map<String, dynamic> json) {
    img = json['url'];
  }

}