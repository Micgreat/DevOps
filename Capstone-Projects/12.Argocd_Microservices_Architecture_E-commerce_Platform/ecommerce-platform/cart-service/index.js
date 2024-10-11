const express = require('express');
const app = express();
const PORT = 3002;

let cart = [];

app.use(express.json());

// Example root route
app.get('/', (req, res) => {
  res.send('Welcome to the Order API!');
});

// Add item to cart
app.post('/cart', (req, res) => {
  const item = req.body;
  cart.push(item);
  res.status(201).send('Item added to cart');
});

// Remove item from cart
app.delete('/cart/:id', (req, res) => {
  const itemId = parseInt(req.params.id);
  cart = cart.filter(item => item.id !== itemId);
  res.send('Item removed from cart');
});

// View all items in cart
app.get('/cart', (req, res) => {
  res.json(cart);
});

app.listen(PORT, () => {
  console.log(`Cart Service running on port ${PORT}`);
});
