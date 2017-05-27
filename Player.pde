class Player {
  String name;
  int gender; //0 is male, 1 is female

  Player() {
    name = "Bob";
    gender = 0;
  }

  Player(String name, int gender) {
    this.name = name;
    this.gender = gender;
  }

  void setName(String next) {
    name = next;
  }
  
   
  void setGender(int gen) {
    gender = gen;
  }   
}