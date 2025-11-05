const express = require("express");
const User = require('../models/user');
const authRouter = express.Router();

//import bcryptjs for hashing
const bcryptjs = require('bcryptjs');
const jwt = require("jsonwebtoken");



//sign-up API n
authRouter.post('/api/signup/', async (req,res)=>{
    try {
        const {fullName,email,password } = req.body;

// POST   --   http://localhost:3000/api/signup
// body:
//    {
//     "fullName":"name",
//     "email":"email@gmail.com",
//     "password":"password@123"
//    }
        const existingUser =await User.findOne({email});
        if(existingUser){
            return res.status(400).json({msg:"User with same email id exists"});
        }else{
            const salt = await bcryptjs.genSalt(10); //10 - cost factor. 
            const hashedPassword = await bcryptjs.hash(password, salt); //to perform hashing
            let user = new User({fullName,email,password:hashedPassword}); //Variables declared with let have Block Scope.
            user = await user.save(); //'user' in db
            res.json({user});
            //save user to DB and sends JSON response with updated user
        }
    } catch (e) {
        res.status(500).json({error:e.message})
    }

});

//sign-in API

authRouter.post('/api/signin/', async (req,res)=>{
    try {
        const {email,password} = req.body;
        const findUser = await User.findOne({email});
        if(!findUser){
          return res.status(400).json({msg:"User not found with this email"});
           
        }else{
            const isMatched = await bcryptjs.compare(password, findUser.password);
            if(!isMatched){
                return  res.status(400).json({msg:"Incorrect password"});
            }else{
                const token = jwt.sign({id:findUser._id},"passKey"); //passKey -- used to authenticate user and can be used for reference
                const {password, ...userWithoutPassword} = findUser._doc; //_doc --> the user(DB) itself
                //use a spred operator(userWithoutPassword) to store all details except password
                //                 {
                //     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZWZiNjM4MzFlNTYwZDE4NWRiN2M2NiIsImlhdCI6MTc2MDU5NTc4NX0.aKQ9N-EOic5Uih1mmZNt86yZse_8wgmOUNDI_BH2SkM",
                //     "_id": "68efb63831e560d185db7c66",
                //     "fullName": "aswathi",
                //     "email": "aswathiachu@gmail.com",
                //     "state": "",
                //     "city": "",
                //     "locality": "",
                //     "__v": 0
                // }
                //userWithoutPassword --> create user(db) details without password field
                res.json({token, ...userWithoutPassword}) //user details with token and userWithoutpassword
            }
        }
    } catch (e) {
        res.status(500).json({error:e.message})
    }
});

module.exports = authRouter;