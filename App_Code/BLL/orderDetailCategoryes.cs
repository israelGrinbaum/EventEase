using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class orderDetailCategoryes
    {
        public int Cid { get; set; }
        public string catName { get; set; }
        public int parentCatId { get; set; }
/*        public static List<orderDetailCategoryes> getAllCategoryes()
        {
            return orderDetailCategoryesDAL.getAllCategoryes();
        }
        public static orderDetailCategoryes getCategoryById(int id)
        {
            return orderDetailCategoryesDAL.getCategoryById(id);
        }
        public void addUpdateCategory()
        {
            orderDetailCategoryesDAL.addUpdateCategory();
        }
        public static int removeCategoryById(int id)
        {
            return orderDetailCategoryesDAL.removeCategoryById(id);
        }
*/
    }
}