@REQ_MARVEL-001 @HU001 @character_retrieval @marvel_api @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-001 Obtener todos los personajes de Marvel (microservicio para gestión de personajes)
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

  @id:1 @obtenerPersonajes @solicitudExitosa200
  Scenario: T-API-MARVEL-001-CA01-Obtener todos los personajes exitosamente 200 - karate
    When method GET
    Then status 200
    # And match response != null
    # And match response == '#array'

