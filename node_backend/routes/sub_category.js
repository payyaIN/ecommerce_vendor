const express = require("express");
const SubCategory = require("../models/sub_category");

const subCategoryRouter = express.Router();

subCategoryRouter.post('/api/subcategories', async (req,res)=> {
    try {
        const {categoryId,categoryName,image,subCategoryName} = req.body;
        const subCategory = new SubCategory({categoryId,categoryName,image,subCategoryName});
        await subCategory.save();
        res.status(201).send(subCategory);
        
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});

subCategoryRouter.get('/api/subcategories', async (req,res)=> {
    try {
       const subCategories = await SubCategory.find();
        return res.status(200).json(subCategories);
    } catch (e) {
        res.status(500).json({error :e.message});
    }
});

//filtering categoryName from subcategory
subCategoryRouter.get('/api/category/:categoryName/subcategories',async (req,res)=>{
// subCategoryRouter.get('/api/subcategories',async (req,res)=>{

    ///api/category/subcategories -- if we know the category name -- dont need to put /:categoryName/ in url
    //- ({categoryName:"Clothes"})
    try {
        //extracting categoryName from subcategory request url using destructuring
        const {categoryName} = req.params; 
        //search for categoryName from the request url using destructoring
        const subcategories =await SubCategory.find({categoryName:categoryName});
//case insensitive search
        //         const subcategories = await SubCategory.find({
//     categoryName: { $regex: new RegExp(`^${categoryName}$`, 'i') }
// });
        if(!subcategories || subcategories.length == 0){
            //if no sub categories are found 
          return  res.status(404).json({msg:"subcategories not found"});
        }else{
            return res.status(200).json(subcategories);
        }
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});



module.exports = subCategoryRouter;