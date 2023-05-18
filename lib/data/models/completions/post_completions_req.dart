class PostCompletionsReq {
  String? model;
  String? prompt;
  int? maxTokens;

  PostCompletionsReq({this.model, this.prompt, this.maxTokens});

  PostCompletionsReq.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    prompt = json['prompt'];
    maxTokens = json['max_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.model != null) {
      data['model'] = this.model;
    }
    if (this.prompt != null) {
      data['prompt'] = this.prompt;
    }
    if (this.maxTokens != null) {
      data['max_tokens'] = this.maxTokens;
    }
    return data;
  }
}
