using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;

namespace newtest
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString() != "admin")
                {
                    Response.Redirect("AdminLogin.aspx");
                }
                else
                {
                    getnormaluserdata();
                    getgenderdata();
                    gettotalpatientmembers();
                    gettotaldoctormembers();
                    gettotalpharmacymembers();
                    getagedata();
                    gettowndata();
                    getnormalusertowndata();
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("AdminLogin.aspx");
            }
        }
        void getgenderdata()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT gender,count(gender) FROM normal Group by gender"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;

                        DataSet ds = new DataSet();
                        sda.Fill(ds);

                        DataTable ChartData = ds.Tables[0];

                        //storing total rows count to loop on each Record                          
                        string[] XPoints = new string[ChartData.Rows.Count];

                        int[] YPOints = new int[ChartData.Rows.Count];

                        for (int count = 0; count < ChartData.Rows.Count; count++)
                        {
                            // store values for X axis  
                            XPoints[count] = ChartData.Rows[count]["gender"].ToString();
                            //store values for Y Axis  
                            YPOints[count] = Convert.ToInt32(ChartData.Rows[count][1]);

                        }
                        //binding chart control  
                        Chart1.Series[0].Points.DataBindXY(XPoints, YPOints);

                        //Setting width of line  
                        Chart1.Series[0].BorderWidth = 5;
                        //setting Chart type   
                        Chart1.Series[0].ChartType = SeriesChartType.Pie;

                        //enable to show legend
                        Chart1.Legends[0].Enabled = true;

                        //show pie chart in 3d
                        Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

                    }
                }
            }
        }
        void getnormaluserdata()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select gender as Gender, count(gender) as Total, ROUND( cast(count(gender) * 100.0 / sum(count(gender)) over() as float),2) as Percentage from normal Group by gender", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewNormalUser.DataSource = dt;
                GridViewNormalUser.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void gettotalpatientmembers()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select count(userid) as [Patient User] from normal", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewtotalmember.DataSource = dt;
                GridViewtotalmember.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void gettotaldoctormembers()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select count(userid) as [Doctor User] from doctor", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewdoctor.DataSource = dt;
                GridViewdoctor.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void gettotalpharmacymembers()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select count(userid) as [Pharmacy Store User] from pharmacy", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewpharmacy.DataSource = dt;
                GridViewpharmacy.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void getagedata()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT age,count(age) FROM normal Group by age"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;

                        DataSet ds = new DataSet();
                        sda.Fill(ds);

                        DataTable ChartData = ds.Tables[0];

                        //storing total rows count to loop on each Record                          
                        string[] XPoints = new string[ChartData.Rows.Count];

                        int[] YPOints = new int[ChartData.Rows.Count];

                        for (int count = 0; count < ChartData.Rows.Count; count++)
                        {
                            // store values for X axis  
                            XPoints[count] = ChartData.Rows[count]["age"].ToString();
                            //store values for Y Axis  
                            YPOints[count] = Convert.ToInt32(ChartData.Rows[count][1]);

                        }
                        //binding chart control  
                        Chart2.Series[0].Points.DataBindXY(XPoints, YPOints);

                        //Setting width of line  
                        Chart2.Series[0].BorderWidth = 5;
                        //setting Chart type   
                        Chart2.Series[0].ChartType = SeriesChartType.StackedColumn;

                        //enable to show legend
                        Chart2.Legends[0].Enabled = true;
                        Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = true;
                    }
                }
            }
        }
        void gettowndata()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT town,count(town) FROM normal Group by town"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;

                        DataSet ds = new DataSet();
                        sda.Fill(ds);

                        DataTable ChartData = ds.Tables[0];

                        //storing total rows count to loop on each Record                          
                        string[] XPoints = new string[ChartData.Rows.Count];

                        int[] YPOints = new int[ChartData.Rows.Count];

                        for (int count = 0; count < ChartData.Rows.Count; count++)
                        {
                            // store values for X axis  
                            XPoints[count] = ChartData.Rows[count]["town"].ToString();
                            //store values for Y Axis  
                            YPOints[count] = Convert.ToInt32(ChartData.Rows[count][1]);

                        }
                        //binding chart control  
                        Chart3.Series[0].Points.DataBindXY(XPoints, YPOints);

                        //Setting width of line  
                        Chart3.Series[0].BorderWidth = 5;
                        //setting Chart type   
                        Chart3.Series[0].ChartType = SeriesChartType.Doughnut;
                        Chart3.ChartAreas["ChartArea3"].Area3DStyle.Enable3D = true;
                    }
                }
            }
        }
        void getnormalusertowndata()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select town as Town, count(town) as Total, ROUND( cast(count(town) * 100.0 / sum(count(town)) over() as float),2) as Percentage from normal Group by town", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewTown.DataSource = dt;
                GridViewTown.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}