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
    public partial class DrugStoreList : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || Session["role"] == null || Session["role"].ToString() != "user")
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    getPrescriptionByID();
                    getPrescriptionPending();
                    drugstorelist();
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("Default.aspx");
            }
        }
        protected void citylist_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (txtpresid.Text == "")
            {
                Response.Write("<script>alert('Please Input Prescription ID!');</script>");
                ohsnap.Visible = false;
            }
            else
            {
                drugstorelist();
            }
        }
        void drugstorelist()
        {
            if (citylist.SelectedIndex != 0)
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT * FROM town FULL OUTER JOIN pharmacy ON town.storename = pharmacy.storename WHERE town.confirmation='yes' and town.town='" + citylist.SelectedValue.ToString() + "' AND town.prescriptionid='" + txtpresid.Text.ToString() + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Repeater1.Visible = true;
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                        con.Close();
                        ohsnap.Visible = false;
                    }
                    else
                    {
                        ohsnap.Visible = true;
                        Repeater1.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Choose Town! and Fill Prescription ID input field!');</script>");
            }
        }
        //Pending Prescription
        void getPrescriptionPending()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT prescriptionid AS [Prescription ID], storename AS [Store Name], town AS [Town] from town where fullname='" + Session["fullname"].ToString() + "' AND confirmation='no';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void DeletePending()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from town WHERE prescriptionid='" + txtpresid.Text.Trim() + "' AND confirmation='no'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Remove');</script>");
                GridView2.DataBind();
                getPrescriptionPending();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            DeletePending();
        }
        //BUY NOW!
        void getPrescriptionByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from town where prescriptionid='" + txtpresid.Text.Trim() + "' AND town='" + citylist.SelectedItem.Text.Trim() + "' AND confirmation='Yes'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        rxname.Text = dr.GetValue(7).ToString();
                        rxmgtabs.Text = dr.GetValue(8).ToString() + " mg tablets";
                        signtabs.Text = dr.GetValue(9).ToString() + " tablet by mouth";
                        signhrs.Text = "every " + dr.GetValue(10).ToString() + " hours";
                        di.Text = dr.GetValue(11).ToString() + " tablets";
                        refill.Text = dr.GetValue(12).ToString() + " refill";
                    }
                }
                else
                {
                    clearForm();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void btnyes_Click(object sender, EventArgs e)
        {
            popupproduct();
            successfulbuyed();
            drugstorelist();
        }
        //POPUP MESSAGE
        void popupproduct()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from town where prescriptionid='" + txtpresid.Text.Trim() + "' AND town='" + citylist.SelectedItem.Text.Trim() + "' AND confirmation='Yes'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        string rxname1 = dr.GetValue(7).ToString();
                        string rxmgtabs1 = dr.GetValue(8).ToString() + " mg tablets";
                        string signtabs1 = dr.GetValue(9).ToString() + " tablet by mouth";
                        string signhrs1 = "every " + dr.GetValue(10).ToString() + " hours";
                        string di1 = dr.GetValue(11).ToString() + " tablets";
                        string refill1 = dr.GetValue(12).ToString() + " refill";
                        Response.Write("<script>alert('PLEASE GO TO THAT PHARMACY TO BUY THIS: " + rxname1 + " " + rxmgtabs1 + " " + signtabs1 + " " + signhrs1 + " " + di1 + " " + refill1 + "');</script>");
                        getPrescriptionByID();
                    }
                }
                else
                {
                    clearForm();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void successfulbuyed()
        {
            DateTime currentdate = DateTime.Now;
            string current = currentdate.Month.ToString();
            string success = "success";
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update town set confirmation=@confirmation, month=@month WHERE prescriptionid='" + txtpresid.Text.Trim() + "' AND town='" + citylist.SelectedItem.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@confirmation", success);
                cmd.Parameters.AddWithValue("@month", current);
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearForm()
        {
            rxname.Text = "";
            rxmgtabs.Text = "";
            signtabs.Text = "";
            signhrs.Text = "";
            di.Text = "";
            refill.Text = "";
        }
    }
}