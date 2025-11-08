const mongoose = require("mongoose");
const productSchema = mongoose.Schema({
    productName:{
        type:String,
        required:true,
        trim:true,
    },
    productPrice:{
        type:Number,
        required:true,
    },
    quantity:{
        type:Number,
        required:true,
    },
    description:{
        type:String,
        required:true,
    },
    vendorId:{
        type:String,
        required:true,
    },
    fullName:{
        type:String,
        required:true,
    },
    category:{
        type:String,
        required:true,
    },
    subCategory:{
        type:String,
        required:true,
    },
    images:[{
        type:String,
        required:true,
    //there are multiple images for a single product,so list [] is used
    //type is string bcoz - we are uploading images directly to Cloudinary, 
    // then the url is stored in mongoDB    
    //** 
    //The reason we're using Cloudinary instead of handling uploads 
    // directly with Multer in Node.js comes down to scalability, convenience, and efficiency.
    },],

    popular:{
        type:Boolean,
        default:false,
    },
    recommend:{
        type:Boolean,
        default:false,
    },
});

const product = mongoose.model("Product",productSchema);
module.exports = product;