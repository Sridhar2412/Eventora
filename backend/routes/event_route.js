const express = require('express');
const router = express.Router();
const {
    getEvents, getEventById, saveEvent,updateEvent,deleteEvent
  } = require('../controller/event_contriller');

// Route to get all Events
router.get('/list',getEvents);

// Route to get a Event by its ID
router.get('/:id', getEventById);
router.patch('/:id', updateEvent);
router.delete('/:id', deleteEvent);

// Route to create a new Event
router.post('/save', saveEvent);


module.exports = router;
