//Queries
const getEventListQuery = "SELECT * FROM events";
const getUpcomingEventListQuery = `${getEventListQuery} WHERE event_date > CURDATE() ORDER BY event_date ASC`;
const getPredefinedListQuery = "SELECT * FROM predefined";

module.exports = {
  getEventListQuery,
  getUpcomingEventListQuery,
  getPredefinedListQuery,
};
