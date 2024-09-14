import express from 'express';
import bodyParser from 'body-parser';

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// In-memory data stores (simulating a database)
let products = [];
let users = [];
let orders = [];

// Routes
// List products
app.get('/products', (req, res) => {
  res.json(products);
});

// Add a new product
app.post('/products', (req, res) => {
  const { name, price } = req.body;
  if (!name || !price) {
    return res.status(400).json({ error: 'Name and price are required' });
  }
  const newProduct = { id: products.length + 1, name, price };
  products.push(newProduct);
  res.status(201).json(newProduct);
});

// Register a new user
app.post('/users', (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res.status(400).json({ error: 'Username and password are required' });
  }
  const newUser = { id: users.length + 1, username, password };
  users.push(newUser);
  res.status(201).json(newUser);
});

// Place an order
app.post('/orders', (req, res) => {
  const { userId, productIds } = req.body;
  if (!userId || !productIds || !Array.isArray(productIds)) {
    return res.status(400).json({ error: 'User ID and product IDs are required' });
  }
  const newOrder = { id: orders.length + 1, userId, productIds };
  orders.push(newOrder);
  res.status(201).json(newOrder);
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});

export default app;
