const express = require("express");
const router = express.Router();
const {
  updateRsvpStatus,
  getMyRsvpStatus,
} = require("../controller/rsvp_controller");

router.post("/updateRsvp", updateRsvpStatus);
router.post("/getMyRsvpStatus", getMyRsvpStatus);

module.exports = router;
