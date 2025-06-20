function fn() {
  var env = karate.env || 'local';
  
  // Configuración base para todos los entornos
  var config = {
    baseUrl: 'http://localhost:8080',
    ssl: true
  };
  
  // URLs para todos los microservicios (nombrados con formato port_nombre_microservicio)
  config.port_marvel_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser';
  
  // Configuración específica por entorno
  if (env == 'dev') {
    config.baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser';
    config.port_marvel_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser';
  } 
  else if (env == 'qa') {
    config.baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser';
    config.port_marvel_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser';
  }
  
  return config;
}
