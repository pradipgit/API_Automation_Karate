Feature: Comments endpoints

  Background:
    * url baseUrl

  Scenario: Get comments for a post
    Given path 'posts', 1, 'comments'
    When method GET
    Then status 200
    And match response == '#[]'
    And match response[0] ==
    """
    { postId: 1, id: '#number', name: '#string', email: '#string', body: '#string' }
    """

