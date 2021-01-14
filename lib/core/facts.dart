class Facts {
  String text="";
  int number=0;
  bool found=false;
  String type="";

  Facts({ this.text,this.number,this.found, this.type});

  Facts.fromJson(Map<dynamic, dynamic> json) {
    text = json['text'];
    number = (json['number']).round();
    found = json['found'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['number'] = this.number;
    data['found'] = this.found;
    data['type'] = this.type;
    return data;
  }
}