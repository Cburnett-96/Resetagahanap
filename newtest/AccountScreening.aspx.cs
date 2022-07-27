using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace newtest
{
    public partial class AccountScreening : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;
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
                    if (!IsPostBack)
                    {
                        ShowData();
                        ShowData2();
                    }
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("AdminLogin.aspx");
            }
        }
        //ShowData method for Displaying Data in Gridview  
        protected void ShowData()
        {
            dt = new DataTable();
            con = new SqlConnection(strcon);
            con.Open();
            adapt = new SqlDataAdapter("select * from doctor where legit='no'", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();
        }
        protected void ShowData2()
        {
            dt = new DataTable();
            con = new SqlConnection(strcon);
            con.Open();
            adapt = new SqlDataAdapter("select * from pharmacy where legit='no'", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            con.Close();
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }
        protected void GridView2_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView2.EditIndex = e.NewEditIndex;
            ShowData2();
        }
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            DropDownList activated = GridView1.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList;
            
            con = new SqlConnection(strcon);
            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update doctor set legit='"+ activated.SelectedValue.ToString() +"' where userid= '"+ id.Text +"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData();
        }
        protected void GridView2_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView2.Rows[e.RowIndex].FindControl("lbl_PID") as Label;
            DropDownList activated = GridView2.Rows[e.RowIndex].FindControl("DropDownList2") as DropDownList;
            TextBox url = GridView2.Rows[e.RowIndex].FindControl("txt_Url") as TextBox;

            con = new SqlConnection(strcon);
            con.Open();
            if (url.Text != "")
            {
                //updating the record  
                SqlCommand cmd = new SqlCommand("Update pharmacy set legit='" + activated.SelectedValue.ToString() + "', url='" + url.Text + "' where userid= '" + id.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
                GridView2.EditIndex = -1;
                //Call ShowData method for displaying updated data  
                ShowData2();
            }
            else
            {
                Response.Write("<script>alert('Input url');</script>");
            }
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }
        protected void GridView2_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView2.EditIndex = -1;
            ShowData2();
        }
    }
}