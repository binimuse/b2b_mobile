class DepositeQueryMutation {
  static const String deposite = r'''
    mutation ($amount: Float!, $reference_number: String!,$slip:Upload!){
    action: depositWithSlip(input: {
      amount: $amount,
      reference_number: $reference_number,   
      slip: $slip,   
     
    }) {
        reference_number
      }
    }
    ''';
}

class AppDataMutation {
  dynamic getAppData() {
    return """
              query {
        depositWithSlipHistory {
    id
    reference_number
    amount
    confirmed_at
  }
              }
    """;
  }
}
