class QuizModel {
  int? id;
  String? name;
  String? title;
  String? description;
  String? difficultyLevel;
  String? topic;
  String? time;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;
  int? duration;
  String? endTime;
  String? negativeMarks;
  String? correctAnswerMarks;
  bool? shuffle;
  bool? showAnswers;
  bool? lockSolutions;
  bool? isForm;
  bool? showMasteryOption;
  ReadingMaterial? readingMaterial;
  String? quizType;
  bool? isCustom;
  int? bannerId;
  int? examId;
  bool? showUnanswered;
  String? endsAt;
  int? lives;
  String? liveCount;
  int? coinCount;
  int? questionsCount;
  String? dailyDate;
  int? maxMistakeCount;
  List<ReadingMaterial>? readingMaterials;
  List<Questions>? questions;
  int? progress;

  QuizModel({
    this.id,
    this.name,
    this.title,
    this.description,
    this.difficultyLevel,
    this.topic,
    this.time,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.duration,
    this.endTime,
    this.negativeMarks,
    this.correctAnswerMarks,
    this.shuffle,
    this.showAnswers,
    this.lockSolutions,
    this.isForm,
    this.showMasteryOption,
    this.readingMaterial,
    this.quizType,
    this.isCustom,
    this.bannerId,
    this.examId,
    this.showUnanswered,
    this.endsAt,
    this.lives,
    this.liveCount,
    this.coinCount,
    this.questionsCount,
    this.dailyDate,
    this.maxMistakeCount,
    this.readingMaterials,
    this.questions,
    this.progress,
  });

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    difficultyLevel = json['difficulty_level'];
    topic = json['topic'];
    time = json['time'];
    isPublished = json['is_published'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    duration = json['duration'];
    endTime = json['end_time'];
    negativeMarks = json['negative_marks'];
    correctAnswerMarks = json['correct_answer_marks'];
    shuffle = json['shuffle'];
    showAnswers = json['show_answers'];
    lockSolutions = json['lock_solutions'];
    isForm = json['is_form'];
    showMasteryOption = json['show_mastery_option'];
    readingMaterial = json['reading_material'] != null
        ? ReadingMaterial.fromJson(json['reading_material'])
        : null;
    quizType = json['quiz_type'];
    isCustom = json['is_custom'];
    bannerId = json['banner_id'];
    examId = json['exam_id'];
    showUnanswered = json['show_unanswered'];
    endsAt = json['ends_at'];
    lives = json['lives'];
    liveCount = json['live_count'];
    coinCount = json['coin_count'];
    questionsCount = json['questions_count'];
    dailyDate = json['daily_date'];
    maxMistakeCount = json['max_mistake_count'];
    readingMaterials = (json['reading_materials'] as List<dynamic>?)
        ?.map((e) => ReadingMaterial.fromJson(e))
        .toList();
    questions = (json['questions'] as List<dynamic>?)
        ?.map((e) => Questions.fromJson(e))
        .toList();
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['description'] = description;
    data['difficulty_level'] = difficultyLevel;
    data['topic'] = topic;
    data['time'] = time;
    data['is_published'] = isPublished;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['duration'] = duration;
    data['end_time'] = endTime;
    data['negative_marks'] = negativeMarks;
    data['correct_answer_marks'] = correctAnswerMarks;
    data['shuffle'] = shuffle;
    data['show_answers'] = showAnswers;
    data['lock_solutions'] = lockSolutions;
    data['is_form'] = isForm;
    data['show_mastery_option'] = showMasteryOption;
    if (readingMaterial != null) {
      data['reading_material'] = readingMaterial!.toJson();
    }
    data['quiz_type'] = quizType;
    data['is_custom'] = isCustom;
    data['banner_id'] = bannerId;
    data['exam_id'] = examId;
    data['show_unanswered'] = showUnanswered;
    data['ends_at'] = endsAt;
    data['lives'] = lives;
    data['live_count'] = liveCount;
    data['coin_count'] = coinCount;
    data['questions_count'] = questionsCount;
    data['daily_date'] = dailyDate;
    data['max_mistake_count'] = maxMistakeCount;
    if (readingMaterials != null) {
      data['reading_materials'] =
          readingMaterials!.map((v) => v.toJson()).toList();
    }
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    data['progress'] = progress;
    return data;
  }
}

class ReadingMaterial {
  int? id;
  String? keywords;

  ReadingMaterial({this.id, this.keywords});

  ReadingMaterial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keywords = json['keywords'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'keywords': keywords};
  }
}
class Questions {
  final int id;
  final String description;
  final String? difficultyLevel;
  final String topic;
  final bool isPublished;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String detailedSolution;
  final List<QuestionOption> options;

  Questions({
    required this.id,
    required this.description,
    this.difficultyLevel,
    required this.topic,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.detailedSolution,
    required this.options,
  });

  // Factory constructor to create an instance from JSON
  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      id: json['id'],
      description: json['description'],
      difficultyLevel: json['difficulty_level'],
      topic: json['topic'],
      isPublished: json['is_published'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      detailedSolution: json['detailed_solution'],
      options: (json['options'] as List)
          .map((option) => QuestionOption.fromJson(option))
          .toList(),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'difficulty_level': difficultyLevel,
      'topic': topic,
      'is_published': isPublished,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'detailed_solution': detailedSolution,
      'options': options.map((option) => option.toJson()).toList(),
    };
  }
}

class QuestionOption {
  final int id;
  final String description;
  final int questionId;
  final bool isCorrect;

  QuestionOption({
    required this.id,
    required this.description,
    required this.questionId,
    required this.isCorrect,
  });

  factory QuestionOption.fromJson(Map<String, dynamic> json) {
    return QuestionOption(
      id: json['id'],
      description: json['description'],
      questionId: json['question_id'],
      isCorrect: json['is_correct'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'question_id': questionId,
      'is_correct': isCorrect,
    };
  }
}

