package Model;

public class ProductDetail {
    private int productDetailID;
    private int productID;
    private String imageURL;
    private int stock;
    private int isDeleted;
    private String createdAt;
    private int createdBy;
    private double price;
    private double discount;

    public ProductDetail(int productDetailID, int productID, String imageURL, int stock, int isDeleted, String createdAt, int createdBy, double price, double discount) {
        this.productDetailID = productDetailID;
        this.productID = productID;
        this.imageURL = imageURL;
        this.stock = stock;
        this.isDeleted = isDeleted;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
        this.price = price;
        this.discount = discount;
    }

    public ProductDetail() {
    }

    public int getProductDetailID() {
        return productDetailID;
    }

    public void setProductDetailID(int productDetailID) {
        this.productDetailID = productDetailID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
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

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "ProductDetail{" + "productDetailID=" + productDetailID + ", productID=" + productID + ", imageURL=" + imageURL + ", stock=" + stock + ", isDeleted=" + isDeleted + ", createdAt=" + createdAt + ", createdBy=" + createdBy + ", price=" + price + ", discount=" + discount + '}';
    }
    
    
    
}
