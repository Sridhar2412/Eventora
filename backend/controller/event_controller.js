const Event = require("../models/event_model"); // Importing the Event model
const {getEventListQuery,getUpcomingEventListQuery}= require("../queries/query")
// Controller function to handle GET /events request
const getEvents = async (req, res) => {
  try {
    // Get the isUpcoming flag from the request query or body
    const { isUpcoming } = req.query; // Assuming the flag is passed as a query parameter (e.g., /events?isUpcoming=true)

    // Define the query based on the isUpcoming flag
    let query = getEventListQuery;

    // If isUpcoming is true, filter for upcoming events
    if (isUpcoming === "true") {
      query =getUpcomingEventListQuery;
    }

    // Execute the query (assuming you're using Sequelize ORM or raw SQL query)
    const events = await Event.sequelize.query(query, {
      type: Event.sequelize.QueryTypes.SELECT,
    });

    // Check if no events were found
    if (!events || events.length === 0) {
      return res.status(404).json({
        status: "ERROR",
        code: "404",
        error: { message: "No events found" },
      });
    }

    // Return the response with the list of events
    return res.status(200).json({
      status: "OK",
      code: "200",
      data: events,
    });
  } catch (e) {
    return res.status(400).json({
      status: "ERROR",
      code: "400",
      error: { message: `Error: ${e.message}` },
    });
  }
};

// Controller function to handle GET /events/:id request
const getEventById = async (req, res) => {
  const eventId = req.params.id;
  try {
    const event = await Event.findByPk(eventId); // Fetch event by primary key (ID)
    if (!event) {
      return res.status(400).json({
        status: "ERROR",
        code: "400",
        error: { message: "Event not found" },
      });
    }
    return res.status(200).json({
      status: "OK",
      code: "200",
      data: event,
    });
  } catch (e) {
    return res.status(400).json({
      status: "ERROR",
      code: "400",
      error: { message: `${e}` },
    });
  }
};

// Controller function to handle POST /events request
const saveEvent = async (req, res) => {
  const {
    event_name,
    event_date,
    city,
    description,
    category,
    latitude,
    longitude,
  } = req.body;
  try {
    const newEvent = await Event.create({
      event_name,
      event_date,
      city,
      description,
      category,
      latitude,
      longitude,
    });
    return res.status(201).json(newEvent); // Return the created Event
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: "Failed to create Event" });
  }
};

// Controller function to handle PUT /events/:id request
const updateEvent = async (req, res) => {
  const eventId = req.params.id; // Get eventId from the URL parameter
  const {
    event_name,
    event_date,
    city,
    description,
    category,
    latitude,
    longitude,
  } = req.body; // Get the new event data from the request body

  try {
    // Prepare the update object with only the fields that were provided
    const updateData = {};

    if (event_name) updateData.event_name = event_name;
    if (event_date) updateData.event_date = event_date;
    if (city) updateData.city = city;
    if (description) updateData.description = description;
    if (category) updateData.category = category;
    if (latitude) updateData.latitude = latitude;
    if (longitude) updateData.longitude = longitude;

    // Update the event in the database
    const [updated] = await Event.update(updateData, {
      where: { event_id: eventId }, // Only update the event with the specified eventId
    });

    if (updated) {
      return res.status(200).json({
        status: "OK",
        code: "200",
        data: "Event updated successfully",
      });
    } else {
      return res.status(400).json({
        status: "ERROR",
        code: "400",
        error: { message: "Event not found" },
      });
    }
  } catch (e) {
    return res.status(400).json({
      status: "ERROR",
      code: "400",
      error: { message: `${e}` },
    });
  }
};

// Controller function to handle DELETE /events/:id request
const deleteEvent = async (req, res) => {
  const eventId = req.params.id;
  try {
    const event = await Event.destroy({
      where: { event_id: eventId },
    }); // Delete event by primary key (ID)

    if (!event) {
      return res.status(400).json({
        status: "ERROR",
        code: "400",
        error: { message: "Event not found" },
      });
    }

    return res.status(200).json({
      status: "OK",
      code: "200",
      data: "Event deleted successfully",
    });
  } catch (e) {
    return res.status(400).json({
      status: "ERROR",
      code: "400",
      error: { message: `${e}` },
    });
  }
};

module.exports = {
  getEvents,
  getEventById,
  saveEvent,
  updateEvent,
  deleteEvent,
};
