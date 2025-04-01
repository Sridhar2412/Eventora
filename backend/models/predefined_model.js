const { Sequelize, DataTypes } = require("sequelize");
const {
  dbName,
  dbHost,
  dbPort,
  dbUser,
  dbPass,
  jwtSecret,
} = require("../services/config");

// Initialize Sequelize with MySQL connection
const sequelize = new Sequelize(
  `mysql://${dbUser}:${dbPass}@${dbHost}:${dbPort}/${dbName}`
); // Replace with your DB credentials

// Define the Predefined model
const Predefined = sequelize.define(
  "Predefined",
  {
    predefinedId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    parentId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    entityType: {
      type: DataTypes.STRING(255),
      allowNull: false, // This field cannot be null
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: false, // This field cannot be null
    },
    code: {
      type: DataTypes.STRING(255),
      allowNull: false, // This field cannot be null
    },
  },
  {
    tableName: "predefined", // This is the name of your table
    timestamps: false, // If you don't want the `createdAt` and `updatedAt` fields
  }
);

// Synchronize the model with the database (creates table if it doesn't exist)
sequelize
  .sync()
  .then(() => console.log("Predefined table has been synced successfully."))
  .catch((err) => console.log("Error syncing Predefined table:", err));

module.exports = Predefined;
