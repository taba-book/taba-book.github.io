-- practice_seed.sql
-- מסד התרגול של הספר. הכרעות #69 · #153.
--
-- שייך ל"מתרגלים" בלבד. אינו מסד האתר, ואין לו שום קשר אליו.
-- מסד האתר, usersDB.mdf, נבנה בתיבת "בונים" של פרק 4.2, מתוך הקובץ usersTbl.sql.
--
-- שלוש טבלאות: booksTbl (פרקים 4.2–4.8) · usersTbl ו-managerTbl (פרקים 4.12–4.17).
--
-- הפעלה, פעם אחת בלבד:
--   1. Add, New Item, SQL Server Database, בשם practiceDB.mdf, בתוך App_Data
--   2. ב-Server Explorer: לחיצה ימנית על practiceDB.mdf, New Query
--   3. הדביקו את כל הקובץ והריצו
--
-- שמונה השורות נבחרו כך שכל שאילתה בחלק 4 מחזירה תוצאה שרואים בה משהו:
--   WHERE genre = N'מתח'                  -> 3 מתוך 8
--   WHERE pages > 300 AND inStock = 1     -> 3   (B1003 ו-B1006 נופלים בגלל התנאי השני)
--   WHERE title LIKE N'ה%'                -> 4
--   ORDER BY pages DESC                   -> 540 412 388 356 320 275 240 198
--   GROUP BY author                       -> שלושה מחברים עם שתי שורות כל אחד

CREATE TABLE booksTbl
(
    bCode    NVARCHAR(6)  NOT NULL,
    title    NVARCHAR(30) NOT NULL,
    author   NVARCHAR(20) NOT NULL,
    genre    NVARCHAR(10) NOT NULL,
    pages    INT          NOT NULL,
    yearPub  INT          NOT NULL,
    inStock  BIT          NOT NULL,
    addedOn  DATE         NOT NULL,
    CONSTRAINT PK_booksTbl PRIMARY KEY (bCode)
);
GO

INSERT INTO booksTbl (bCode, title, author, genre, pages, yearPub, inStock, addedOn) VALUES
 (N'B1001', N'הבית שבקצה הרחוב', N'נועם ברק',  N'מתח',        320, 2019, 1, '2023-03-14'),
 (N'B1002', N'מסע אל הירח הכחול', N'תמר אלון',  N'מדע בדיוני', 275, 2021, 1, '2023-05-02'),
 (N'B1003', N'הגשר הישן',        N'נועם ברק',  N'מתח',        412, 2015, 0, '2022-11-20'),
 (N'B1004', N'ימים של קיץ',      N'רותם שגיא', N'רומן',       198, 2020, 1, '2024-01-08'),
 (N'B1005', N'המפתח האבוד',      N'דנה כרמי',  N'מתח',        356, 2022, 1, '2024-02-17'),
 (N'B1006', N'שפת המכונות',      N'איתי לוז',  N'עיון',       540, 2018, 0, '2022-09-05'),
 (N'B1007', N'הציפור הלבנה',     N'רותם שגיא', N'רומן',       240, 2023, 1, '2024-06-11'),
 (N'B1008', N'כוכבים מעל הנגב',  N'תמר אלון',  N'מדע בדיוני', 388, 2017, 1, '2023-08-29');
GO

-- טבלת החברים של התרגול (פרקים 4.12–4.17). אינה טבלת האתר.
CREATE TABLE usersTbl
(
    uName      NVARCHAR(20) NOT NULL,
    pass       NVARCHAR(20) NOT NULL,
    fName      NVARCHAR(20) NOT NULL,
    lName      NVARCHAR(20) NOT NULL,
    eMail      NVARCHAR(50) NULL,
    gender     NVARCHAR(10) NULL,
    city       NVARCHAR(20) NULL,
    birthYear  INT          NULL,
    hobbies    NVARCHAR(50) NULL,
    CONSTRAINT PK_usersTbl PRIMARY KEY (uName)
);
GO

INSERT INTO usersTbl (uName, pass, fName, lName, eMail, gender, city, birthYear, hobbies) VALUES
 (N'dana',  N'1234', N'דנה',  N'לוי',    N'dana@example.com',  N'נקבה', N'חיפה',    2009, N'ריקוד'),
 (N'yossi', N'abcd', N'יוסי', N'כהן',    N'yossi@example.com', N'זכר',  N'תל אביב', 2008, N'טניס'),
 (N'maor',  N'7777', N'מאור', N'בר',     N'maor@example.com',  N'זכר',  N'חיפה',    2009, N'משחקי מחשב'),
 (N'noa',   N'2580', N'נועה', N'שלו',    N'noa@example.com',   N'נקבה', N'ירושלים', 2010, N'ריקוד'),
 (N'omer',  N'qwer', N'עומר', N'אזולאי', N'omer@example.com',  N'זכר',  N'תל אביב', 2008, N'כדורגל');
GO

-- טבלת המנהלים של התרגול (פרק 4.13): מנהל אחד.
CREATE TABLE managerTbl
(
    mName  NVARCHAR(10) NOT NULL,
    pass   NVARCHAR(10) NOT NULL,
    CONSTRAINT PK_managerTbl PRIMARY KEY (mName)
);
GO

INSERT INTO managerTbl (mName, pass) VALUES (N'admin', N'admin');
GO
