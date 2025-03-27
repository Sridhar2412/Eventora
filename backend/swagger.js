const swaggerJSDoc = require('swagger-jsdoc');
const fs = require('fs');
const yaml = require('yamljs');

// Swagger definition configuration
const swaggerDefinition = {
  openapi: '3.0.0',
  info: {
    title: 'My API',
    version: '1.0.0',
    description: 'A simple API to demonstrate Swagger in Node.js',
  },
  servers: [
    {
      url: 'http://localhost:3000',
      description: 'Local server',
    },
  ],
};

// Options for swagger-jsdoc
const options = {
  swaggerDefinition,
  apis: ['./routes/*.js'],
};

// Generate Swagger specification (JSON)
const swaggerSpec = swaggerJSDoc(options);

// Convert the swaggerSpec to YAML and save it to a file
const yamlStr = yaml.dump(swaggerSpec);
fs.writeFileSync('../swagger.yaml', yamlStr, 'utf8');

console.log('swagger.yaml file generated!');
