@REQ_MARVEL-003 @HU003 @character_creation @marvel_api @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-003 Crear personaje (microservicio para gestión de personajes)
  Background:
    * configure ssl = true
    * url port_marvel_api
    * path '/api/characters'
    * def generarHeaders =
      """
      function() {
        return {
          "Content-Type": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @crearPersonaje @solicitudExitosa201
  Scenario: T-API-MARVEL-003-CA01-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_api/request_create_character.json')
    And request jsonData
    When method POST
    Then status 201
    # And match response != null
    # And match response.name == 'Iron Man'

  @id:2 @crearPersonaje @errorDuplicado400
  Scenario: T-API-MARVEL-003-CA02-Crear personaje con nombre duplicado 400 - karate
    * def jsonData = read('classpath:data/marvel_api/request_duplicate_character.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.error == 'Character name already exists'
    # And match response != null

  @id:3 @crearPersonaje @errorValidacion400
  Scenario: T-API-MARVEL-003-CA03-Crear personaje con datos inválidos 400 - karate
    * def jsonData = read('classpath:data/marvel_api/request_invalid_character.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.name == 'Name is required'
    # And match response.alterego == 'Alterego is required'

