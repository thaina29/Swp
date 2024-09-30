package Model;

import java.util.List;

public class Product {
    private int productId;
    private int categoryId;
    private String productName;
    private int isDeleted;
    private String createdAt;
    private String description;
    private int createdBy;
    private ProductDetail productDetail;
    private List<ProductDetail> productDetails;

    public Product() {
    }
    
    public Product(int productID, int categoryID, String productName, int isDeleted, String createdAt, String description, int createdBy, List<ProductDetail> productDetails) {
        this.productId = productID;
        this.categoryId = categoryID;
        this.productName = productName;
        this.isDeleted = isDeleted;
        this.createdAt = createdAt;
        this.description = description;
        this.createdBy = createdBy;
        this.productDetails = productDetails;
    }
    
    public Product(int productID, int categoryID, String productName, int isDeleted, String createdAt, String description, int createdBy, ProductDetail productDetail) {
        this.productId = productID;
        this.categoryId = categoryID;
        this.productName = productName;
        this.isDeleted = isDeleted;
        this.createdAt = createdAt;
        this.description = description;
        this.createdBy = createdBy;
        this.productDetail = productDetail;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail ProductDetail) {
        this.productDetail = ProductDetail;
    }
    
    public int getProductID() {
        return productId;
    }

    public void setProductID(int productID) {
        this.productId = productID;
    }

    public int getCategoryID() {
        return categoryId;
    }

    public void setCategoryID(int categoryID) {
        this.categoryId = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public List<ProductDetail> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(List<ProductDetail> productDetails) {
        this.productDetails = productDetails;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productId + ", categoryID=" + categoryId + ", productName=" + productName + ", isDeleted=" + isDeleted + ", createdAt=" + createdAt + ", description=" + description + ", createdBy=" + createdBy + ", productDetails=" + productDetails + '}';
    }
    
    
    
}
