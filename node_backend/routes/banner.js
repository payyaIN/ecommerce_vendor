const express = require("express");
const Banner = require("../models/banner")
const bannerRouter = express.Router();

//upload banner image from client to server
bannerRouter.post('/api/banner', async (req, res) => {
try {
    //extract image from request 
const {image} = req.body;
//create banner instance with extracted image
const banner =  Banner({image});
//save banner in mongoDB
await banner.save();
//send user a feedback - ie, banner has been uploaded
return res.status(201).send(banner)

} catch (e) {
    res.status(500).json({error: e.message});
}
});

//retrieve banners from server

bannerRouter.get('/api/banner', async(req, res)=>{
    try {
        //find all banners in mongo Db
        const banners  = await Banner.find();
       //send all available banners to client 
    return res.status(200).send(banners);
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});

module.exports = bannerRouter;