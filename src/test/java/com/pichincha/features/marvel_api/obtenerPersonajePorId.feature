@REQ_MARVEL-002 @HU002 @character_by_id @marvel_api @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-002 Obtener personaje por ID (microservicio para gestión de personajes)
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


  @id:1 @obtenerPersonajePorId @errorNoEncontrado404
  Scenario: T-API-MARVEL-002-CA02-Obtener personaje por ID que no existe 404 - karate
    * path '/api/characters/-1'
    When method GET
    Then status 404
    # And match response.error == 'Character not found'
    # And match response != null

