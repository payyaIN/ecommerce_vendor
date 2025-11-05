//import express module
const express = require('express');

//import mongoDb
    const mongoose = require('mongoose');
//import router
    const authRouter = require('./routes/auth');
//import banner router
const bannerRouter = require('./routes/banner')
//import category router
const categoryRouter = require('./routes/category')
//import subCategory router
const subCategoryRouter = require('./routes/sub_category');
//import product router
const productRouter = require('./routes/product');
//import product review router
const productReviewRouter = require('./routes/product_review');
//import cors
const cors = require('cors');
//Cross-Origin Resource Sharing (CORS) - 
// - security feature implemented by web browsers
// - that restrict web pages from making requests to different domain origin other than the one that served
// - by default, browsers block stores cross-origin requests to prevent malicious websites from making unauthorized requests,


//create port number
const PORT = 3000;
//create instance of express
const app = express();
//moving this functino to routes
// app.get('/hello',  (req, res)=> {
//     res.send('Hello World');
// });
// const DB = "mongodb+srv://clouddoc22:ventorbackend@cluster0.2fbyg.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
const DB = "mongodb+srv://akshaypayya:payyadb@cluster0.hwju419.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

//connect mongoDB
mongoose.connect(DB).then(() => {
    console.log("MongoDB connected");
});
//middleware - to register routes / mount routes
app.use(express.json()); //handle JSON data sent by HTTP request 
app.use(cors()); // enable cors for all origin and routes 
app.use(authRouter); 
app.use(bannerRouter); //use banner router
app.use(categoryRouter); //use category router
app.use(subCategoryRouter);
app.use(productRouter);
app.use(productReviewRouter);
//start server and listen to this port

app.listen(PORT, "0.0.0.0", function(){
    console.log(`Server is listening on port ${PORT}`);
})
