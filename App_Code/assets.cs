using RestSharp;
using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using NsExcel = Microsoft.Office.Interop.Excel;


namespace eventsHall.App_Code
{
    public class assets
    {
        // פונקציה המקבלת מספר ומחזירה מחרוזת אקראית באורך המספר שקיבלה
        public static string GetRandStr(int length)
        {
            // התונה של ירון .jpg
            // "abcdefg.jpg" 36
            string chars = "abcdefghijklmnopqrstuvwxyz0123456789";
            string st = "";
            Random rnd = new Random();// יצירת אובייקט מסוג רנדום
            for (int i = 0; i < length; i++)
            {
                st += chars[rnd.Next(chars.Length)]; // 0 - 35 next() //מספר בין 0 ל 2 מליארד
                                                     // Next(0,10)  // 0-9
                                                     // דו ספרתי  Next(10,100)
                                                     // Next(100) // 0 -99
            }
            return st;

        }
        public static string SendEmail(string to, string subject, string body)
        {
            try
            {
                MailMessage newMail = new MailMessage();// יצירת אובייקט הודעת מייל

                // use the Gmail SMTP Host
                SmtpClient client = new SmtpClient("smtp.gmail.com");// יצירת אובייקט של קליינט לשרת שליחת דואר

                // Follow the RFS 5321 Email Standard
                newMail.From = new MailAddress("ig0527156194@gmail.com", "ישראל גרין");

                newMail.To.Add(to);// כתובת הנמען

                newMail.Subject = subject; // נושא המייל

                newMail.IsBodyHtml = true;// האם תוכן המייל הוא בשפת HTML
                newMail.Body = "<h1> " + body + " </h1><style>body{font-size:40px;}<style><div ></div>";

                // enable SSL for encryption across channels
                client.EnableSsl = true;
                // Port 465 for SSL communication
                client.Port = 587;
                // Provide authentication information with Gmail SMTP server to authenticate your sender account
                client.Credentials = new System.Net.NetworkCredential("ig0527156194@gmail.com", "vuwbftnjzayfkgyh");

                client.Send(newMail); // שליחת המייל
                return "ok";
            }
            catch (Exception ex)
            {
                return ex.StackTrace;
            }
        }

        // הפונקציה מקבלת מחרוזת ומחזירה טוקן ארוך של מחרוזת מוצפנת באופן אסימטרי
        // משמשת אותנו בעיקר עבור הצפנת סיסמת המשתמש בבסיס הנתונים
        // כך שאם יפרצו לבסיס הנתונים, לא יוכלו לדעת מה הסיסמה
        public static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256  
            using (SHA256 sha256Hash = SHA256.Create())

            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string  
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
        public static void DisplayInExcel<T>(List<T> list)
        {
            var excelApp = new NsExcel.Application();
            // Make the object visible.
            excelApp.Visible = true;

            // Create a new, empty workbook and add it to the collection returned
            // by property Workbooks. The new workbook becomes the active workbook.
            // Add has an optional parameter for specifying a particular template.
            // Because no argument is sent in this example, Add creates a new workbook.
            excelApp.Workbooks.Add();

            // This example uses a single workSheet. The explicit type casting is
            // removed in a later procedure.
            NsExcel._Worksheet workSheet = (NsExcel.Worksheet)excelApp.ActiveSheet;
            var col = 1;
            foreach (var c in list[0].GetType().GetProperties())
            {
                workSheet.Cells[1, col] = c.Name;
                col++;
            }
            var row = 2;

            foreach (var acct in list)
            {
                col = 1;
                foreach (var c in acct.GetType().GetProperties())
                {
                    workSheet.Cells[row, col] = c.GetValue(acct);
                    col++;
                }
                //if (portionCategoryes.getCategoryById(acct.parentCatId) != null)
                //{
                //    workSheet.Cells[row, col] = portionCategoryes.getCategoryById(acct.parentCatId).catName;
                //}

                row++;
                //workSheet.Cells[row, "A"] = acct.Cid;
                //workSheet.Cells[row, "B"] = acct.catName;
                //workSheet.Cells[row, "c"] = acct.parentCatId;
            }
            //workSheet.Rows[1,1].Font.Bold = true; /*Rows[1].Font.Bold = true;*/
            ////workSheet.Rows.Font.Background.Color = ExcelKnownColors.Sky_blue;
            //workSheet.Rows.Font.Size = 14;
            ////workSheet.Rows.HorizontalAlignment=ExcelHorizontalAlignment.RightMiddle;

            workSheet.Columns.AutoFit();
            ////workSheet.Columns[2].AutoFit();
            ////workSheet.Columns[3].AutoFit();
            ////workSheet.Columns[3].AutoFit();

        }

        //public static string getHtmlFromUrl(string url)
        //{
        //    var client = new RestClient();
        //    var res = client.Get(new RestRequest(url));
        //    return res.Content;
        //}
    }


}
