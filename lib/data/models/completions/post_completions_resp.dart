class PostCompletionsResp {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;

  PostCompletionsResp(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage});

  PostCompletionsResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices?.add(Choices.fromJson(v));
      });
    }
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.object != null) {
      data['object'] = this.object;
    }
    if (this.created != null) {
      data['created'] = this.created;
    }
    if (this.model != null) {
      data['model'] = this.model;
    }
    if (this.choices != null) {
      data['choices'] = this.choices?.map((v) => v.toJson()).toList();
    }
    if (this.usage != null) {
      data['usage'] = this.usage?.toJson();
    }
    return data;
  }
}

class Choices {
  String? text;
  int? index;
  dynamic logprobs;
  String? finishReason;

  Choices({this.text, this.index, this.logprobs, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    index = json['index'];
    logprobs = json['logprobs'];
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.text != null) {
      data['text'] = this.text;
    }
    if (this.index != null) {
      data['index'] = this.index;
    }
    if (this.logprobs != null) {
      data['logprobs'] = this.logprobs;
    }
    if (this.finishReason != null) {
      data['finish_reason'] = this.finishReason;
    }
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.promptTokens != null) {
      data['prompt_tokens'] = this.promptTokens;
    }
    if (this.completionTokens != null) {
      data['completion_tokens'] = this.completionTokens;
    }
    if (this.totalTokens != null) {
      data['total_tokens'] = this.totalTokens;
    }
    return data;
  }
}
