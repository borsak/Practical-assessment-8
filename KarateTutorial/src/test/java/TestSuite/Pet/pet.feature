Feature: Pet Module

  Background:
  Given url "https://petstore.swagger.io/v2"
    And print "--Connect petstore API--"

  Scenario: Add pet to store
    Given url "https://petstore.swagger.io/v2/pet"
    And request
    """
    { "id": 982910,
    "category": {"id": 982910,"name": "string"},
    "name": "doggie",
    "photoUrls": ["string"],
    "tags": [{"id": 982910,"name": "string"}],
    "status": "available"}
    """
    When method post
    Then print response
    And status 200

    Scenario: get pet
      When url "https://petstore.swagger.io/v2/pet/982910"
      When method get
      Then print response
      And status 200

  Scenario: get pet by status
    When url "https://petstore.swagger.io/v2/pet/findByStatus"
    And params {status:available}
    When method get
    Then print response
    And status 200

    Scenario: delete pet
      When url "https://petstore.swagger.io/v2/pet/982910"
      When method delete
      Then print response
      And status 200

      Scenario: check pet after delete
        When url "https://petstore.swagger.io/v2/pet/982910"
        When method get
        Then print response
        And status 404