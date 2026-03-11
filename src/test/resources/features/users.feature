Feature: Users endpoints

  Background:
    * url baseUrl
    * def userSchema =
    """
    {
      id: '#number',
      name: '#string',
      username: '#string',
      email: '#string',
      address: {
        street: '#string',
        suite: '#string',
        city: '#string',
        zipcode: '#string',
        geo: { lat: '#string', lng: '#string' }
      },
      phone: '#string',
      website: '#string',
      company: { name: '#string', catchPhrase: '#string', bs: '#string' }
    }
    """

  Scenario: List users (positive)
    Given path 'users'
    When method GET
    Then status 200
    And match response == '#[]'
    And match response == '#[10]'
    And match each response == userSchema

  Scenario Outline: Get user by id (positive, data-driven)
    Given path 'users', <id>
    When method GET
    Then status 200
    And match response == userSchema
    And match response.id == <id>

    Examples:
      | read('classpath:testdata/users.json') |

  Scenario Outline: Get user by id (negative - not found)
    Given path 'users', <id>
    When method GET
    Then status 404

    Examples:
      | id   |
      | 0    |
      | 9999 |
      | -1   |

  Scenario: Get user by id (negative - invalid type)
    Given path 'users', 'abc'
    When method GET
    Then status 404

