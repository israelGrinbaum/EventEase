using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DAL
{
    public class dbContext
    {
        public string connstr { get; set; }
        public SqlConnection conn { get; set; }
        public SqlCommand cmd { get; set; }
        public dbContext()
        {
            connstr = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
        }
        public DataTable execute(string sql)
        {
            cmd=new SqlCommand(sql, conn);
            DataTable Dt = new DataTable();
            SqlDataAdapter da=new SqlDataAdapter(cmd);
            da.Fill(Dt);
            return Dt;
        }
        public int executeNonQuery(string sql)
        {
            cmd =new SqlCommand(sql, conn);
            return cmd.ExecuteNonQuery();
        }
        public object executeScalar(string sql)
        {
            cmd = new SqlCommand(sql, conn);
            return cmd.ExecuteScalar();
        }
        public void close()
        {
            conn.Close();
        }
    }
}