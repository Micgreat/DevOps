const express = require('express');
const app = express();
const PORT = 3001;

const products = [
  { id: 1, name: 'Laptop', price: 1000 },
  { id: 2, name: 'Phone', price: 500 },
  { id: 3, name: 'Tablet', price: 300 }
];

// Example root route
app.get('/', (req, res) => {
  res.send('Welcome to the Ecommerce API!');
});

// List all products
app.get('/products', (req, res) => {
  res.json(products);
});

// View product by ID
app.get('/products/:id', (req, res) => {
  const product = products.find(p => p.id === parseInt(req.params.id));
  if (product) {
    res.json(product);
  } else {
    res.status(404).send('Product not found');
  }
});

app.listen(PORT, () => {
  console.log(`Product Service running on port ${PORT}`);
});
