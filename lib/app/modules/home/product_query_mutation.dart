class ProdactQueryMutation {
  dynamic getMyProdact(int first, int page) {
    return """
query {
    products(first: $first, page: $page) {
        data {
             id
            name 
            images
            description          
      
        }
    }
}
    """;
  }
}
