const express = require('express');
const orderRouter = express.Router();
const Order = require('../models/order');


orderRouter.post('/api/orders',async (req,res)=> {
    try {
        const {
            fullName,
            email,
            state,
            city,
            locality,
            productName,
            productPrice,
            quantity,
            category,
            image,
            vendorId,
            buyerId,
            } = req.body;

            //get current date and time
            const createdAt = new Date().getMilliseconds();

            //create new order instancemwith extracted field
            const order = new Order({
            fullName,
            email,
            state,
            city,
            locality,
            productName,
            productPrice,
            quantity,
            category,
            image,
            vendorId,
            buyerId,
            createdAt
            });
            await order.save();
            return res.status(201).json(order);
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
});

//GET route for fetching order by buyer ID
orderRouter.get('/api/orders/:buyerId', async (req,res)=>{
   try {
     //extract all orders in the DB that match the buyer ID
    const {buyerId} = req.params;
    //if no orders are found, return a 404 status with an error message
    const orders = await Order.find({buyerId});
    if(orders.length == 0){
        return res.status(404).json({msg:"No orders found for this buyer"})
    }
    return res.status(200).json(orders);
   } catch (e) {
    return res.status(500).json({error:e.message});
   }
});
// GET route for fetching orders by vendor ID
orderRouter.get('/api/orders/vendors/:vendorId', auth, vendorAuth, async (req, res) => {
  try {
    const { vendorId } = req.params;
    const orders = await Order.find({ vendorId });

    if (orders.length === 0) {
      return res.status(404).json({ msg: "No Orders found for this vendor" });
    }

    return res.status(200).json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//deleting order by id
orderRouter.delete('/api/orders/:id', async (req,res)=>{
    try {
        //extract id from req params
        const {id} = req.params;
        //find and delete the order by extracted id
        const deleteOrder =  await Order.findByIdAndDelete(id);
       if(!deleteOrder){
        //if no order is found, return a 404 status with an error message
        return res.status(404).json({msg:"Order not found"});
       }else{
         return res.status(200).json({msg:"Order deleted successfully"});
       }
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
});


module.exports = orderRouter;