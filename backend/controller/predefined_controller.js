const Predefined = require("../models/predefined_model"); // Importing the Predefined model
const { getPredefinedListQuery } = require("../queries/query");
// Controller function to handle GET /Predefineds request
const getPredefinedList = async (req, res) => {
  try {
    let query = getPredefinedListQuery;

    if (req.body.entityType != null) {
      query = `${getPredefinedListQuery} WHERE entityType="${req.body.entityType.toString()}"`;
    }
    // Execute the query (assuming you're using Sequelize ORM or raw SQL query)
    const categoryList = await Predefined.sequelize.query(query, {
      type: Predefined.sequelize.QueryTypes.SELECT,
    });

    // Check if no Predefineds were founds
    if (!categoryList || categoryList.length === 0) {
      return res.status(404).json({
        status: "ERROR",
        code: "404",
        error: { message: "No Predefineds found" },
      });
    }

    // Return the response with the list of Predefineds
    return res.status(200).json({
      status: "OK",
      code: "200",
      data: categoryList,
    });
  } catch (e) {
    return res.status(400).json({
      status: "ERROR",
      code: "400",
      error: { message: `Error: ${e.message}` },
    });
  }
};

// Controller function to handle GET /Predefineds/:id request
const getPredefinedById = async (req, res) => {};

// Controller function to handle POST /Predefineds request
const savePredefined = async (req, res) => {
  const { predefinedId, parentId, entityType, name, code } = req.body;
  try {
    const newPredefined = await Predefined.create({
      predefinedId,
      parentId,
      entityType,
      name,
      code,
    });
    return res.status(201).json(newPredefined); // Return the created Predefined
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: "Failed to create Predefined" });
  }
};

// Controller function to handle PUT /Predefineds/:id request
const updatePredefined = async (req, res) => {
  const predefinedid = req.params.id; // Get PredefinedId from the URL parameter
  const { predefinedId, parentId, entityType, name, code } = req.body; // Get the new Predefined data from the request body

  try {
    // Prepare the update object with only the fields that were provided
    const updateData = {};

    if (predefinedId) updateData.predefinedId = predefinedId;
    if (parentId) updateData.parentId = parentId;
    if (entityType) updateData.entityType = entityType;
    if (name) updateData.name = name;
    if (code) updateData.code = code;

    // Update the Predefined in the database
    const [updated] = await Predefined.update(updateData, {
      where: { predefinedId: predefinedid }, // Only update the Predefined with the specified PredefinedId
    });

    if (updated) {
      return res.status(200).json({
        status: "OK",
        code: "200",
        data: "Predefined updated successfully",
      });
    } else {
      return res.status(400).json({
        status: "ERROR",
        code: "400",
        error: { message: "Predefined not found" },
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

// Controller function to handle DELETE /Predefineds/:id request
const deletePredefined = async (req, res) => {
  const predefinedId = req.params.id;
  try {
    const predefined = await Predefined.destroy({
      where: { predefinedId: predefinedId },
    }); // Delete Predefined by primary key (ID)

    if (!predefined) {
      return res.status(400).json({
        status: "ERROR",
        code: "400",
        error: { message: "Predefined not found" },
      });
    }

    return res.status(200).json({
      status: "OK",
      code: "200",
      data: "Predefined deleted successfully",
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
  getPredefinedList,
  getPredefinedById,
  savePredefined,
  updatePredefined,
  deletePredefined,
};
