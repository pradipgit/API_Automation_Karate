Feature: Create user

Scenario: Create a new user

Given url baseUrl
And path 'posts'
And request read ('classpath:payloads/createUser.json')
When method POST
And print response
Then status 201
And match response.title == "Karate demo"


Scenario Outline: Get user data

Given url baseUrl
And path 'users/<id>'

When method GET

Then status 200

Examples:
| read('classpath:testdata/users.json') |