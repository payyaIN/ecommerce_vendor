//import mongoDB
const mongoose = require("mongoose");

//create user model
const userSchema = mongoose.Schema( {
    fullName:{
        type:String,
        required:true,
        trim:true
    },
    email:{
        type:String,
        required:true,
        trim:true,
        validate:{
            validator:(value)=>{
              const result =/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                return result.test(value)  //compare value with user
            },
            message:"Please enter a valid email address"
        }
    },
    state:{
        type:String,
        default:"",
           },
    city:{
            type:String,
            default:"",
          },
    password:{
         type:String,
         required:true,
         validate:{
            validator:(value)=>{
                  return  value.length >= 6   //if
                
            },
            message:"password must be atleast 6 character long"  //else
         }
            } ,
    locality:{
        type:String,
        default:"", 
            }                  
});

//user collection
const User = mongoose.model("User",userSchema);
//create a Mongoose model("User") based on a predefined schema(userSchema)
// /This Mongoose model allows-to interact with the "users" collection in your MongoDB database, 
// ~creating, reading, updating, and deleting user documents.

module.exports = User;