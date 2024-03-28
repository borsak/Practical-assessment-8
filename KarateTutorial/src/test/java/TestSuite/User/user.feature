Feature: User Module

  Scenario: Creates list of users with given input array
    Given url 'https://petstore.swagger.io/v2/user/createWithArray'
    And request
    """
    [
    {
        "id": 2001,
        "username": "borsak123",
        "firstName": "Borsak",
        "lastName": "sihombing",
        "email": "user1@example.com",
        "password": "P@ssw0rd",
        "phone": "081278890000",
        "userStatus": 1
     },
     {
        "id": 2002,
        "username": "budi123",
        "firstName": "Budi",
        "lastName": "Man",
        "email": "user2@example.com",
        "password": "P@ssw0rd",
        "phone": "081278890001",
        "userStatus": 1
    }
    ]
    """
    When method POST
    Then status 200
    And match response == {code: 200, type: 'unknown', message: 'ok'}
    And print response

  Scenario: Creates list of users with given input array
    Given url "https://petstore.swagger.io/v2/user/createWithList"
    And request
    """
        [
        {
            "id": 2003,
            "username": "danu123",
            "firstName": "Danu",
            "lastName": "Putra",
            "email": "user3@example.com",
            "password": "P@ssw0rd",
            "phone": "081278890002",
            "userStatus": 1
        }
    ]
    """
    When method POST
    Then status 200
    And match response == {"code": 200, "type": "unknown", "message": "ok"}

  Scenario: Get user by username
    When url "https://petstore.swagger.io/v2/user/string"
    When method get
    Then print response
    And status 200

  Scenario: updated user
    Given url "https://petstore.swagger.io/v2/user/borsak123"
    And request
    """
    {
      "id": 2001,
      "username": "Fitra123",
      "firstName": "Fitra",
      "lastName": "putra",
      "email": "user4@example.com",
      "password": "P@ssw0rd",
      "phone": "081278890003",
      "userStatus": 1
    }
    """
    When method put
    Then print response
    And status 200


  Scenario: delete user
    When url "https://petstore.swagger.io/v2/user/string"
    When method delete
    Then print response
    And status 200

  Scenario: Logs user into the system
    When url "https://petstore.swagger.io/v2/user/login?username=borsak123&password=P@ssw0rd"
    When method get
    Then print response
    And status 200

  Scenario: Logs out current logged in user session
    When url "https://petstore.swagger.io/v2/user/logout"
    When method get
    Then print response
    And status 200

  Scenario: create user
    Given url "https://petstore.swagger.io/v2/user"
    And request
    """
     {
      "id": 2004,
      "username": "nila123",
      "firstName": "Nila",
      "lastName": "sari",
      "email": "user5@example.com",
      "password": "P@ssw0rd",
      "phone": "081278890005",
      "userStatus": 1
    }
    """
    When method post
    Then print response
    And status 200



