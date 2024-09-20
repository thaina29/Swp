
CREATE DATABASE `swp-online-shop`;

USE `swp-online-shop`;
 
/* SQLINES DEMO *** le [dbo].[Cart]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE `Cart`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`UserID` int NULL,
	`ProductDetailID` int NULL,
	`Quantity` int NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[Category]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Category`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`Name` varchar(100) NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[Feedback]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Feedback`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`OrderDetailID` int NULL,
	`Rating` int NULL,
	`Comment` Longtext NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
	`ImgURL` Longblob NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[Order]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Order`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`UserID` int NULL,
	`Fullname` varchar(100) NULL,
	`Address` varchar(255) NULL,
	`Phone` varchar(20) NULL,
	`Status` varchar(100) NULL DEFAULT 'Pending',
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
	`Notes` Longtext NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[OrderDetail]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `OrderDetail`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`OrderID` int NULL,
	`ProductDetailID` int NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
	`quantity` int NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[Post]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Post`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`CategoryID` int NULL,
	`Title` nvarchar(255) NULL,
	`Content` Longtext NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
	`imgURL` Longtext NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[Product]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Product`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`CategoryID` int NULL,
	`Name` varchar(100) NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`description` Longtext NULL,
	`CreatedBy` int NULL DEFAULT 1,
PRIMARY KEY 
(
	`ID` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[ProductDetail]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `ProductDetail`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`ProductID` int NULL,
	`ImageURL` Longtext NULL,
	`Stock` int NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
	`price` Double NULL,
	`discount` int NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[Role]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Role`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`Name` varchar(50) NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
PRIMARY KEY 
(
	`ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[Settings]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Settings`(
	`ID` int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`Type` varchar(50) NULL,
	`Value` varchar(150) NULL,
	`Order` int NULL,
	`CreatedBy` int NULL DEFAULT 1,
	`isDeleted` Tinyint NULL DEFAULT 0,
	`description` Longtext NULL
) ;
/* SQLINES DEMO *** le [dbo].[Slider]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Slider`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`Title` nvarchar(255) NULL,
	`ImageURL` Longtext NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
	`ProductId` int NULL,
	`Notes` nvarchar(255) NULL,
	`Backlink` nvarchar(255) NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[Staff]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Staff`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`Email` varchar(50) NULL,
	`Password` varchar(100) NULL,
	`Fullname` varchar(100) NULL,
	`Gender` varchar(10) NULL,
	`Address` varchar(255) NULL,
	`Phone` varchar(20) NULL,
	`Role` int NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
	`Avatar` Longtext NULL DEFAULT 'https://www.svgrepo.com/show/452030/avatar-default.svg',
PRIMARY KEY 
(
	`ID` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[User]    Script Date: 6/9/2024 11:14:27 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `User`(
	`ID` int AUTO_INCREMENT NOT NULL,
	`Email` varchar(50) NULL,
	`Password` varchar(100) NULL,
	`Fullname` varchar(100) NULL,
	`Gender` varchar(10) NULL,
	`Address` varchar(255) NULL,
	`Phone` varchar(20) NULL,
	`IsDeleted` Tinyint NULL DEFAULT 0,
	`CreatedAt` datetime(3) NULL DEFAULT now(3),
	`CreatedBy` int NULL,
	`Avatar` Longtext NULL DEFAULT 'https://www.svgrepo.com/show/452030/avatar-default.svg',
	`ChangeHistory` Longtext NULL,
PRIMARY KEY 
(
	`ID` ASC
) 
) ;
/* SET IDENTITY_INSERT [dbo].[Category] ON */ 

INSERT `Category` (`ID`, `Name`, `IsDeleted`, `CreatedAt`, `CreatedBy`) VALUES (1, 'Men Clothing', 0, CAST('2024-05-19T10:52:57.557' AS DateTime(3)), 1);
INSERT `Category` (`ID`, `Name`, `IsDeleted`, `CreatedAt`, `CreatedBy`) VALUES (2, 'Women Clothing', 0, CAST('2024-05-19T10:52:57.557' AS DateTime(3)), 1);
INSERT `Category` (`ID`, `Name`, `IsDeleted`, `CreatedAt`, `CreatedBy`) VALUES (3, 'Kids Clothing', 0, CAST('2024-05-19T10:52:57.557' AS DateTime(3)), 1);
/* SET IDENTITY_INSERT [dbo].[Category] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Feedback] ON */ 

INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (1, 1, 5, 'Excellent product!', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (2, 1, 4, 'Great value, satisfied with purchase.', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (3, 1, 3, 'Instructions a bit confusing.', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (4, 1, 5, 'Highly recommend to others!', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (5, 1, 4, 'User-friendly design, easy to use.', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (6, 1, 2, 'Missing a small component.', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (7, 1, 5, 'Exceeded expectations, very pleased!', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (8, 1, 4, 'Good quality materials, happy with it.', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (9, 1, 3, 'Delivery took longer than expected.', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (10, 1, 5, 'Absolutely love it!', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (11, 2, 5, 'Excellent product!', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
INSERT `Feedback` (`ID`, `OrderDetailID`, `Rating`, `Comment`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ImgURL`) VALUES (12, 2, 5, 'Absolutely love it!', 0, CAST('2024-06-06T23:35:34.503' AS DateTime(3)), 1, NULL);
/* SET IDENTITY_INSERT [dbo].[Feedback] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Order] ON */ 

INSERT `Order` (`ID`, `UserID`, `Fullname`, `Address`, `Phone`, `Status`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Notes`) VALUES (1, 1, 'John Doe', '123 Main St', '1234567890', 'Received', 0, CAST('2024-06-08T23:24:44.457' AS DateTime(3)), 1, '');
INSERT `Order` (`ID`, `UserID`, `Fullname`, `Address`, `Phone`, `Status`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Notes`) VALUES (2, 1, 'Tony', '123 Main St', '1234567890', 'shipping', 0, CAST('2024-06-09T00:29:49.193' AS DateTime(3)), 1, '');
/* SET IDENTITY_INSERT [dbo].[Order] OFF */
 
/* SET IDENTITY_INSERT [dbo].[OrderDetail] ON */ 

INSERT `OrderDetail` (`ID`, `OrderID`, `ProductDetailID`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `quantity`) VALUES (1, 1, 4, 0, CAST('2024-06-08T23:24:44.490' AS DateTime(3)), 1, 1);
/* SET IDENTITY_INSERT [dbo].[OrderDetail] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Post] ON */ 

INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (12, 1, 'Great product!', 'I absolutely love this product. Highly recommended!', 0, CAST('2024-01-15T00:00:00.000' AS DateTime(3)), 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (13, 2, 'Not satisfied', 'The product did not meet my expectations.', 0, CAST('2024-01-16T00:00:00.000' AS DateTime(3)), 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (14, 3, 'Excellent quality', 'The quality is superb. Will buy again.', 0, CAST('2024-01-17T00:00:00.000' AS DateTime(3)), 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (15, 1, 'Value for money', 'Great value for the price.', 0, CAST('2024-01-18T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (16, 2, 'Not worth it', 'The product broke after a week of use.', 1, CAST('2024-01-19T00:00:00.000' AS DateTime(3)), 3, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (17, 3, 'Very happy', 'I am very happy with my purchase.', 0, CAST('2024-01-20T00:00:00.000' AS DateTime(3)), 3, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (18, 1, 'Disappointed', 'Did not perform as advertised.', 1, CAST('2024-01-21T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (19, 2, 'Good customer service', 'Customer service was very helpful.', 0, CAST('2024-01-22T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (20, 3, 'Highly recommend', 'Would highly recommend to others.', 0, CAST('2024-01-23T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (21, 1, 'Average product', 'It is an average product for the price.', 0, CAST('2024-01-24T00:00:00.000' AS DateTime(3)), 3, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (22, 2, 'Fast shipping', 'The product arrived quickly.', 0, CAST('2024-01-25T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (23, 3, 'Terrible experience', 'I had a terrible experience with this product.', 1, CAST('2024-01-26T00:00:00.000' AS DateTime(3)), 4, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (24, 3, 'Very durable', 'The product is very durable and long-lasting.', 0, CAST('2024-01-27T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (25, 1, 'Poor quality', 'Quality is not as expected.', 1, CAST('2024-01-28T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (26, 1, 'Satisfied', 'Overall, I am satisfied with the purchase.', 0, CAST('2024-01-29T00:00:00.000' AS DateTime(3)), 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (27, 2, 'Excellent choice', 'Excellent choice for the price.', 0, CAST('2024-01-30T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (28, 3, 'Not recommended', 'I would not recommend this product.', 1, CAST('2024-01-31T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (29, 3, 'Superb', 'The product is superb in every way.', 0, CAST('2024-02-01T00:00:00.000' AS DateTime(3)), 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (30, 2, 'Okay product', 'It is an okay product, nothing special.', 0, CAST('2024-02-02T00:00:00.000' AS DateTime(3)), 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (31, 2, 'Will buy again', 'Definitely will buy this product again.', 0, CAST('2024-02-03T00:00:00.000' AS DateTime(3)), 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (32, 2, 'test2', 'test123123', 0, CAST('2024-05-20T19:44:46.490' AS DateTime(3)), 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (33, 1, 'tesy', 'ádasd', 0, CAST('2024-05-22T01:05:52.463' AS DateTime(3)), 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg');
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (34, 1, 'tesyasdasd', 'sdfsdfdsf', 0, CAST('2024-05-22T10:16:53.493' AS DateTime(3)), 1, NULL);
INSERT `Post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES (35, 1, 'hehe', 'asdasdasd', 0, CAST('2024-05-22T10:17:50.590' AS DateTime(3)), 1, 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D');
/* SET IDENTITY_INSERT [dbo].[Post] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Product] ON */ 

INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (2, 1, 'Men T-Shirt', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (3, 1, 'Men Jeans', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (4, 1, 'Men Jacket', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (5, 2, 'Women Dress', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (6, 2, 'Women Blouse', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (7, 2, 'Women Skirt', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (8, 3, 'Kids T-Shirt', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (9, 3, 'Kids Shorts', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (10, 3, 'Kids Jacket', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (11, 1, 'Men Sweater', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (12, 1, 'Men Shorts', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (13, 2, 'Women T-Shirt', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (14, 2, 'Women Jeans', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (15, 3, 'Kids Dress', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (16, 3, 'Kids Skirt', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (17, 1, 'Men Hat', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (18, 2, 'Women Hat', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (19, 3, 'Kids Hat', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (20, 1, 'Men Socks', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (21, 2, 'Women Socks', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
INSERT `Product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES (22, 3, 'Kids Socks', 0, CAST('2024-05-19T10:53:03.030' AS DateTime(3)), 'This is a contemporary clothing store in the heart of downtown that offers chic and stylish clothing for both men and women. From romantic lace and flowy maxi dresses to edgy leather jackets and timeless trench coats, this store has something for everyone.', NULL);
/* SET IDENTITY_INSERT [dbo].[Product] OFF */
 
/* SET IDENTITY_INSERT [dbo].[ProductDetail] ON */ 

INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (4, 2, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '32', 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (5, 2, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '34',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (6, 3, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'L',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (7, 3, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'XL',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (8, 4, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'S',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (9, 4, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'M', 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (10, 5, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'M',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (11, 5, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'L', 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (12, 6, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'M',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (13, 6, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'L', 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (14, 7, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '5',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (15, 7, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '6', 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (16, 8, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '5',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (17, 8, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '6',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (18, 9, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '7', 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (19, 9, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '8',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (20, 10, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'L',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (21, 10, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'XL', 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (22, 11, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '32',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (23, 11, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '34', 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (24, 12, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'M',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (25, 12, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 'L',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (26, 13, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '28',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (27, 13, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '30',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (28, 14, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '4',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (29, 14, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '5',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (30, 15, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '4',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (31, 15, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', '5',  0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (32, 16, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  100, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (33, 16, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  100, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (34, 17, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg', 100, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (35, 17, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  100, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (36, 18, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  100, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (37, 18, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  100, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (38, 19, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  200, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (39, 19, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  200, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (40, 20, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  200, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 100, 10);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (41, 20, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  200, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (42, 21, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  200, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 150, 15);
INSERT `ProductDetail` (`ID`, `ProductID`, `ImageURL`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`) VALUES (43, 21, 'https://cdn.pixabay.com/photo/2024/05/13/04/47/ai-generated-8758045_640.jpg',  200, 0, CAST('2024-05-19T10:54:44.547' AS DateTime(3)), 1, 200, 20);
/* SET IDENTITY_INSERT [dbo].[ProductDetail] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Role] ON */ 

INSERT `Role` (`ID`, `Name`, `IsDeleted`, `CreatedAt`) VALUES (1, 'Admin', 0, CAST('2024-05-19T13:48:28.640' AS DateTime(3)));
INSERT `Role` (`ID`, `Name`, `IsDeleted`, `CreatedAt`) VALUES (2, 'Marketing', 0, CAST('2024-05-19T13:48:28.640' AS DateTime(3)));
INSERT `Role` (`ID`, `Name`, `IsDeleted`, `CreatedAt`) VALUES (3, 'Sale', 0, CAST('2024-05-19T13:48:28.640' AS DateTime(3)));
INSERT `Role` (`ID`, `Name`, `IsDeleted`, `CreatedAt`) VALUES (4, 'Sale leader', 0, CAST('2024-05-19T13:48:50.670' AS DateTime(3)));
INSERT `Role` (`ID`, `Name`, `IsDeleted`, `CreatedAt`) VALUES (5, 'User', 0, CAST('2024-05-19T13:48:59.990' AS DateTime(3)));
/* SET IDENTITY_INSERT [dbo].[Role] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Settings] ON */ 

INSERT `Settings` (`ID`, `Type`, `Value`, `Order`, `CreatedBy`, `isDeleted`, `description`) VALUES (1, 'Money', 'VND', 1, 1, 0, 'This is a setting');
INSERT `Settings` (`ID`, `Type`, `Value`, `Order`, `CreatedBy`, `isDeleted`, `description`) VALUES (2, 'Time', '24h', 2, 1, 0, 'This is a setting');
/* SET IDENTITY_INSERT [dbo].[Settings] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Slider] ON */ 

INSERT `Slider` (`ID`, `Title`, `ImageURL`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ProductId`, `Notes`, `Backlink`) VALUES (1, 'Title 1', 'https://img.freepik.com/premium-vector/modern-sale-banner-website-slider-template-design_54925-46.jpg', 0, CAST('2024-06-06T00:00:00.000' AS DateTime(3)), 0, NULL, NULL, 'empty');
INSERT `Slider` (`ID`, `Title`, `ImageURL`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ProductId`, `Notes`, `Backlink`) VALUES (2, 'Title 2', 'https://i.pinimg.com/736x/b6/89/96/b68996b0aeb13339740f961ada455a77.jpg', 0, CAST('2024-06-06T00:00:00.000' AS DateTime(3)), 0, NULL, '', 'empty');
/* SET IDENTITY_INSERT [dbo].[Slider] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Staff] ON */ 

INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (1, 'a@a.a', NULL, 'John Doe', 'Male', '1234 Elm Street, Springfield, IL', '123-456-7890', 1, 1, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 1, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (2, 'user2@example.com', 'hashed_password2', 'Jane Doe', 'Female', '2345 Oak Street, Springfield, IL', '234-567-8901', 2, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 2, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (3, 'user3@example.com', 'hashed_password3', 'Jim Beam', 'Male', '3456 Pine Street, Springfield, IL', '345-678-9012', 3, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 3, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (4, 'user4@example.com', 'hashed_password4', 'Jack Daniels', 'Male', '4567 Maple Street, Springfield, IL', '456-789-0123', 4, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 4, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (5, 'user5@example.com', 'hashed_password5', 'Johnny Walker', 'Male', '5678 Cedar Street, Springfield, IL', '567-890-1234', 1, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 1, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (6, 'user6@example.com', 'hashed_password6', 'Jill Valentine', 'Female', '6789 Birch Street, Springfield, IL', '678-901-2345', 2, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 2, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (7, 'user7@example.com', 'hashed_password7', 'Chris Redfield', 'Male', '7890 Spruce Street, Springfield, IL', '789-012-3456', 3, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 3, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (8, 'user8@example.com', 'hashed_password8', 'Claire Redfield', 'Female', '8901 Redwood Street, Springfield, IL', '890-123-4567', 4, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 4, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (9, 'user9@example.com', 'hashed_password9', 'Leon Kennedy', 'Male', '9012 Sequoia Street, Springfield, IL', '901-234-5678', 1, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 1, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (10, 'user10@example.com', 'hashed_password10', 'Ada Wong', 'Female', '0123 Cypress Street, Springfield, IL', '012-345-6789', 2, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 2, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (11, 'user11@example.com', 'hashed_password11', 'Albert Wesker', 'Male', '1234 Fir Street, Springfield, IL', '123-456-7891', 3, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 3, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (12, 'user12@example.com', 'hashed_password12', 'Rebecca Chambers', 'Female', '2345 Hemlock Street, Springfield, IL', '234-567-8902', 4, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 4, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (13, 'user13@example.com', 'hashed_password13', 'Barry Burton', 'Male', '3456 Palm Street, Springfield, IL', '345-678-9013', 1, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 1, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (14, 'user14@example.com', 'hashed_password14', 'Sherry Birkin', 'Female', '4567 Mahogany Street, Springfield, IL', '456-789-0124', 2, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 2, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
INSERT `Staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES (15, 'user15@example.com', 'hashed_password15', 'HUNK', 'Male', '5678 Teak Street, Springfield, IL', '567-890-1235', 3, 0, CAST('2024-05-22T23:21:10.153' AS DateTime(3)), 3, 'https://www.svgrepo.com/show/452030/avatar-default.svg');
/* SET IDENTITY_INSERT [dbo].[Staff] OFF */
 
/* SET IDENTITY_INSERT [dbo].[User] ON */ 

INSERT `User` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`, `ChangeHistory`) VALUES (1, 'a', '123456', 'John Doe', 'Male', '123 Main St', '1234567890', 0, CAST('2024-05-19T10:53:56.770' AS DateTime(3)), 1, 'https://www.svgrepo.com/show/452030/avatar-default.svg', NULL);
INSERT `User` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`, `ChangeHistory`) VALUES (2, 'user2@example.com', 'pass2', 'Jane Smith', 'Female', '456 Elm St', '0987654321', 0, CAST('2024-05-19T10:53:56.770' AS DateTime(3)), 1, 'https://www.svgrepo.com/show/452030/avatar-default.svg', NULL);
/* SET IDENTITY_INSERT [dbo].[User] OFF */
 
/* SET ANSI_PADDING ON */
 
/* SQLINES DEMO *** ex [UQ__Staff__A9D105343E45CBAA]    Script Date: 6/9/2024 11:14:27 PM ******/
ALTER TABLE `Staff` ADD UNIQUE 
(
	`Email` ASC
) ;
 
/* SET ANSI_PADDING ON */
 
/* SQLINES DEMO *** ex [UQ__User__A9D10534547D4356]    Script Date: 6/9/2024 11:14:27 PM ******/
ALTER TABLE `User` ADD UNIQUE 
(
	`Email` ASC
) ;
ALTER TABLE `Cart` ADD FOREIGN KEY(`ProductDetailID`)
REFERENCES `ProductDetail` (`ID`);
 
ALTER TABLE `Cart` ADD FOREIGN KEY(`UserID`)
REFERENCES `User` (`ID`);
 
ALTER TABLE `Order` ADD FOREIGN KEY(`UserID`)
REFERENCES `User` (`ID`);
 
ALTER TABLE `OrderDetail` ADD FOREIGN KEY(`OrderID`)
REFERENCES `Order` (`ID`);
 
ALTER TABLE `OrderDetail` ADD FOREIGN KEY(`ProductDetailID`)
REFERENCES `ProductDetail` (`ID`);
 
ALTER TABLE `Post` ADD FOREIGN KEY(`CategoryID`)
REFERENCES `Category` (`ID`);
 
ALTER TABLE `Product` ADD FOREIGN KEY(`CategoryID`)
REFERENCES `Category` (`ID`);
 
ALTER TABLE `Product` ADD FOREIGN KEY(`CreatedBy`)
REFERENCES `Staff` (`ID`);
 
ALTER TABLE `ProductDetail` ADD FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ID`);
 
ALTER TABLE `Settings` ADD FOREIGN KEY(`CreatedBy`)
REFERENCES `Staff` (`ID`);
 
ALTER TABLE `Slider` ADD FOREIGN KEY(`ProductId`)
REFERENCES `Product` (`ID`);
 
ALTER TABLE `Staff` ADD FOREIGN KEY(`Role`)
REFERENCES `Role` (`ID`);