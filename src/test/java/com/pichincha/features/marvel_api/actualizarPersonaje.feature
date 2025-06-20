@REQ_MARVEL-004 @HU004 @character_update @marvel_api @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-004 Actualizar personaje (microservicio para gestión de personajes)
  Background:
    * configure ssl = true
    * url port_marvel_api
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

  @id:1 @actualizarPersonaje @solicitudExitosa200
  Scenario: T-API-MARVEL-004-CA01-Actualizar personaje exitosamente 200 - karate
    * path '/api/characters/2382'
    * def jsonData = read('classpath:data/marvel_api/request_update_character.json')
    And request jsonData
    When method PUT
    Then status 200
    # And match response != null
    # And match response.description == 'Updated description'

  @id:2 @actualizarPersonaje @errorNoEncontrado404
  Scenario: T-API-MARVEL-004-CA02-Actualizar personaje que no existe 404 - karate
    * path '/api/characters/999'
    * def jsonData = read('classpath:data/marvel_api/request_update_character.json')
    And request jsonData
    When method PUT
    Then status 404
    # And match response.error == 'Character not found'
    # And match response != null

  @id:3 @actualizarPersonaje @errorValidacion400
  Scenario: T-API-MARVEL-004-CA03-Actualizar personaje con datos inválidos 400 - karate
    * path '/api/characters/1'
    * def jsonData = read('classpath:data/marvel_api/request_invalid_character.json')
    And request jsonData
    When method PUT
    Then status 400
    # And match response.name == 'Name is required'
    # And match response.alterego == 'Alterego is required'

