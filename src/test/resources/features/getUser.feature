Feature: Get user API

Scenario: Verify user details

Given url baseUrl
And path 'users/2'

When method GET

Then status 200
And print response
And match response.id == 2
And match response.username == '#string'