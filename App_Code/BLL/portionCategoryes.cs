using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.ApplicationServices;

namespace BLL
{
    public class portionCategoryes: System.Web.HttpApplication
    {
        public int Cid { get; set; }
        public string catName { get; set; }
        public int parentCatId { get; set; }
        public string parentCatName { get; set; }
        public static List<portionCategoryes> getAllCategoryes(string query)
        {
            return portionCategoryesDAL.getAllCategoryes(query);
        }
        public static portionCategoryes getCategoryById(int id)
        {
            return portionCategoryesDAL.getCategoryById(id);
        }
        public void addUpdateCategory()
        {
            portionCategoryesDAL.addUpdateCategory(this);
            updateAplicationMemory();
        }
        public static void removeCategoryById(int id)
        {
            portionCategoryesDAL.removeCategoryById(id);
        }
        private void updateAplicationMemory()
        {
            List<portionCategoryes> lstPC = portionCategoryes.getAllCategoryes("");
        }
    }
}