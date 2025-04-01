require('dotenv').config();

const dbName = process.env.DB_NAME;
const dbHost = process.env.DB_HOST;
const dbUser = process.env.DB_USER;
const dbPass = process.env.DB_PASS;
const dbPort = process.env.DB_PORT;
const jwtSecret = process.env.JWT_SECRET;

module.exports = {
  dbName,dbHost,dbPort,dbUser,dbPass,jwtSecret
}