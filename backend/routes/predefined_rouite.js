const express = require("express");
const router = express.Router();
const {
  getPredefinedList,
  getPredefinedById,
  savePredefined,
  updatePredefined,
  deletePredefined,
} = require("../controller/predefined_controller");

// Route to get all Predefineds
router.post("/list-by-type", getPredefinedList);

// Route to get a Predefined by its ID
router.get("/:id", getPredefinedById);
router.patch("/:id", updatePredefined);
router.delete("/:id", deletePredefined);

// Route to create a new Predefined
router.post("/save", savePredefined);

module.exports = router;
