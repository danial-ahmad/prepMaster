class QuizList {
  final int id;
  final String que;
  final String op1;
  final String op2;
  final String op3;
  final String op4;
  final String ans;

  QuizList._(
      {this.que, this.op1, this.op3, this.op4, this.ans, this.id, this.op2});

  factory QuizList.fromJson(Map<String, dynamic> json) {
    return QuizList._(
        id: json['id'],
        que: json['question'],
        op1: json['op1'],
        op2: json['op2'],
        op3: json['op3'],
        op4: json['op4'],
        ans: json['ans']);
  }
}
