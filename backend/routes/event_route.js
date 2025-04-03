const express = require("express");
const router = express.Router();
const {
  getEvents,
  getMyEventList,
  getEventsByCategory,
  getEventById,
  saveEvent,
  updateEvent,
  deleteEvent,
} = require("../controller/event_controller");

// Route to get all Events
router.get("/list", getEvents);
router.post("/myEvent/list", getMyEventList);
router.post("/list-by-category", getEventsByCategory);

// Route to get a Event by its ID
router.get("/:id", getEventById);
router.patch("/:id", updateEvent);
router.delete("/:id", deleteEvent);

// Route to create a new Event
router.post("/save", saveEvent);

module.exports = router;
