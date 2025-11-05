const mongoose = require("mongoose");

const categoryScheme  = mongoose.Schema({
    name:{
        type: String,
        required: true
    },
    image:{
        type: String,
        required: true
    },
    banner:{
        type:String,
        required:true
    }
});

const category = mongoose.model("Category",categoryScheme);

module.exports = category;