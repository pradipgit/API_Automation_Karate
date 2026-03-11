Feature: Posts endpoints

  Background:
    * url baseUrl

  Scenario: List posts
    Given path 'posts'
    When method GET
    Then status 200
    And match response == '#[100]'
    And match response[0].id == '#number'

  Scenario: Get a single post
    Given path 'posts', 1
    When method GET
    Then status 200
    And match response ==
    """
    { id: 1, userId: '#number', title: '#string', body: '#string' }
    """

  Scenario: Create a post
    Given path 'posts'
    And request { title: 'Karate demo', body: 'Created via Karate', userId: 1 }
    When method POST
    Then status 201
    And match response.title == 'Karate demo'
    And match response.id == '#number'

  Scenario: Update a post (PUT)
    Given path 'posts', 1
    And request read('classpath:payloads/updatePost.json')
    When method PUT
    Then status 200
    And match response.title == 'Karate updated title'
    And match response.id == 1

  Scenario: Delete a post
    Given path 'posts', 1
    When method DELETE
    Then status 200

