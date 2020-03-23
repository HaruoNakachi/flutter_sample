class QueryMutation {
  String addPerson(String id, String name, String lastName, int age) {
    return """
      mutation{
          addPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            id
            name
            lastName
            age
          }
      }
    """;
  }

  String getAll = """
          query listPostModels {
            listPostModels {
              items {
                id
                title
                description
                image
              }
            }
          }
        """;


  String deletePerson(id){
    return """
      mutation{
        deletePerson(id: "$id"){
          id
        }
      }
    """;
  }


  String editPerson(String id, String name, String lastName, int age){
    return """
      mutation{
          editPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            name
            lastName
          }
      }
     """;
  }
}