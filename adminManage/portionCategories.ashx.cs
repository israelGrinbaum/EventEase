using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using CsvHelper;
using System.Globalization;
using System.IO;
using CsvHelper.TypeConversion;
using System.Web.UI;
using static System.Net.Mime.MediaTypeNames;
using System.Collections;
using System.Drawing;
using System.Web.UI.WebControls;
using Syncfusion.XlsIO;
using NsExcel = Microsoft.Office.Interop.Excel;
using System.Security.Principal;
using System.Reflection;
using eventsHall.App_Code;

namespace eventsHall.adminManage
{
    /// <summary>
    /// Summary description for portionCategories
    /// </summary>
    public class portionCategories : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string query = context.Request["sr"] + "";
            List<portionCategoryes> lstPC = portionCategoryes.getAllCategoryes(query);
            DisplayInExcel<portionCategoryes>(lstPC);
            //context.Response.ContentType = "application/msexcel";//application/msexcel
            //context.Response.Write(DisplayInExcel(lstPC));
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
            workSheet.Rows[1].Font.Bold = true;
            ////workSheet.Rows.Font.Background.Color = ExcelKnownColors.Sky_blue;
            //workSheet.Rows.Font.Size = 14;
            ////workSheet.Rows.HorizontalAlignment=ExcelHorizontalAlignment.RightMiddle;

            workSheet.Columns.AutoFit();
            ////workSheet.Columns[2].AutoFit();
            ////workSheet.Columns[3].AutoFit();
            ////workSheet.Columns[3].AutoFit();

        }

        public void ListToExcel(List<string> list)
        {
            //start excel
            NsExcel.Application excapp = new Microsoft.Office.Interop.Excel.Application();

            //if you want to make excel visible           
            excapp.Visible = true;

            //create a blank workbook
            var workbook = excapp.Workbooks.Add(NsExcel.XlWBATemplate.xlWBATWorksheet);

            ////or open one - this is no pleasant, but yue're probably interested in the first parameter
            //string workbookPath = "C:\test.xls";
            //var workbook = excapp.Workbooks.Open(workbookPath,
            //    0, false, 5, "", "", false, Excel.XlPlatform.xlWindows, "",
            //    true, false, 0, true, false, false);

            //Not done yet. You have to work on a specific sheet - note the cast
            //You may not have any sheets at all. Then you have to add one with NsExcel.Worksheet.Add()
            var sheet = (NsExcel.Worksheet)workbook.Sheets[1]; //indexing starts from 1

            //do something usefull: you select now an individual cell
            var range = sheet.get_Range("A1", "A1");
            range.Value2 = "test"; //Value2 is not a typo

            //now the list
            string cellName;
            int counter = 1;
            foreach (var item in list)
            {
                cellName = "A" + counter.ToString();
                var range1 = sheet.get_Range(cellName, cellName);
                range1.Value2 = item.ToString();
                ++counter;
            }

            //you've probably got the point by now, so a detailed explanation about workbook.SaveAs and workbook.Close is not necessary
            //important: if you did not make excel visible terminating your application will terminate excel as well - I tested it
            //but if you did it - to be honest - I don't know how to close the main excel window - maybee somewhere around excapp.Windows or excapp.ActiveWindow
        }

        public void excel()
        {
            //using (ExcelEngine excelEngine = new ExcelEngine())
            //{
            //    IApplication application = excelEngine.Excel;
            //    application.DefaultVersion = ExcelVersion.Excel2016;

            //    //Read the data from XML file
            //    StreamReader reader = new StreamReader(Path.GetFullPath(@"../../Data/Customers.xml"));

            //    //Assign the data to the customerObjects collection
            //    IEnumerable customerObjects = GetData(reader.ReadToEnd());

            //    //Create a new workbook
            //    IWorkbook workbook = application.Workbooks.Create(1);
            //    IWorksheet sheet = workbook.Worksheets[0];

            //    //Import data from customerObjects collection
            //    sheet.ImportData(customerObjects, 5, 1, false);

            //    #region Define Styles
            //    IStyle pageHeader = workbook.Styles.Add("PageHeaderStyle");
            //    IStyle tableHeader = workbook.Styles.Add("TableHeaderStyle");

            //    pageHeader.Font.RGBColor = Color.FromArgb(0, 83, 141, 213);
            //    pageHeader.Font.FontName = "Calibri";
            //    pageHeader.Font.Size = 18;
            //    pageHeader.Font.Bold = true;
            //    pageHeader.HorizontalAlignment = ExcelHAlign.HAlignCenter;
            //    pageHeader.VerticalAlignment = ExcelVAlign.VAlignCenter;

            //    tableHeader.Font.Color = ExcelKnownColors.White;
            //    tableHeader.Font.Bold = true;
            //    tableHeader.Font.Size = 11;
            //    tableHeader.Font.FontName = "Calibri";
            //    tableHeader.HorizontalAlignment = ExcelHAlign.HAlignCenter;
            //    tableHeader.VerticalAlignment = ExcelVAlign.VAlignCenter;
            //    tableHeader.Color = Color.FromArgb(0, 118, 147, 60);
            //    tableHeader.Borders[ExcelBordersIndex.EdgeLeft].LineStyle = ExcelLineStyle.Thin;
            //    tableHeader.Borders[ExcelBordersIndex.EdgeRight].LineStyle = ExcelLineStyle.Thin;
            //    tableHeader.Borders[ExcelBordersIndex.EdgeTop].LineStyle = ExcelLineStyle.Thin;
            //    tableHeader.Borders[ExcelBordersIndex.EdgeBottom].LineStyle = ExcelLineStyle.Thin;
            //    #endregion

            //    #region Apply Styles
            //    //Apply style to the header
            //    sheet["A1"].Text = "Yearly Sales Report";
            //    sheet["A1"].CellStyle = pageHeader;

            //    sheet["A2"].Text = "Namewise Sales Comparison Report";
            //    sheet["A2"].CellStyle = pageHeader;
            //    sheet["A2"].CellStyle.Font.Bold = false;
            //    sheet["A2"].CellStyle.Font.Size = 16;

            //    sheet["A1:D1"].Merge();
            //    sheet["A2:D2"].Merge();
            //    sheet["A3:A4"].Merge();
            //    sheet["D3:D4"].Merge();
            //    sheet["B3:C3"].Merge();

            //    sheet["B3"].Text = "Sales";
            //    sheet["A3"].Text = "Sales Person";
            //    sheet["B4"].Text = "January - June";
            //    sheet["C4"].Text = "July - December";
            //    sheet["D3"].Text = "Change(%)";
            //    sheet["A3:D4"].CellStyle = tableHeader;
            //    #endregion

            //    sheet.UsedRange.AutofitColumns();

            //    //Save the file in the given path
            //    Stream excelStream = File.Create(Path.GetFullPath(@"Output.xlsx"));
            //    workbook.SaveAs(excelStream);
            //    excelStream.Dispose();
            //}

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader(
                "content-disposition", string.Format("attachment; filename={0}", "fileName"));
            HttpContext.Current.Response.ContentType = "application/msexcel";

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    // The GridView stuff.
                    // [...]

                    //  render the htmlwriter into the response
                    HttpContext.Current.Response.Write(sw.ToString());
                    HttpContext.Current.Response.End();
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}