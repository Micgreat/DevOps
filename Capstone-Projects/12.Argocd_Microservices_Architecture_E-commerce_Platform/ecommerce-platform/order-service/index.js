const express = require('express');
const app = express();
const PORT = 3003;

let orders = [];

app.use(express.json());

// Example root route
app.get('/', (req, res) => {
  res.send('Welcome to the Order API!');
});

// Create an order
app.post('/orders', (req, res) => {
  const order = req.body;
  orders.push(order);
  res.status(201).send('Order created');
});

// View all orders
app.get('/orders', (req, res) => {
  res.json(orders);
});

app.listen(PORT, () => {
  console.log(`Order Service running on port ${PORT}`);
});
