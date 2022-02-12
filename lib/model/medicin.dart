class Medicin{
   String? title;
   String? description;
   DateTime? from;
   DateTime? to;
   bool? isAllDay;
  

   Medicin(
    this.title,
     this.description,
     this.from,
    this.to,
     this.isAllDay);

     
Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'from': from, 'to': to};
  }

  Medicin.fromJson(Map<String , dynamic> json){
    title = json['title'];
    description = json['description'];
    from = json['from'];
    to = json['to'];

  }

}