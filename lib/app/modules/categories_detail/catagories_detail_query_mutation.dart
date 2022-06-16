class CatagoriesDeatilQueryMutation {
  static const String getMyDrugCatagoriesDetail = r'''
mutation($id: ID!) {
    category(id: $id) {
    
        children {
            id
            name
            image
            
        }
    }
}
 ''';
}
