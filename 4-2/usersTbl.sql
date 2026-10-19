-- usersTbl.sql
-- טבלת המשתמשים של האתר שלכם, ובה עשרים משתמשים ראשונים. הכרעה #153.
-- זהה לטבלת המשתמשים של אתר הדוגמה: המבנה והנתונים, בקובץ אחד.
--
-- הפעלה, פעם אחת בלבד, בפרויקט האתר שלכם (תיבת "בונים" בסוף פרק 4.2):
--   1. Add, New Item, SQL Server Database, בשם usersDB.mdf, בתוך App_Data
--   2. ב-Server Explorer: לחיצה ימנית על usersDB.mdf, New Query
--   3. הדביקו את כל הקובץ והריצו
--
-- אחרי ההרצה: בשורה שבה בעמודה uName כתוב avi111, בעמודה fName, החליפו את השם אבי בשם הפרטי שלכם.

CREATE TABLE [dbo].[usersTbl]
(
	[uName] NVARCHAR(15) NOT NULL PRIMARY KEY, 
    [fName] NVARCHAR(10) NOT NULL, 
    [lName] NVARCHAR(10) NOT NULL, 
    [email] NVARCHAR(30) NOT NULL, 
    [yearBorn] INT NOT NULL, 
    [gender] NVARCHAR(6) NOT NULL, 
    [prefix] NVARCHAR(3) NOT NULL, 
    [phone] NVARCHAR(7) NOT NULL, 
    [city] NVARCHAR(15) NOT NULL, 
    [hob1] NCHAR(1) NULL, 
    [hob2] NCHAR(1) NULL, 
    [hob3] NCHAR(1) NOT NULL, 
    [hob4] NCHAR(1) NULL, 
    [hob5] NCHAR(1) NULL, 
    [pw] NVARCHAR(10) NOT NULL
)
GO

INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'avi111', N'אבי', N'כהן', N'avi111@example.com', 2009, N'זכר', N'050', N'3728415', N'חיפה', N'T', N'F', N'T', N'F', N'F', N'avi111')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'dana222', N'דנה', N'לוי', N'dana222@example.com', 2010, N'נקבה', N'052', N'8146273', N'חיפה', N'T', N'T', N'F', N'F', N'F', N'dana222')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'yossi333', N'יוסי', N'מזרחי', N'yossi333@example.com', 2008, N'זכר', N'053', N'5917348', N'חיפה', N'T', N'F', N'F', N'T', N'F', N'yossi333')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'maya444', N'מאיה', N'פרץ', N'maya444@example.com', 2011, N'נקבה', N'054', N'2683591', N'חיפה', N'F', N'T', N'T', N'F', N'F', N'maya444')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'omer555', N'עומר', N'ביטון', N'omer555@example.com', 2009, N'זכר', N'055', N'7451926', N'חיפה', N'F', N'F', N'T', N'F', N'T', N'omer555')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'noa666', N'נועה', N'אברהם', N'noa666@example.com', 2010, N'נקבה', N'057', N'3186452', N'תל-אביב-יפו', N'T', N'T', N'F', N'F', N'F', N'noa666')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'gal777', N'גל', N'שרון', N'gal777@example.com', 2012, N'זכר', N'058', N'9274163', N'תל-אביב-יפו', N'T', N'F', N'F', N'T', N'F', N'gal777')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'shira888', N'שירה', N'אלון', N'shira888@example.com', 2008, N'נקבה', N'02', N'6531978', N'תל-אביב-יפו', N'T', N'T', N'T', N'F', N'F', N'shira888')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'eitan999', N'איתן', N'דגן', N'eitan999@example.com', 2011, N'זכר', N'03', N'8712546', N'תל-אביב-יפו', N'F', N'F', N'F', N'F', N'F', N'eitan999')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'tamar121', N'תמר', N'גולן', N'tamar121@example.com', 2009, N'נקבה', N'04', N'2957814', N'נהרייה', N'T', N'T', N'F', N'F', N'F', N'tamar121')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'roni232', N'רוני', N'ברק', N'roni232@example.com', 2010, N'זכר', N'08', N'6148237', N'נהרייה', N'T', N'F', N'T', N'F', N'F', N'roni232')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'lior343', N'ליאור', N'נחום', N'lior343@example.com', 2012, N'נקבה', N'09', N'3591768', N'נהרייה', N'F', N'T', N'F', N'T', N'F', N'lior343')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'amit454', N'עמית', N'קסטרו', N'amit454@example.com', 2008, N'זכר', N'077', N'8265193', N'נהרייה', N'T', N'F', N'F', N'F', N'F', N'amit454')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'yael565', N'יעל', N'שמש', N'yael565@example.com', 2011, N'נקבה', N'050', N'5872341', N'כרמיאל', N'T', N'T', N'T', N'T', N'T', N'yael565')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'adam676', N'אדם', N'רוזן', N'adam676@example.com', 2009, N'זכר', N'052', N'4739186', N'כרמיאל', N'F', N'F', N'T', N'F', N'F', N'adam676')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'libi787', N'ליבי', N'אשכנזי', N'libi787@example.com', 2010, N'נקבה', N'053', N'9146825', N'כרמיאל', N'T', N'F', N'F', N'F', N'F', N'libi787')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'nadav898', N'נדב', N'הרוש', N'nadav898@example.com', 2012, N'זכר', N'054', N'7318652', N'יהוד', N'T', N'T', N'F', N'F', N'F', N'nadav898')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'tal131', N'טל', N'בן-דוד', N'tal131@example.com', 2008, N'נקבה', N'055', N'2694817', N'יהוד', N'F', N'F', N'F', N'T', N'F', N'tal131')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'ido242', N'עידו', N'סלע', N'ido242@example.com', 2011, N'זכר', N'057', N'8523714', N'יהוד', N'T', N'F', N'T', N'F', N'F', N'ido242')
INSERT INTO [dbo].[usersTbl] ([uName], [fName], [lName], [email], [yearBorn], [gender], [prefix], [phone], [city], [hob1], [hob2], [hob3], [hob4], [hob5], [pw]) VALUES (N'inbar353', N'ענבר', N'צור', N'inbar353@example.com', 2010, N'נקבה', N'058', N'4176398', N'מטולה', N'F', N'T', N'F', N'F', N'F', N'inbar353')
GO
