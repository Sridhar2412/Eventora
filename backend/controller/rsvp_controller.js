const RSVP = require("../models/rsvp_model"); // Importing the RSVP model
const Event = require("../models/event_model"); // Importing the Event model

const getMyRsvpStatus = async (req, res) => {
  const userId = parseInt(req.body.userId);
  const eventId = parseInt(req.body.eventId);
  const rsvpStatus = await RSVP.findOne({
    where: { userId: userId, eventId: eventId },
  });
  if (!rsvpStatus) {
    return res.status(200).json({
      status: "OK",
      code: "200",
      data: false,
    });
  } else {
    return res.status(200).json({
      status: "OK",
      code: "200",
      data: rsvpStatus.rsvpStatus,
    });
  }
};

const updateRsvpStatus = async (req, res) => {
  const userId = parseInt(req.body.userId);
  const eventId = parseInt(req.body.eventId);
  try {
    // Check if an RSVP already exists for the user and event
    const existingRsvp = await RSVP.findOne({
      where: { userId: userId, eventId: eventId },
    });

    let data = await RSVP.findAll();

    if (!existingRsvp) {
      console.log(data);
      existingRsvp = await RSVP.create({
        rsvpId: data.length + 1,
        userId,
        eventId,
        rsvpStatus: true, // Default to attending (can change as needed)
      });

      // Increment the event's attendance count since the user is attending
      await Event.increment("attendenceCount", {
        by: 1,
        where: { event_id: eventId },
      });
      return res.status(200).json({
        status: "OK",
        code: "200",
        message: `RSVP created and user is set as attending. Event attendance count has been incremented.`,
      });
      //   return {
      //     message: `RSVP created and user is set as attending. Event attendance count has been incremented.`,
      //     rsvp_status: existingRsvp.rsvp_status,
      //   };
    }

    // If RSVP exists, toggle the RSVP status (if null or false, set it to true; if true, set it to false)
    const newRsvpStatus = existingRsvp.rsvpStatus === true ? false : true;

    // Update the RSVP status
    await existingRsvp.update({ rsvpStatus: newRsvpStatus });

    // Adjust the attendance count based on the new RSVP status
    if (newRsvpStatus) {
      // If the user is now attending, increment the attendance count
      await Event.increment("attendenceCount", {
        by: 1,
        where: { event_id: eventId },
      });
      return res.status(200).json({
        status: "OK",
        code: "200",
        message: `RSVP status updated to ${
          newRsvpStatus ? "attending" : "not attending"
        }.`,
      });
    } else {
      // If the user is no longer attending, decrement the attendance count
      await Event.decrement("attendenceCount", {
        by: 1,
        where: { event_id: eventId },
      });
      return res.status(200).json({
        status: "OK",
        code: "200",
        message: `RSVP status updated to ${
          newRsvpStatus ? "attending" : "not attending"
        }.`,
      });
    }

    // return {
    //   message: `RSVP status updated to ${newRsvpStatus ? "attending" : "not attending"}.`,
    //   rsvp_status: newRsvpStatus,
    // };
  } catch (e) {
    //   console.error("Error toggling RSVP status:", error);
    return res.status(400).json({
      status: "ERROR",
      code: "400",
      error: { message: `Error: ${e.message}` },
    });
    // return { error: "Something went wrong while updating RSVP status." };
  }
};

module.exports = { getMyRsvpStatus, updateRsvpStatus };
