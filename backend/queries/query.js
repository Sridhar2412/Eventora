//Queries
const getEventListQuery = "SELECT * FROM events";
const getUpcomingEventListQuery = `${getEventListQuery} WHERE event_date > CURDATE() ORDER BY event_date ASC`;
const getPredefinedListQuery = "SELECT * FROM predefined";
const getMyEvents = `SELECT e.* FROM events e JOIN rsvp r ON e.event_id = r.eventId`;
module.exports = {
  getEventListQuery,
  getUpcomingEventListQuery,
  getPredefinedListQuery,
  getMyEvents,
};
