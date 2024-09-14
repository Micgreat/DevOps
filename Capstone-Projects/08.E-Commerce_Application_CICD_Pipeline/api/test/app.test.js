import { expect } from 'chai';
import supertest from 'supertest';
import app from '../app.js'; // Ensure the path and file extension are correct

const request = supertest(app);

describe('E-commerce API', () => {
  describe('GET /products', () => {
    it('should return a list of products', (done) => {
      request.get('/products')
        .expect('Content-Type', /json/)
        .expect(200, done);
    });
  });

  describe('POST /products', () => {
    it('should add a new product', (done) => {
      const newProduct = { name: 'Test Product', price: 10 };
      request.post('/products')
        .send(newProduct)
        .expect('Content-Type', /json/)
        .expect(201)
        .expect((res) => {
          expect(res.body).to.have.property('name', 'Test Product');
          expect(res.body).to.have.property('price', 10);
        })
        .end(done);
    });
  });

  describe('POST /users', () => {
    it('should register a new user', (done) => {
      const newUser = { username: 'testuser', password: 'password123' };
      request.post('/users')
        .send(newUser)
        .expect('Content-Type', /json/)
        .expect(201)
        .expect((res) => {
          expect(res.body).to.have.property('username', 'testuser');
        })
        .end(done);
    });
  });

  describe('POST /orders', () => {
    it('should place an order', (done) => {
      const newOrder = { userId: 1, productIds: [1] };
      request.post('/orders')
        .send(newOrder)
        .expect('Content-Type', /json/)
        .expect(201)
        .expect((res) => {
          expect(res.body).to.have.property('userId', 1);
          expect(res.body).to.have.property('productIds').that.deep.equals([1]);
        })
        .end(done);
    });
  });
});
