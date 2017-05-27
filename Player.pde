class Player {
  String name;
  String gender;

  Player() {
  }

  Player(String name, int gender) {
    this.name = name;
    this.gender = gender;
  }

  void setName(String next) {
    name = next;
  }
  
  void setGender(int num) {
    if (num == 1) {
      gender = "Male";
    } else if (num == 2) {
      gender = "Female";
    } else {
      gender = "Other";
    }
  }
   
  void setGender(String gen) {
    gender = gen;
  }   
}