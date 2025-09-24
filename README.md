# 📚 Library Management Database (MySQL)

______________
  /             /|
 /____________ / |
|            |  |
|  LIBRARY   |  |
| MANAGEMENT |  |
|   SYSTEM   | /
|___________|/

---

## 📝 Assignment Details

**Student:** Germano Kapilo Katalahali  
**Course:** Power Learn Project – Week 8  
**Assignment:** Database Design & Programming with SQL  
**Chosen Question:** Question 1 – Build a Complete Database Management System  
**Submission Deadline:** Wednesday, 25th September 2025  
**GitHub Repository:** [Insert Your Repository Link Here](https://github.com/username/library-management)  

---

## ⚡ Features & Objectives

- Design and implement a **relational database** using **MySQL**  
- Fully **normalized tables** with **primary keys**, **foreign keys**, and **constraints**  
- **Track library operations**: Authors, Books, Members, Loans  
- Practice **SQL queries**, **joins**, and **aggregation**  

---

## 🏛️ Database Schema

| Table   | Columns & Constraints |
|---------|---------------------|
| **Authors** | `AuthorID` INT AUTO_INCREMENT PRIMARY KEY<br>`FirstName` VARCHAR(50) NOT NULL<br>`LastName` VARCHAR(50) NOT NULL<br>`Country` VARCHAR(50) |
| **Books** | `BookID` INT AUTO_INCREMENT PRIMARY KEY<br>`Title` VARCHAR(100) NOT NULL<br>`AuthorID` INT NOT NULL, FOREIGN KEY (`AuthorID`) REFERENCES Authors(`AuthorID`)<br>`Genre` VARCHAR(50)<br>`PublishedYear` YEAR |
| **Members** | `MemberID` INT AUTO_INCREMENT PRIMARY KEY<br>`FirstName` VARCHAR(50) NOT NULL<br>`LastName` VARCHAR(50) NOT NULL<br>`Email` VARCHAR(100) UNIQUE<br>`Phone` VARCHAR(20) |
| **Loans** | `LoanID` INT AUTO_INCREMENT PRIMARY KEY<br>`BookID` INT NOT NULL, FOREIGN KEY (`BookID`) REFERENCES Books(`BookID`)<br>`MemberID` INT NOT NULL, FOREIGN KEY (`MemberID`) REFERENCES Members(`MemberID`)<br>`LoanDate` DATE NOT NULL<br>`ReturnDate` DATE |

**Relationships:**  
- Authors → Books (1-to-Many)  
- Members → Loans (1-to-Many)  
- Books → Loans (1-to-Many)  

---

## 💾 Deliverables

- `library.sql`  
  - `CREATE DATABASE` statement  
  - `CREATE TABLE` statements  
  - Primary and foreign key constraints  
  - Sample data for testing  

---

## 🚀 Quick Start (MySQL)

```bash
# Clone repository
git clone https://github.com/username/library-management.git
cd library-management

# Log in to MySQL
mysql -u <username> -p

# Load database
SOURCE library.sql;

# Verify tables
USE library;
SHOW TABLES;
SELECT * FROM Books;


---

🔎 Sample Queries

List all books with authors


SELECT b.Title, CONCAT(a.FirstName, ' ', a.LastName) AS AuthorName
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;

Show which member borrowed which book


SELECT CONCAT(m.FirstName, ' ', m.LastName) AS MemberName, b.Title, l.LoanDate
FROM Loans l
JOIN Members m ON l.MemberID = m.MemberID
JOIN Books b ON l.BookID = b.BookID;

Count total loans per member


SELECT CONCAT(m.FirstName, ' ', m.LastName) AS MemberName, COUNT(l.LoanID) AS TotalLoans
FROM Members m
LEFT JOIN Loans l ON m.MemberID = l.MemberID
GROUP BY m.MemberID;


---

🔧 Technologies Used






---

📌 Notes

Fully normalized MySQL database

Includes sample data for testing

Designed for learning SQL, constraints, and relational relationships



---

🤝 Contributions

Contributions are welcome! Possible improvements:

Add more entities: Categories, Reviews, Reservations

Integrate with a CRUD application (Node.js / FastAPI)

Optimize queries for performance



---

📬 Contact

Germano Kapilo Katalahali – passionate about education, technology, and building practical solutions

> “A library is not a luxury but one of the necessities of life.” – Henry Ward Beecher
