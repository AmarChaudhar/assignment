// To parse this JSON data, do
//
//     final quizQuestionModels = quizQuestionModelsFromJson(jsonString);

import 'dart:convert';

QuizQuestionModels quizQuestionModelsFromJson(String str) =>
    QuizQuestionModels.fromJson(json.decode(str));

String quizQuestionModelsToJson(QuizQuestionModels data) =>
    json.encode(data.toJson());

class QuizQuestionModels {
  final int? id;
  final dynamic name;
  final String? title;
  final String? description;
  final dynamic difficultyLevel;
  final String? topic;
  final DateTime? time;
  final bool? isPublished;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? duration;
  final DateTime? endTime;
  final String? negativeMarks;
  final String? correctAnswerMarks;
  final bool? shuffle;
  final bool? showAnswers;
  final bool? lockSolutions;
  final bool? isForm;
  final bool? showMasteryOption;
  final dynamic readingMaterial;
  final dynamic quizType;
  final bool? isCustom;
  final dynamic bannerId;
  final dynamic examId;
  final bool? showUnanswered;
  final DateTime? endsAt;
  final dynamic lives;
  final String? liveCount;
  final int? coinCount;
  final int? questionsCount;
  final String? dailyDate;
  final int? maxMistakeCount;
  final List<dynamic>? readingMaterials;
  final List<Question>? questions;
  final int? progress;

