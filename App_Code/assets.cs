using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;

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
        public static string SendEmail(string to,string subject,string body)
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
                newMail.Body = "<h1> " +body+" </h1><style>body{font-size:40px;}<style><div ></div>";

                // enable SSL for encryption across channels
                client.EnableSsl = true;
                // Port 465 for SSL communication
                client.Port = 587;
                // Provide authentication information with Gmail SMTP server to authenticate your sender account
                client.Credentials = new System.Net.NetworkCredential("ig0527156194@gmail.com", "");

                client.Send(newMail); // שליחת המייל
                return "ok";
            }
            catch (Exception ex)
            {
                return ex.StackTrace;
            }
        }
        
        // הפוקציה מקבלת מחרוזת ומחזירה טוקן ארוך של מחרוזת מוצפנת באופן אסימטרי
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


    }


}
