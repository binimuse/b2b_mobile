class ProdactDeatilQueryMutation {
  static const String getMyProdactDetail = r'''
mutation($id: ID!) {
    product(id: $id) {
        id
        name
        images
        description
          skus {
            id
            price
            variants {
                attribute {
                    name
                }
                attributeValue {
                    value
                }
            }
        }
        
    }
}
 ''';
}
