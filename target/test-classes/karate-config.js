function fn() {
  var env = karate.env || 'dev';

  var config = {
    env: env,
    // Use a public API without bot protection for demo tests.
    baseUrl: 'https://jsonplaceholder.typicode.com'
  };

  return config;
}

