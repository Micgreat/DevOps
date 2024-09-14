import React from 'react';
import ProductList from './components/ProductList';
import AddProduct from './components/AddProduct';
import UserRegistration from './components/UserRegistration';
import PlaceOrder from './components/PlaceOrder';

const App = () => {
  return (
    <div>
      <h1>E-Commerce Application</h1>
      <ProductList />
      <AddProduct />
      <UserRegistration />
      <PlaceOrder />
    </div>
  );
};

export default App;
