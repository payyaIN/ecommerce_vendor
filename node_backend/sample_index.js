const express = require('express')
const SubCategory = require('./models/sub_category');
const e = require('express');
const subCategory = require('./models/sub_category');
const subCategoryRouter = express.Router();


subCategoryRouter.post('/api/subCategory/',async (req,res)=>{
try {
    const {id,name,img,sub} = req.body;
    const subCategory = new SubCategory({id,name,img,sub});
   await subCategory.save();
   res.status(202).send(subCategory);
} catch (error) {
    res.status(500).json({error:e.message})
}
});