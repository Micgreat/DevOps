import React, { useState } from 'react';
import axios from 'axios';

const PlaceOrder = () => {
  const [userId, setUserId] = useState('');
  const [productIds, setProductIds] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    axios.post('http://localhost:3000/orders', { userId, productIds: productIds.split(',').map(id => parseInt(id)) })
      .then(response => {
        console.log('Order placed:', response.data);
        setUserId('');
        setProductIds('');
      })
      .catch(error => console.error('Error placing order:', error));
  };

  return (
    <div>
      <h1>Place Order</h1>
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          value={userId}
          onChange={(e) => setUserId(e.target.value)}
          placeholder="User ID"
          required
        />
        <input
          type="text"
          value={productIds}
          onChange={(e) => setProductIds(e.target.value)}
          placeholder="Product IDs (comma separated)"
          required
        />
        <button type="submit">Place Order</button>
      </form>
    </div>
  );
};

export default PlaceOrder;