  QuizQuestionModels({
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

  factory QuizQuestionModels.fromJson(
    Map<String, dynamic> json,
  ) => QuizQuestionModels(
    id: json["id"],
    name: json["name"],
    title: json["title"],
    description: json["description"],
    difficultyLevel: json["difficulty_level"],
    topic: json["topic"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    isPublished: json["is_published"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    duration: json["duration"],
    endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
    negativeMarks: json["negative_marks"],
    correctAnswerMarks: json["correct_answer_marks"],
    shuffle: json["shuffle"],
    showAnswers: json["show_answers"],
    lockSolutions: json["lock_solutions"],
    isForm: json["is_form"],
    showMasteryOption: json["show_mastery_option"],
    readingMaterial: json["reading_material"],
    quizType: json["quiz_type"],
    isCustom: json["is_custom"],
    bannerId: json["banner_id"],
    examId: json["exam_id"],
    showUnanswered: json["show_unanswered"],
    endsAt: json["ends_at"] == null ? null : DateTime.parse(json["ends_at"]),
    lives: json["lives"],
    liveCount: json["live_count"],
    coinCount: json["coin_count"],
    questionsCount: json["questions_count"],
    dailyDate: json["daily_date"],
    maxMistakeCount: json["max_mistake_count"],
    readingMaterials:
        json["reading_materials"] == null
            ? []
            : List<dynamic>.from(json["reading_materials"]!.map((x) => x)),
    questions:
        json["questions"] == null
            ? []
            : List<Question>.from(
              json["questions"]!.map((x) => Question.fromJson(x)),
            ),
    progress: json["progress"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "title": title,
    "description": description,
    "difficulty_level": difficultyLevel,
    "topic": topic,
    "time": time?.toIso8601String(),
    "is_published": isPublished,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "duration": duration,
    "end_time": endTime?.toIso8601String(),
    "negative_marks": negativeMarks,
    "correct_answer_marks": correctAnswerMarks,
    "shuffle": shuffle,
    "show_answers": showAnswers,
    "lock_solutions": lockSolutions,
    "is_form": isForm,
    "show_mastery_option": showMasteryOption,
    "reading_material": readingMaterial,
    "quiz_type": quizType,
    "is_custom": isCustom,
    "banner_id": bannerId,
    "exam_id": examId,
    "show_unanswered": showUnanswered,
    "ends_at":
        "${endsAt!.year.toString().padLeft(4, '0')}-${endsAt!.month.toString().padLeft(2, '0')}-${endsAt!.day.toString().padLeft(2, '0')}",
    "lives": lives,
    "live_count": liveCount,
    "coin_count": coinCount,
    "questions_count": questionsCount,
    "daily_date": dailyDate,
    "max_mistake_count": maxMistakeCount,
    "reading_materials":
        readingMaterials == null
            ? []
            : List<dynamic>.from(readingMaterials!.map((x) => x)),
    "questions":
        questions == null
            ? []
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
    "progress": progress,
  };
}

class Question {
  final int? id;
  final String? description;
  final dynamic difficultyLevel;
  final Topic? topic;
  final bool? isPublished;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? detailedSolution;
  final String? type;
  final bool? isMandatory;
  final bool? showInFeed;
  final String? pyqLabel;
  final int? topicId;
  final int? readingMaterialId;
  final DateTime? fixedAt;
  final String? fixSummary;
  final dynamic createdBy;
  final String? updatedBy;
  final dynamic quizLevel;
  final QuestionFrom? questionFrom;
  final dynamic language;
  final dynamic photoUrl;
  final dynamic photoSolutionUrl;
  final bool? isSaved;
  final String? tag;
  final List<Option>? options;
  final ReadingMaterial? readingMaterial;

  Question({
    this.id,
    this.description,
    this.difficultyLevel,
    this.topic,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.detailedSolution,
    this.type,
    this.isMandatory,
    this.showInFeed,
    this.pyqLabel,
    this.topicId,
    this.readingMaterialId,
    this.fixedAt,
    this.fixSummary,
    this.createdBy,
    this.updatedBy,
    this.quizLevel,
    this.questionFrom,
    this.language,
    this.photoUrl,
    this.photoSolutionUrl,
    this.isSaved,
    this.tag,
    this.options,
    this.readingMaterial,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    description: json["description"],
    difficultyLevel: json["difficulty_level"],
    topic: topicValues.map[json["topic"]]!,
    isPublished: json["is_published"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    detailedSolution: json["detailed_solution"],
    type: json["type"],
    isMandatory: json["is_mandatory"],
    showInFeed: json["show_in_feed"],
    pyqLabel: json["pyq_label"],
    topicId: json["topic_id"],
    readingMaterialId: json["reading_material_id"],
    fixedAt: json["fixed_at"] == null ? null : DateTime.parse(json["fixed_at"]),
    fixSummary: json["fix_summary"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    quizLevel: json["quiz_level"],
    questionFrom: questionFromValues.map[json["question_from"]]!,
    language: json["language"],
    photoUrl: json["photo_url"],
    photoSolutionUrl: json["photo_solution_url"],
    isSaved: json["is_saved"],
    tag: json["tag"],
    options:
        json["options"] == null
            ? []
            : List<Option>.from(
              json["options"]!.map((x) => Option.fromJson(x)),
            ),
    readingMaterial:
        json["reading_material"] == null
            ? null
            : ReadingMaterial.fromJson(json["reading_material"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "difficulty_level": difficultyLevel,
    "topic": topicValues.reverse[topic],
    "is_published": isPublished,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "detailed_solution": detailedSolution,
    "type": type,
    "is_mandatory": isMandatory,
    "show_in_feed": showInFeed,
    "pyq_label": pyqLabel,
    "topic_id": topicId,
    "reading_material_id": readingMaterialId,
    "fixed_at": fixedAt?.toIso8601String(),
    "fix_summary": fixSummary,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "quiz_level": quizLevel,
    "question_from": questionFromValues.reverse[questionFrom],
    "language": language,
    "photo_url": photoUrl,
    "photo_solution_url": photoSolutionUrl,
    "is_saved": isSaved,
    "tag": tag,
    "options":
        options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
    "reading_material": readingMaterial?.toJson(),
  };
}

class Option {
  final int? id;
  final String? description;
  final int? questionId;
  final bool? isCorrect;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? unanswered;
  final dynamic photoUrl;

  Option({
    this.id,
    this.description,
    this.questionId,
    this.isCorrect,
    this.createdAt,
    this.updatedAt,
    this.unanswered,
    this.photoUrl,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    description: json["description"],
    questionId: json["question_id"],
    isCorrect: json["is_correct"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    unanswered: json["unanswered"],
    photoUrl: json["photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "question_id": questionId,
    "is_correct": isCorrect,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "unanswered": unanswered,
    "photo_url": photoUrl,
  };
}

enum QuestionFrom { Q_BANK }

final questionFromValues = EnumValues({"Q-bank": QuestionFrom.Q_BANK});

class ReadingMaterial {
  final int? id;
  final String? keywords;
  final dynamic content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? contentSections;
  final PracticeMaterial? practiceMaterial;

  ReadingMaterial({
    this.id,
    this.keywords,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.contentSections,
    this.practiceMaterial,
  });

  factory ReadingMaterial.fromJson(
    Map<String, dynamic> json,
  ) => ReadingMaterial(
    id: json["id"],
    keywords: json["keywords"],
    content: json["content"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    contentSections:
        json["content_sections"] == null
            ? []
            : List<String>.from(json["content_sections"]!.map((x) => x)),
    practiceMaterial:
        json["practice_material"] == null
            ? null
            : PracticeMaterial.fromJson(json["practice_material"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "keywords": keywords,
    "content": content,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "content_sections":
        contentSections == null
            ? []
            : List<dynamic>.from(contentSections!.map((x) => x)),
    "practice_material": practiceMaterial?.toJson(),
  };
}

class PracticeMaterial {
  final List<String>? content;
  final List<String>? keywords;

  PracticeMaterial({this.content, this.keywords});

  factory PracticeMaterial.fromJson(Map<String, dynamic> json) =>
      PracticeMaterial(
        content:
            json["content"] == null
                ? []
                : List<String>.from(json["content"]!.map((x) => x)),
        keywords:
            json["keywords"] == null
                ? []
                : List<String>.from(json["keywords"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "content":
        content == null ? [] : List<dynamic>.from(content!.map((x) => x)),
    "keywords":
        keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
  };
}

enum Topic { MOLECULAR_BASIS_OF_INHERITANCE }

final topicValues = EnumValues({
  "Molecular Basis Of Inheritance ": Topic.MOLECULAR_BASIS_OF_INHERITANCE,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
