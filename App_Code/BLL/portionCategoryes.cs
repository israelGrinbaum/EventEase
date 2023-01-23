using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class portionCategoryes
    {
        public int Cid { get; set; }
        public string catName { get; set; }
        public int parentCatId { get; set; }
        public static List<portionCategoryes> getAllCategoryes()
        {
            return portionCategoryesDAL.getAllCategoryes();
        }
        public static portionCategoryes getCategoryById(int id)
        {
            return portionCategoryesDAL.getCategoryById(id);
        }
        public void addUpdateCategory()
        {
            portionCategoryesDAL.addUpdateCategory(this);
        }
        public static void removeCategoryById(int id)
        {
            portionCategoryesDAL.removeCategoryById(id);
        }

    }
}