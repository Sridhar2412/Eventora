const express = require("express");
const app = express();
const productRoutes = require("./routes/product_route");
const userRouter = require("./routes/user_route");
const eventRouter = require("./routes/event_route");
const predefinedRouter = require("./routes/predefined_rouite");
const rsvpRouter = require("./routes/rsvp_route");
const YAML = require("yamljs");
const path = require("path");
const swaggerUI = require("swagger-ui-express");
// Middleware to parse incoming JSON bodies
app.use(express.json());

// // Start the server
// app.listen(port, () => {
//   console.log(`Server is running on http://localhost:${port}`);
// });

const swaggerDocument = YAML.load(path.join("../swagger.yaml"));

// Swagger Setup
app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(swaggerDocument)); // Swagger UI route

// Use the product routes for handling product-related API calls
app.use("/api/products", productRoutes);
app.use("/api/users", userRouter);
app.use("/api/event", eventRouter);
app.use("/api/predefined", predefinedRouter);
app.use("/api/rsvp", rsvpRouter);

// Set the port for the server
const port = 3000;

app.listen(
  port,
  () => console.log(`Swagger at http://192.168.68.145:${port}/api-docs`)
  // console.log(`Swagger at http://192.168.68.145:${port}/api-docs`)
);
