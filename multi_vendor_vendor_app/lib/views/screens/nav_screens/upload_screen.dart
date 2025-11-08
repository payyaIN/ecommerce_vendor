import 'package:multi_vendor_vendor_app/controllers/product_controller.dart';
import 'package:multi_vendor_vendor_app/controllers/subcategory_controller.dart';
import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Future<List<CategoryModel>> futureCategory;
  Future<List<SubCategoryModel>>? futureSubCategories;
  final ProductController _productController = ProductController();
  late String name;
  late String productName;
  late String productDescription;
  late int productPrice;
  late int productQuantity;
  CategoryModel? selectedCategory;
  SubCategoryModel? selectedSubCategory;

  @override
  void initState() {
    super.initState();
    futureCategory = CategoryController().loadCategories();
  }

  //creating an instance of imagepicker to handle image selection
  ImagePicker imagePicker = ImagePicker();
  //initializing an empty list to store- selected images
  List<File> images = [];

  //fn to pick image from gallary
  chooseImage() async {
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage == null) {
      showSnackBar(content: 'No image picked');
    }
    //if an image is picked-update the state and add the picked image to list
    setState(() {
      images.add(File(pickedImage!.path));
    });
  }

  getSubcategoryByCategory(value) {
    //fetch subcategories based on selected category
    futureSubCategories = SubcategoryController()
        .getSubCategoriesByCategoryName(value.name);
    //reset the selected subcategory
    selectedSubCategory = null;
  }

  @override
  Widget build(BuildContext context) {
    final fullName = ref.read(vendorProvider)!.fullName;
    final vendorId = ref.read(vendorProvider)!.id;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap:
                true, //allow the gridview to shrink to fit the content itemCount: images.length +
            itemCount:
                images.length +
                1, //the number of items in the grid (+1 for the add
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              ///if the index is 0, display
              return index == 0
                  ? Center(
                      child: IconButton(
                        onPressed: () {
                          chooseImage();
                        },
                        icon: const Icon(Icons.add),
                      ),
                    )
                  : SizedBox(
                      height: 40,
                      width: 50,
                      child: Image.file(images[index - 1]),
                    );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      productName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter product name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Product Name",
                      hintText: 'Enter Product Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      productPrice = int.parse(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter product price';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Product Price",
                      hintText: 'Enter Product Price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      productQuantity = int.parse(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter product quantity';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Product Quantity",
                      hintText: 'Enter Product Quantity',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: FutureBuilder<List<CategoryModel>>(
                    future: futureCategory,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No Category');
                      } else {
                        return DropdownButton<CategoryModel>(
                          value: selectedCategory,
                          hint: const Text('Select Category'),
                          items: snapshot.data!.map((CategoryModel category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value;
                            });
                            getSubcategoryByCategory(selectedCategory);
                            print(selectedCategory!.name);
                          },
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: FutureBuilder<List<SubCategoryModel>>(
                    future: futureSubCategories,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No Subcategory');
                      } else {
                        return DropdownButton<SubCategoryModel>(
                          value: selectedSubCategory,
                          hint: const Text('Select SubCategory'),
                          items: snapshot.data!.map((
                            SubCategoryModel subcategoryModel,
                          ) {
                            return DropdownMenuItem(
                              value: subcategoryModel,
                              child: Text(subcategoryModel.subCategoryName),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSubCategory = value;
                            });
                            print(selectedSubCategory!.subCategoryName);
                          },
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    onChanged: (value) {
                      productDescription = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter product description';
                      }
                      return null;
                    },
                    maxLength: 500,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Enter Product Description",
                      hintText: 'Enter Product Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  print("vendor details: $vendorId, $fullName");
                  print(
                    "vendor-product details: $productName, $productPrice, $productQuantity, $productDescription, $images, $selectedCategory, $selectedSubCategory, $vendorId, $fullName",
                  );

                  _productController.uploadProduct(
                    context: context,
                    productName: productName,
                    productPrice: productPrice,
                    quantity: productQuantity,
                    description: productDescription,
                    pickedImages: images,
                    category: selectedCategory!.name,
                    subCategory: selectedSubCategory!.subCategoryName,

                    vendorId: vendorId,
                    fullName: fullName,
                  );
                  print(
                    'products details: $productName, $productPrice, $productQuantity, $productDescription, $images, $selectedCategory, $selectedSubCategory, $vendorId, $fullName',
                  );
                } else {
                  showSnackBar(content: "Please fill all fields");
                  print("please enter all fields");
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    'Upload Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      letterSpacing: 1.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
