class QuestionManager {
  static QuestionManager? instance;

  static QuestionManager getInstance() {
    instance ??= QuestionManager._();
    return instance!;
  }

  final Map<String, List> _questions = {
    "Was Moon Landing Fake": [true, 3],
    "Does 'Hai' Means 'Yes'": [true, 3],
    "Does 'Iia' Means 'No'": [true, 4],
  };

  int _currentQuestionIndex = -1;
  int _score = 0;
  int _totalScore = 0;
  late String _currentQuestion;

  QuestionManager._();

  String getQuestion() {
    _currentQuestionIndex += (!quizFinished()) ? 1 : 0;
    _currentQuestion = (quizFinished())
        ? "Test Is Finished\nYour Score = $_score/$_totalScore"
        : _questions.keys.elementAt(_currentQuestionIndex);
    return _currentQuestion;
  }

  void updateScore({required bool truthValue, required String question}) {
    _score += (_questions[question]?.elementAt(0) == truthValue)
        ? _questions[question]?.elementAt(1) as int
        : 0;
    _totalScore += _questions[question]?.elementAt(1) as int;
  }

  bool quizFinished() => _currentQuestionIndex == _questions.length;
}
