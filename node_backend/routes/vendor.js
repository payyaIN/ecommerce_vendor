const express = require("express");
const Vendor = require('../models/vendor');
const vendorRouter = express.Router();
const bcryptjs = require('bcryptjs');
const jwt = require("jsonwebtoken");


vendorRouter.post('/api/vendor/signup', async (req,res)=>{
    try {
        const {fullName,email,password } = req.body;

        const existingVendor =await Vendor.findOne({email});
        if(existingVendor){
            return res.status(400).json({msg:"Vendor with same email id exists"});
        }else{
            const salt = await bcryptjs.genSalt(10); //10 - cost factor. 
            const hashedPassword = await bcryptjs.hash(password, salt); //to perform hashing
            let vendor = new Vendor({fullName,email,password:hashedPassword}); //Variables declared with let have Block Scope.
            vendor = await vendor.save(); //'user' in db
            res.json({vendor});
            //save user to DB and sends JSON response with updated user
        }
    } catch (e) {
        res.status(500).json({error:e.message})
    }

});

vendorRouter.post('/api/vendor/signin', async (req,res)=>{
    try {
        const {email,password} = req.body;
        const findVendor = await Vendor.findOne({email});
        if(!findVendor){
          return res.status(400).json({msg:"Vendor not found with this email"});

        }else{
            const isMatched = await bcryptjs.compare(password, findVendor.password);
            if(!isMatched){
                return  res.status(400).json({msg:"Incorrect password"});
            }else{
                const token = jwt.sign({id:findVendor._id},"passKey"); //passKey -- used to authenticate user and can be used for reference
                const {password, ...vendorWithoutPassword} = findVendor._doc; //_doc --> the user(DB) itself
            
                res.json({token, vendor: vendorWithoutPassword}) 
            }
        }
    } catch (e) {
        res.status(500).json({error:e.message})
    }
});


module.exports = vendorRouter;