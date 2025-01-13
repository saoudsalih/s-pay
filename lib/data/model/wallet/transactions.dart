// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

List<TransactionsModel> transactionsFromJson(List<dynamic> json) =>
    List<TransactionsModel>.from(json.map((data) => TransactionsModel.fromJson(data)));


String transactionsToJson(List<TransactionsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionsModel {
    String? senderId;
    String? name;
    DateTime? transactionDate;
    String? amount;
    String? transactionType;
    String? description;
    String? id;

    TransactionsModel({
        this.senderId,
        this.name,
        this.transactionDate,
        this.amount,
        this.transactionType,
        this.description,
        this.id,
    });

    factory TransactionsModel.fromJson(Map<String, dynamic> json) {
      return TransactionsModel(
        senderId: json["sender_id"],
        name: json["name"],
        transactionDate: json["transaction_date"] == null ? null : DateTime.parse(json["transaction_date"]),
        amount: json["amount"],
        transactionType: json["transaction_type"],
        description: json["description"],
        id: json["id"],
    );
    } 

    Map<String, dynamic> toJson() => {
        "sender_id": senderId,
        "name": name,
        "transaction_date": transactionDate?.toIso8601String(),
        "amount": amount,
        "transaction_type": transactionType,
        "description": description,
        "id": id,
    };
}
