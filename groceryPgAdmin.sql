BEGIN TRANSACTION;
CREATE TABLE category (
    "category_id"  SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, 
    "name_fr" TEXT NOT NULL, 
    type TEXT NOT NULL);

CREATE TABLE groceryList (
    "list_id" SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "category_id" TEXT,
    archived INTEGER NOT NULL,
    "nb_products" INTEGER NOT NULL);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "list_id" INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    "purchased"INTEGER NOT NULL);
    
    
    
CREATE TABLE productCategory (
    "product_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    PRIMARY KEY("product_id", "category_id"));
COMMIT;


BEGIN TRANSACTION;
INSERT INTO category VALUES(1,'Other','Autre','PRODUCT');
INSERT INTO category VALUES(2,'Vegetable','Legume','PRODUCT');
INSERT INTO category VALUES(3,'Fruit','Fruit','PRODUCT');
INSERT INTO category VALUES(4,'Meat','Viande','PRODUCT');
INSERT INTO category VALUES(5,'Fish','Poisson','PRODUCT');
INSERT INTO category VALUES(6,'Drink','Boisson','PRODUCT');
INSERT INTO category VALUES(7,'Cheese','Fromage','PRODUCT');
INSERT INTO category VALUES(8,'Bread','Pain','PRODUCT');
INSERT INTO category VALUES(9,'Snack','Collations','PRODUCT');
INSERT INTO category VALUES(10,'Cleaning','Entretien','PRODUCT');
INSERT INTO category VALUES(11,'Appliance','Electromenager','PRODUCT');
INSERT INTO category VALUES(12,'Other','Autre','LIST');
INSERT INTO category VALUES(13,'Daily','Quotidienne','LIST');
INSERT INTO category VALUES(14,'Weekly','Hebdomadaire','LIST');
INSERT INTO category VALUES(15,'DIY','Bricolage','LIST');
INSERT INTO category VALUES(16,'Plant','Plante','LIST');

INSERT INTO product VALUES(122,'1',23,1,0);
INSERT INTO product VALUES(123,'coca',23,45,1);
INSERT INTO product VALUES(133,'twitter',25,4,0);
INSERT INTO product VALUES(138,'yup',22,5,0);
INSERT INTO product VALUES(141,'riz',23,5,0);
INSERT INTO product VALUES(142,'emmental',22,4,0);
INSERT INTO product VALUES(143,'manga',22,5,0);
INSERT INTO product VALUES(144,'🍝',22,2,0);
INSERT INTO product VALUES(145,'tallegio',22,5,0);
INSERT INTO product VALUES(146,'perceuse',22,5,0);

INSERT INTO groceryList VALUES(22,'bonjour','Other',0,6);
INSERT INTO groceryList VALUES(23,'Pierre','Other',0,3);
INSERT INTO groceryList VALUES(25,'TanP','Plant',0,1);
INSERT INTO groceryList VALUES(27,'Test','Other',0,0);
INSERT INTO groceryList VALUES(31,'ghhl','DIY',0,0);

INSERT INTO productCategory VALUES(122,6);
INSERT INTO productCategory VALUES(123,6);
INSERT INTO productCategory VALUES(133,8);
INSERT INTO productCategory VALUES(141,1);
INSERT INTO productCategory VALUES(144,2);
INSERT INTO productCategory VALUES(138,6);
INSERT INTO productCategory VALUES(138,3);
INSERT INTO productCategory VALUES(142,7);
INSERT INTO productCategory VALUES(142,3);
INSERT INTO productCategory VALUES(143,1);
INSERT INTO productCategory VALUES(145,7);
INSERT INTO productCategory VALUES(146,7);
INSERT INTO productCategory VALUES(146,6);
INSERT INTO productCategory VALUES(146,2);
COMMIT;
