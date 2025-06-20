@REQ_MARVEL-005 @HU005 @character_deletion @marvel_api @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-005 Eliminar personaje (microservicio para gestión de personajes)
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

  @id:1 @eliminarPersonaje @solicitudExitosa204
  Scenario: T-API-MARVEL-005-CA01-Eliminar personaje exitosamente 204 - karate
    * path '/api/characters/2121'
    When method DELETE
    Then status 204
    # And match response == ''
    # And match responseStatus == 204

  @id:2 @eliminarPersonaje @errorNoEncontrado404
  Scenario: T-API-MARVEL-005-CA02-Eliminar personaje que no existe 404 - karate
    * path '/api/characters/-1'
    When method DELETE
    Then status 404
    # And match response.error == 'Character not found'
    # And match response != null

