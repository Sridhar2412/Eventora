
//Queries
const getEventListQuery = 'SELECT * FROM events';
const getUpcomingEventListQuery = `${getEventListQuery} WHERE event_date > CURDATE() ORDER BY event_date ASC`;

module.exports = {
  getEventListQuery,
  getUpcomingEventListQuery
}