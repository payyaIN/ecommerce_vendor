const mongoose = require("mongoose");

const subCategoryScheme = mongoose.Schema({
    categoryId:{
        type:String,
        required: true
    },
    categoryName:{
        type:String,
        required: true
    },
    image:{
        type:String,
        required: true
    },
    subCategoryName:{
        type:String,
        required: true
    },

});

const subCategory = mongoose.model("Subcategory",subCategoryScheme);

module.exports = subCategory;