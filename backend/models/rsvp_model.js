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
const User = require("./user_model"); // Replace with actual path
const Event = require("./event_model"); // Replace with actual path
// Define the RSVP model
const RSVP = sequelize.define(
  "RSVP",
  {
    rsvpId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      //   autoIncrement: true,
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "users", // The table name for the user model
        key: "userId",
      },
      onDelete: "CASCADE", // Delete RSVP record if user is deleted
    },
    eventId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "events", // The table name for the event model
        key: "eventId",
      },
      onDelete: "CASCADE", // Delete RSVP record if event is deleted
    },
    rsvpStatus: {
      type: DataTypes.BOOLEAN,
      defaultValue: false, // Default to false (not attending)
      allowNull: false,
    },
  },
  {
    tableName: "rsvp", // This is the name of your table
    timestamps: false, // If you don't want the `createdAt` and `updatedAt` fields
  }
);

// Syncing RSVP model
sequelize
  .sync()
  .then(() => console.log("RSVP table has been synced successfully."))
  .catch((err) => console.log("Error syncing RSVP table:", err));

// Define associations (relationships) between models

// RSVP belongs to one User
RSVP.belongsTo(User, { foreignKey: "userId", as: "users" });

// RSVP belongs to one Event
RSVP.belongsTo(Event, { foreignKey: "eventId", as: "events" });

module.exports = RSVP;
