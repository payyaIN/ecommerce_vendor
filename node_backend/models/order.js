const mongoose = require("mongoose");
    
const orderScheme = mongoose.Schema( {
    fullName:{
        type : String,
        required : true
    },
    email:{
        type : String,
        required : true
    },
    state:{
        type : String,
        required : true
    },
    city : {
        type : String,
        required : true
    },
    locality : {
        type : String,
        required : true
    },
    productName : {
        type : String,
        required : true
    },
   
    quantity : {
        type : Number,
        required : true
    },
    category:{
        type : String,
        required : true
    },
    image:{
        type : String,
        required : true
    },
    buyerId : {
        type : String,
        required : true
    },
    vendorId : {
        type : String,
        required : true
    },
    processing:{
        type : Boolean,
        required : true
    },
    delivered : {
        type : Boolean,
        required : false
    },
    createdAt : {
        type : Number,
        required : true
    },
   
});


const Order = mongoose.model("Order", orderScheme);

module.exports = Order;