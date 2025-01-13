


class TransactionEntity {
    String? userId;
    String? name;
    DateTime? transactionDate;
    String? amount;
    String? transactionType;
    String? description;
    String? id;

    TransactionEntity({
        this.userId,
        this.name,
        this.transactionDate,
        this.amount,
        this.transactionType,
        this.description,
        this.id,
    });
}