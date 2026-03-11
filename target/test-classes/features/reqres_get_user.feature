@ignore
Feature: Get user (ReqRes)

  Background:
    * url 'https://reqres.in/api'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    # Some environments receive 403 from Cloudflare; remove @ignore when reachable.

    * def userResponseSchema =
    """
    {
      data: {
        id: '#number',
        email: '#string',
        first_name: '#string',
        last_name: '#string'
      }
    }
    """

 
  Scenario: Positive - get existing user
    Given path 'users', 2
    When method GET
    Then status 200
    And match response == userResponseSchema
    And match response.data.id == 2

  
  Scenario: Negative - invalid user id
    Given path 'users', 0
    When method GET
    Then status 404

  
  Scenario: Response schema validation
    Given path 'users', 2
    When method GET
    Then status 200
    And match response == userResponseSchema

