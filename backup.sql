;             
CREATE USER IF NOT EXISTS SA SALT 'c7877a888722b625' HASH '5795029df21b0ad1b93e884d792608e2495f54fc9728437ef86957026ba73763' ADMIN;           
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_7A480322_82AC_462A_AEDA_88208D9DAE89 START WITH 7 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_EB0D016C_655D_4CD9_BDCF_5EA44D2F465F START WITH 5 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E7E97EC9_0B27_4681_A25D_FFE8B766C468 START WITH 20 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_F28B665E_D125_4041_A592_7A216473A730 START WITH 8 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4658C309_D3A3_4DAA_80F5_4004D398D1FA START WITH 20 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E4A926F3_E9F5_45CF_BEEE_28CD0D83A2DC START WITH 5 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_DE6200A4_A2EB_47F0_86D6_3056078A8ED4 START WITH 5 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9246D7D0_1DAF_4A3B_8E92_E48A1591101A START WITH 5 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E646DA48_86A8_4997_8296_A636A837E6A0 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FE8D496D_70E3_493D_B2A6_D30652FF1CF2 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_DBE65B66_06C7_44CE_B6AA_9D019B634305 START WITH 23 BELONGS_TO_TABLE;   
CREATE CACHED TABLE PUBLIC.AUTHORITIES(
    AUTHORITIESID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_4658C309_D3A3_4DAA_80F5_4004D398D1FA) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4658C309_D3A3_4DAA_80F5_4004D398D1FA,
    AUTHORITY VARCHAR(255),
    USERNAME VARCHAR(255)
);            
ALTER TABLE PUBLIC.AUTHORITIES ADD CONSTRAINT PUBLIC.CONSTRAINT_A PRIMARY KEY(AUTHORITIESID); 
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.AUTHORITIES;             
INSERT INTO PUBLIC.AUTHORITIES(AUTHORITIESID, AUTHORITY, USERNAME) VALUES
(1, 'ROLE_ADMIN', 'admin'),
(2, 'ROLE_USER', 'cristy'),
(3, 'ROLE_USER', 'dany'),
(18, 'ROLE_USER', 'paty'),
(19, 'ROLE_USER', 'carlos');      
CREATE CACHED TABLE PUBLIC.CART(
    CARTID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_DE6200A4_A2EB_47F0_86D6_3056078A8ED4) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_DE6200A4_A2EB_47F0_86D6_3056078A8ED4,
    GRANDTOTAL DOUBLE NOT NULL,
    CUSTOMERID INTEGER
);         
ALTER TABLE PUBLIC.CART ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(CARTID);               
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.CART;    
INSERT INTO PUBLIC.CART(CARTID, GRANDTOTAL, CUSTOMERID) VALUES
(1, 75.0, 1),
(2, 0.0, 2),
(3, 0.0, 3),
(4, 315.2, 4);     
CREATE CACHED TABLE PUBLIC.CARTITEM(
    CARTITEMID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_F28B665E_D125_4041_A592_7A216473A730) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_F28B665E_D125_4041_A592_7A216473A730,
    QUANTITY INTEGER NOT NULL,
    TOTALPRICE DOUBLE NOT NULL,
    CARTID INTEGER,
    PRODUCTID INTEGER
);             
ALTER TABLE PUBLIC.CARTITEM ADD CONSTRAINT PUBLIC.CONSTRAINT_2 PRIMARY KEY(CARTITEMID);       
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.CARTITEM;
INSERT INTO PUBLIC.CARTITEM(CARTITEMID, QUANTITY, TOTALPRICE, CARTID, PRODUCTID) VALUES
(3, 1, 15.2, 3, 13),
(4, 1, 75.0, 3, 20),
(7, 4, 60.8, 1, 13);     
CREATE CACHED TABLE PUBLIC.COMMENT(
    COMMENTID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_FE8D496D_70E3_493D_B2A6_D30652FF1CF2) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FE8D496D_70E3_493D_B2A6_D30652FF1CF2,
    COMMENT VARCHAR(500) NOT NULL,
    COMMENTTITLE VARCHAR(20) NOT NULL,
    NICKNAME VARCHAR(255),
    RATING DOUBLE NOT NULL,
    TIME TIMESTAMP NOT NULL,
    PRODUCTID INTEGER
);  
ALTER TABLE PUBLIC.COMMENT ADD CONSTRAINT PUBLIC.CONSTRAINT_6 PRIMARY KEY(COMMENTID);         
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.COMMENT; 
CREATE CACHED TABLE PUBLIC.CREDITCARD(
    CREDITCARDID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_EB0D016C_655D_4CD9_BDCF_5EA44D2F465F) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_EB0D016C_655D_4CD9_BDCF_5EA44D2F465F,
    CARDVERIFICATIONVALUE VARCHAR(255) NOT NULL,
    CREDITCARDNAME VARCHAR(255) NOT NULL,
    CREDITCARDNUMBER VARCHAR(255) NOT NULL,
    EXPIRATIONMONTH VARCHAR(255) NOT NULL,
    EXPIRATIONYEAR VARCHAR(255) NOT NULL,
    CUSTOMERID INTEGER
);             
ALTER TABLE PUBLIC.CREDITCARD ADD CONSTRAINT PUBLIC.CONSTRAINT_F PRIMARY KEY(CREDITCARDID);   
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.CREDITCARD;              
INSERT INTO PUBLIC.CREDITCARD(CREDITCARDID, CARDVERIFICATIONVALUE, CREDITCARDNAME, CREDITCARDNUMBER, EXPIRATIONMONTH, EXPIRATIONYEAR, CUSTOMERID) VALUES
(1, '123', 'Cristina Villa', '7638762786768768', '09', '2020', 1),
(2, '123', 'Daniela rivero', '7687676786876866', '10', '2020', 2),
(3, '123', 'Patricia Villa', '2342342432342342', '09', '2020', 3),
(4, '123', 'Carlos Villa', '5675675765765765', '09', '2020', 4);        
CREATE CACHED TABLE PUBLIC.CUSTOMERORDER(
    CUSTOMERORDERID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_7A480322_82AC_462A_AEDA_88208D9DAE89) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_7A480322_82AC_462A_AEDA_88208D9DAE89,
    CARTID INTEGER,
    CREDITCARDID INTEGER,
    CUSTOMERID INTEGER,
    SHIPPINGADDRESSID INTEGER
);        
ALTER TABLE PUBLIC.CUSTOMERORDER ADD CONSTRAINT PUBLIC.CONSTRAINT_3 PRIMARY KEY(CUSTOMERORDERID);             
-- 6 +/- SELECT COUNT(*) FROM PUBLIC.CUSTOMERORDER;           
INSERT INTO PUBLIC.CUSTOMERORDER(CUSTOMERORDERID, CARTID, CREDITCARDID, CUSTOMERID, SHIPPINGADDRESSID) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 1, 1),
(3, 1, 1, 1, 1),
(4, 1, 1, 1, 1),
(5, 1, 1, 1, 1),
(6, 4, 4, 4, 4);     
CREATE CACHED TABLE PUBLIC.PRODUCT(
    PRODUCTID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_DBE65B66_06C7_44CE_B6AA_9D019B634305) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_DBE65B66_06C7_44CE_B6AA_9D019B634305,
    PRODUCTAUTHOR VARCHAR(255),
    PRODUCTAUTHORBIO VARCHAR(255),
    PRODUCTCATEGORY VARCHAR(255),
    PRODUCTCONDITION VARCHAR(255),
    PRODUCTDESCRIPTION VARCHAR(255),
    PRODUCTNAME VARCHAR(255),
    PRODUCTPRICE DOUBLE NOT NULL,
    PRODUCTPUBLISHER VARCHAR(255),
    PRODUCTRELEASEDATE TIMESTAMP,
    PRODUCTSTATUS VARCHAR(255),
    TOPSELLERSTATUS VARCHAR(255),
    UNITINSTOCK INTEGER NOT NULL,
    NUMRATING DOUBLE,
    RATING DOUBLE,
    TOTAL_RATING DOUBLE
);      
ALTER TABLE PUBLIC.PRODUCT ADD CONSTRAINT PUBLIC.CONSTRAINT_18 PRIMARY KEY(PRODUCTID);        
-- 22 +/- SELECT COUNT(*) FROM PUBLIC.PRODUCT;
INSERT INTO PUBLIC.PRODUCT(PRODUCTID, PRODUCTAUTHOR, PRODUCTAUTHORBIO, PRODUCTCATEGORY, PRODUCTCONDITION, PRODUCTDESCRIPTION, PRODUCTNAME, PRODUCTPRICE, PRODUCTPUBLISHER, PRODUCTRELEASEDATE, PRODUCTSTATUS, TOPSELLERSTATUS, UNITINSTOCK, NUMRATING, RATING, TOTAL_RATING) VALUES
(11, 'Ernest Cline', 'Ernest Christy Cline is an American novelist, slam poet, and screenwriter. He is known for his novels Ready Player One and Armada; he also co-wrote the screenplay for the film adaptation of Ready Player One, directed by Steven Spielberg.', 'LitRPG, Science Fiction, Dystopian', 'new', 'This is a futuristic book', 'Ready Player One', 25.0, 'Random House', TIMESTAMP '2011-08-16 00:00:00', 'active', 'active', 40, 0.0, 0.0, 0.0),
(12, 'Steve McConnell', 'Steven C. McConnell is an author of software engineering textbooks such as Code Complete, Rapid Development, and Software Estimation. He is cited as an expert in software engineering and project management.', 'Computer programming', 'new', 'This is A Practical Handbook of Software Construction', 'Code Complete', 100.0, '', TIMESTAMP '1993-08-12 00:00:00', 'active', 'inactive', 70, 0.0, 0.0, 0.0),
(13, 'Alan Moore', 'Alan Moore is an English writer known primarily for his work in comic books including Watchmen, V for Vendetta, The Ballad of Halo Jones and From Hell.', 'Comic, Superheroes, Futuristic', 'new', 'This is a comic', 'Watchmen', 15.2, 'DC Comics', TIMESTAMP '1986-09-15 00:00:00', 'active', 'inactive', 8, 0.0, 0.0, 0.0),
(14, 'J. R. R. Tolkien', 'John Ronald Reuel Tolkien, CBE FRSL was an English writer, poet, philologist, and university professor who is best known as the author of the classic high fantasy works The Hobbit, The Lord of the Rings, and The Silmarillion.', 'Fantasy, Adventure', 'new', 'This is a fantasy book', 'The Lord of the Rings', 22.2, 'Allen & Unwin', TIMESTAMP '1954-07-29 00:00:00', 'active', 'active', 6, 0.0, 0.0, 0.0),
(15, 'Isaac Asimov', 'Isaac Asimov was an American writer and professor of biochemistry at Boston University. He was known for his works of science fiction and popular science.', 'Science fiction', 'new', 'This is a science fiction', 'I, Robot', 50.0, 'Gnome Press', TIMESTAMP '1950-12-02 00:00:00', 'active', 'inactive', 5, 0.0, 0.0, 0.0),
(16, 'Neal Stephenson', 'Neal Town Stephenson is an American writer and game designer known for his works of speculative fiction. His novels have been categorized as science fiction, historical fiction, cyberpunk, postcyberpunk, and baroque.', 'Science fiction, Cyberpunk, Postcyberpunk', 'new', 'This is a science fiction novel', 'Snow Crash', 11.2, 'Bantam Books (USA)', TIMESTAMP '1992-06-24 00:00:00', 'active', 'inactive', 60, 0.0, 0.0, 0.0),
(17, 'Douglas Adams', 'Douglas Noel Adams was an English author, scriptwriter, essayist, humorist, satirist and dramatist. Adams was author of The Hitchhiker''s Guide to the Galaxy, which originated in 1978 as a BBC radio', 'Comic science fiction', 'new', 'This is a comedy science fiction', 'The Ultimate Hitchhiker''s Guide to the Galaxy', 14.0, 'Pan Books', TIMESTAMP '1979-10-12 00:00:00', 'active', 'inactive', 6, 0.0, 0.0, 0.0),
(18, 'William Gibson', 'William Ford Gibson is an American-Canadian speculative fiction writer and essayist widely credited with pioneering the science fiction subgenre known as cyberpunk.', 'Science fiction, cyberpunk', 'new', 'this is a science fiction', 'Neuromancer', 18.2, 'Ace', TIMESTAMP '1984-07-01 00:00:00', 'active', 'inactive', 15, 0.0, 0.0, 0.0),
(19, 'Scarlett Thomas', 'Scarlett Thomas is an English author and creative writing teacher. She has written nine novels, including The End of Mr. Y and PopCo, and the Worldquake series of children''s books.', 'Novel', 'new', 'This a curse book', 'The End of Mr. Y', 16.0, 'Harcourt Books', TIMESTAMP '2006-04-05 00:00:00', 'active', 'inactive', 14, 0.0, 0.0, 0.0),
(21, 'Holly Smale', 'Holly Smale is a British writer. Her first published book, Geek Girl, won the 2014 Waterstones Children''s Book Prize and was shortlisted for the Roald Dahl Funny Prize 2013. Smale is writing a 6-book teen fiction series, also called Geek Girl.', 'Young adult fiction, Fiction', 'new', 'This is a debut novel', 'Geek Girl', 50.0, 'HarperCollins', TIMESTAMP '2013-02-28 00:00:00', 'active', 'active', 40, 0.0, 0.0, 0.0);               
INSERT INTO PUBLIC.PRODUCT(PRODUCTID, PRODUCTAUTHOR, PRODUCTAUTHORBIO, PRODUCTCATEGORY, PRODUCTCONDITION, PRODUCTDESCRIPTION, PRODUCTNAME, PRODUCTPRICE, PRODUCTPUBLISHER, PRODUCTRELEASEDATE, PRODUCTSTATUS, TOPSELLERSTATUS, UNITINSTOCK, NUMRATING, RATING, TOTAL_RATING) VALUES
(22, 'Stephenie Meyer', 'Stephenie Meyer is an American novelist and film producer, best known for her vampire romance series Twilight. The Twilight novels have gained worldwide recognition and sold over 100 million copies, with translations into 37 different languages', 'Young adult, Fantasy, Romance', 'new', 'this is a romance book', 'Eclipse', 15.0, 'Little, Brown', TIMESTAMP '2007-08-07 00:00:00', 'active', 'inactive', 4, 0.0, 0.0, 0.0),
(1, 'J.K Rowling', 'Joanne Rowling, CH, OBE, FRSL, FRCPE, writing under the pen names J. K. Rowling and Robert Galbraith, is a British novelist, philanthropist, film and television producer and screenwriter best known for writing the Harry Potter fantasy series.', 'Fantasy, Drama, Young Adult fiction, mystery, Thriller', 'new', 'Thi is a magical book', 'Harry Potter and The Sorcerer''s Stone', 50.0, 'Bloomsbury Publishing (UK), Scholastic (US)', TIMESTAMP '1997-06-26 00:00:00', 'active', 'active', 15, 0.0, 0.0, 0.0),
(2, 'Stephenie Meyer', 'Stephenie Meyer is an American novelist and film producer, best known for her vampire romance series Twilight. The Twilight novels have gained worldwide recognition and sold over 100 million copies, with translations into 37 different languages.', 'Young adult, fanatasy, romance, vampire', 'new', 'This is a romance book', 'Twilight', 25.5, 'Little, Brown, and Company', TIMESTAMP '2005-10-05 00:00:00', 'active', 'active', 60, 0.0, 0.0, 0.0),
(3, 'C.S. Lewis', 'Clive Staples Lewis was a British novelist, poet, academic, medievalist, literary critic, essayist, lay theologian, broadcaster, lecturer, and Christian apologist. He held academic positions at both Oxford University and Cambridge University.', 'Fantasy Children''s literature', 'new', 'This is a fantasy book', 'Narnia', 15.4, 'HaperCollins', TIMESTAMP '1950-10-16 00:00:00', 'active', 'inactive', 50, 0.0, 0.0, 0.0),
(4, 'Stephen King', 'Stephen Edwin King is an American author of horror, supernatural fiction, suspense, science fiction and fantasy', 'Horror, Thriller', 'new', 'This is a scary book', 'IT', 20.0, 'Viking', TIMESTAMP '1986-09-15 00:00:00', 'active', 'inactive', 18, 0.0, 0.0, 0.0),
(5, 'Suzanne Collins', 'Suzanne Collins is an American television writer and author, best known as the author of The New York Times best selling series The Underland Chronicles and The Hunger Games trilogy.', 'Dystopian, adventure, science fiction, drama, action', 'new', 'This is a fictional book', 'The Hunger Games', 23.0, 'Scholastic', TIMESTAMP '2008-09-14 00:00:00', 'active', 'active', 40, 0.0, 0.0, 0.0),
(6, 'John Green', 'John Michael Green is an American author, vlogger, writer, producer, actor, editor, and educator. He won the 2006 Printz Award for his debut novel, Looking for Alaska, and his sixth novel, The Fault in ...', 'Young adult novel Realistic Fiction, Drama, romance', 'new', 'This is a Romance book', 'The Fault in Our Stars', 20.0, 'Dutton Books', TIMESTAMP '2012-01-10 00:00:00', 'active', 'inactive', 65, 0.0, 0.0, 0.0),
(7, 'Arthur Golden', 'Arthur Sulzberger Golden is an American writer. He is the author of the bestselling novel Memoirs of a Geisha.', 'Historical novel', 'new', 'This is a life story', 'Memoirs of a Geisha', 22.0, 'Alfred A. Knopf', TIMESTAMP '1997-09-27 00:00:00', 'active', 'inactive', 5, 0.0, 0.0, 0.0),
(8, 'Veronica Roth', 'Veronica Anne Roth is an American novelist and short story writer, known for her debut New York Times bestselling Divergent trilogy, consisting of Divergent, Insurgent, and Allegiant; and Four: A Divergent Collection.', 'Science fiction, dystopia, young adult fiction', 'new', 'This is an adult fiction', 'Divergent', 25.0, 'Katherine Tegen Books', TIMESTAMP '2011-04-26 00:00:00', 'active', 'active', 45, 0.0, 0.0, 0.0),
(9, 'Antoine de Saint-Exupery', STRINGDECODE('Antoine Marie Jean-Baptiste Roger, comte de Saint-Exup\u00e9ry was a French writer, poet, aristocrat, journalist, and pioneering aviator. He became a laureate of several of France''s highest literary awards and also won the U.S. National Book Award.'), 'Kid''s literature', 'new', 'This is a kid''s book', 'The Little Prince', 15.0, 'Reynal & Hitchcock', TIMESTAMP '1943-04-20 00:00:00', 'active', 'inactive', 40, 0.0, 0.0, 0.0);   
INSERT INTO PUBLIC.PRODUCT(PRODUCTID, PRODUCTAUTHOR, PRODUCTAUTHORBIO, PRODUCTCATEGORY, PRODUCTCONDITION, PRODUCTDESCRIPTION, PRODUCTNAME, PRODUCTPRICE, PRODUCTPUBLISHER, PRODUCTRELEASEDATE, PRODUCTSTATUS, TOPSELLERSTATUS, UNITINSTOCK, NUMRATING, RATING, TOTAL_RATING) VALUES
(10, 'Mary Shelley', 'Mary Wollstonecraft Shelley was an English novelist, short story writer, dramatist, essayist, biographer, and travel writer, best known for her Gothic novel Frankenstein: or, The Modern Prometheus', 'Gothic novel, horror fiction, soft science fiction', 'new', 'this is a horror story', 'Frankenstein', 24.0, 'Lackington, hughes, Harding, Mavor & Jones', TIMESTAMP '1818-01-01 00:00:00', 'active', 'inactive', 50, 0.0, 0.0, 0.0),
(20, 'Stephen Hawking', 'Stephen William Hawking CH CBE FRS FRSA was an English theoretical physicist, cosmologist, and author, who was director of research at the Centre for Theoretical Cosmology at the University of Cambridge at the time of his death.', 'Cosmology', 'new', 'This is a study of the universe', 'A Brief History of Time', 75.0, 'Bantam Dell Publishing Group', TIMESTAMP '1988-06-18 00:00:00', 'active', 'inactive', 80, 0.0, 0.0, 0.0);   
CREATE CACHED TABLE PUBLIC.RATING(
    RATINGID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_E646DA48_86A8_4997_8296_A636A837E6A0) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E646DA48_86A8_4997_8296_A636A837E6A0,
    RATING INTEGER NOT NULL,
    TIME TIMESTAMP,
    CUSTOMERID INTEGER,
    PRODUCTID INTEGER
);           
ALTER TABLE PUBLIC.RATING ADD CONSTRAINT PUBLIC.CONSTRAINT_8 PRIMARY KEY(RATINGID);           
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.RATING;  
CREATE CACHED TABLE PUBLIC.SHIPPINGADDRESS(
    SHIPPINGADDRESSID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_E4A926F3_E9F5_45CF_BEEE_28CD0D83A2DC) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E4A926F3_E9F5_45CF_BEEE_28CD0D83A2DC,
    APARTMENTNUMBER VARCHAR(255),
    CITY VARCHAR(255),
    COUNTRY VARCHAR(255),
    STATE VARCHAR(255),
    STREETNAME VARCHAR(255),
    ZIPCODE VARCHAR(255),
    CUSTOMERID INTEGER
);            
ALTER TABLE PUBLIC.SHIPPINGADDRESS ADD CONSTRAINT PUBLIC.CONSTRAINT_26 PRIMARY KEY(SHIPPINGADDRESSID);        
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.SHIPPINGADDRESS;         
INSERT INTO PUBLIC.SHIPPINGADDRESS(SHIPPINGADDRESSID, APARTMENTNUMBER, CITY, COUNTRY, STATE, STREETNAME, ZIPCODE, CUSTOMERID) VALUES
(1, '567', 'Miami', 'USA', 'Florida', '342 nw 32 st', '33178', 1),
(2, '', 'Valencia', 'USA', 'Florida', '213 nw 23 st', '21321', 2),
(3, '', 'Miami', 'USA', 'Florida', '324 nw 54 st', '23233', 3),
(4, '', 'Miami', 'USA', 'Florida', '324 nw', '32132', 4);      
CREATE CACHED TABLE PUBLIC.USERS(
    USERID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_E7E97EC9_0B27_4681_A25D_FFE8B766C468) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E7E97EC9_0B27_4681_A25D_FFE8B766C468,
    CUSTOMERID INTEGER NOT NULL,
    ENABLED BOOLEAN NOT NULL,
    PASSWORD VARCHAR(255),
    USERNAME VARCHAR(255)
);         
ALTER TABLE PUBLIC.USERS ADD CONSTRAINT PUBLIC.CONSTRAINT_4 PRIMARY KEY(USERID);              
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.USERS;   
INSERT INTO PUBLIC.USERS(USERID, CUSTOMERID, ENABLED, PASSWORD, USERNAME) VALUES
(1, 0, TRUE, 'admin', 'admin'),
(2, 1, TRUE, '123', 'cristy'),
(3, 2, TRUE, 'Abcde12345!', 'dany'),
(18, 3, TRUE, 'Abcde12345!', 'paty'),
(19, 4, TRUE, 'Abcde12345!', 'carlos');       
CREATE CACHED TABLE PUBLIC.CUSTOMER(
    CUSTOMERID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_9246D7D0_1DAF_4A3B_8E92_E48A1591101A) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9246D7D0_1DAF_4A3B_8E92_E48A1591101A,
    CUSTOMEREMAIL VARCHAR(255) NOT NULL,
    CUSTOMERNAME VARCHAR(255) NOT NULL,
    CUSTOMERPHONE VARCHAR(255),
    ENABLED BOOLEAN NOT NULL,
    NICKNAME VARCHAR(255),
    PASSWORD VARCHAR(255) NOT NULL,
    USERNAME VARCHAR(255) NOT NULL,
    CARTID INTEGER,
    CREDITCARDID INTEGER,
    SHIPPINGADDRESSID INTEGER
);  
ALTER TABLE PUBLIC.CUSTOMER ADD CONSTRAINT PUBLIC.CONSTRAINT_5 PRIMARY KEY(CUSTOMERID);       
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.CUSTOMER;
INSERT INTO PUBLIC.CUSTOMER(CUSTOMERID, CUSTOMEREMAIL, CUSTOMERNAME, CUSTOMERPHONE, ENABLED, NICKNAME, PASSWORD, USERNAME, CARTID, CREDITCARDID, SHIPPINGADDRESSID) VALUES
(1, 'cristy@gmail.com', 'cristi', '347823897798', TRUE, 'crispy', '123', 'cristy', 1, 1, 1),
(2, 'dany@gmail.com', 'daniela mestres', '32432442342', TRUE, 'nanix', 'Abcde12345!', 'dani', 2, 2, 2),
(3, 'paty@gmail.com', 'patricia', '234234243', TRUE, 'paty', 'Abcde12345!', 'paty', 3, 3, 3),
(4, 'carlos@gmail.com', 'Carlos', '1234568523', TRUE, 'carlitos', 'Abcde12345!', 'carlos', 4, 4, 4);        
ALTER TABLE PUBLIC.CARTITEM ADD CONSTRAINT PUBLIC.FK4393E73EBF266E FOREIGN KEY(CARTID) REFERENCES PUBLIC.CART(CARTID) NOCHECK;
ALTER TABLE PUBLIC.CARTITEM ADD CONSTRAINT PUBLIC.FK4393E7396F47F46 FOREIGN KEY(PRODUCTID) REFERENCES PUBLIC.PRODUCT(PRODUCTID) NOCHECK;      
ALTER TABLE PUBLIC.CART ADD CONSTRAINT PUBLIC.FK1FEF40E0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES PUBLIC.CUSTOMER(CUSTOMERID) NOCHECK;        
ALTER TABLE PUBLIC.CUSTOMERORDER ADD CONSTRAINT PUBLIC.FKAEF781F0DCADD6E0 FOREIGN KEY(CREDITCARDID) REFERENCES PUBLIC.CREDITCARD(CREDITCARDID) NOCHECK;       
ALTER TABLE PUBLIC.CUSTOMERORDER ADD CONSTRAINT PUBLIC.FKAEF781F029925394 FOREIGN KEY(SHIPPINGADDRESSID) REFERENCES PUBLIC.SHIPPINGADDRESS(SHIPPINGADDRESSID) NOCHECK;        
ALTER TABLE PUBLIC.COMMENT ADD CONSTRAINT PUBLIC.FK9BDE863F96F47F46 FOREIGN KEY(PRODUCTID) REFERENCES PUBLIC.PRODUCT(PRODUCTID) NOCHECK;      
ALTER TABLE PUBLIC.SHIPPINGADDRESS ADD CONSTRAINT PUBLIC.FKBB1EE46E0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES PUBLIC.CUSTOMER(CUSTOMERID) NOCHECK;            
ALTER TABLE PUBLIC.RATING ADD CONSTRAINT PUBLIC.FK917A9DBD96F47F46 FOREIGN KEY(PRODUCTID) REFERENCES PUBLIC.PRODUCT(PRODUCTID) NOCHECK;       
ALTER TABLE PUBLIC.CUSTOMER ADD CONSTRAINT PUBLIC.FK27FBE3FE29925394 FOREIGN KEY(SHIPPINGADDRESSID) REFERENCES PUBLIC.SHIPPINGADDRESS(SHIPPINGADDRESSID) NOCHECK;             
ALTER TABLE PUBLIC.CUSTOMERORDER ADD CONSTRAINT PUBLIC.FKAEF781F0E0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES PUBLIC.CUSTOMER(CUSTOMERID) NOCHECK;             
ALTER TABLE PUBLIC.RATING ADD CONSTRAINT PUBLIC.FK917A9DBDE0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES PUBLIC.CUSTOMER(CUSTOMERID) NOCHECK;    
ALTER TABLE PUBLIC.CUSTOMERORDER ADD CONSTRAINT PUBLIC.FKAEF781F0EBF266E FOREIGN KEY(CARTID) REFERENCES PUBLIC.CART(CARTID) NOCHECK;          
ALTER TABLE PUBLIC.CUSTOMER ADD CONSTRAINT PUBLIC.FK27FBE3FEEBF266E FOREIGN KEY(CARTID) REFERENCES PUBLIC.CART(CARTID) NOCHECK;               
ALTER TABLE PUBLIC.CUSTOMER ADD CONSTRAINT PUBLIC.FK27FBE3FEDCADD6E0 FOREIGN KEY(CREDITCARDID) REFERENCES PUBLIC.CREDITCARD(CREDITCARDID) NOCHECK;            
ALTER TABLE PUBLIC.CREDITCARD ADD CONSTRAINT PUBLIC.FK552751C9E0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES PUBLIC.CUSTOMER(CUSTOMERID) NOCHECK;
