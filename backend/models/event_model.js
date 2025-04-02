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

const Event = sequelize.define(
  "Event",
  {
    event_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    event_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    event_date: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    city: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    category: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    latitude: {
      type: DataTypes.DECIMAL(9, 6),
      allowNull: true,
    },
    longitude: {
      type: DataTypes.DECIMAL(9, 6),
      allowNull: true,
    },
    attendenceCount: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  },
  {
    tableName: "events", // This is the name of your table
    timestamps: false, // If you don't want the `createdAt` and `updatedAt` fields
  }
);

sequelize
  .sync()
  .then(() => console.log("Event table has been synced successfully."))
  .catch((err) => console.log("Error syncing Event table:", err));

module.exports = Event;
