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
    public partial class PrescriptionPatientView : System.Web.UI.Page
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
                    getPrescriptionData();
                    DropDownList1.Visible = false;
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnfindpresid_Click(object sender, EventArgs e)
        {
            getPrescriptionByID();
        }
        //DATABASE FIND PRESCRIPTION INFO
        void getPrescriptionByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from prescription where prescriptionid='" + txtpresid.Text.Trim() + "' AND userid='" + Session["username"].ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtdoctorname.Text = dr.GetValue(2).ToString();
                        txtdoctoraddress.Text = dr.GetValue(3).ToString();
                        txtcontactno.Text = dr.GetValue(4).ToString();
                        txtdate.Text = dr.GetValue(5).ToString();
                        txtrx.Text = dr.GetValue(6).ToString();
                        txtrxmgtabs.Text = dr.GetValue(7).ToString();
                        txtsigntabs.Text = dr.GetValue(8).ToString();
                        txtsignhrs.Text = dr.GetValue(9).ToString();
                        txtditabs.Text = dr.GetValue(10).ToString();
                        txtrefill.Text = dr.GetValue(11).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('No Prescription ID Found!');</script>");
                    clearForm();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearForm()
        {
            txtdoctorname.Text = "";
            txtdoctoraddress.Text = "";
            txtcontactno.Text = "";
            txtdate.Text = "";
            txtrx.Text = "";
            txtrxmgtabs.Text = "";
            txtsigntabs.Text = "";
            txtsignhrs.Text = "";
            txtditabs.Text = "";
            txtrefill.Text = "";
            citylist.SelectedIndex = 0;
        }

        //DATABASE FIND HISTORY OF PRESCRIPTION
        void getPrescriptionData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT prescriptionid AS [Prescription ID], dateofpres AS [Prescription Date], doctorname AS [Doctor Name] from prescription where userid='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        //Send Prescription into Pharmacy
        protected void btnsend_Click(object sender, EventArgs e)
        {
                //INSERT PRESCRIPTION into Pharmacy
                if (citylist.SelectedItem.Text != "Select" && txtpresid.Text != "")
                {
                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("INSERT INTO town (fullname,prescriptionid,doctorname,address,contact,dateofpres,rxname,rxmgtabs,signtabs,signhrs,di,refill,town,confirmation,storename) values(@fullname,@prescriptionid,@doctorname,@address,@contact,@dateofpres,@rxname,@rxmgtabs,@signtabs,@signhrs,@di,@refill,@town,'no',@storename)", con);
                        cmd.Parameters.AddWithValue("@fullname", Session["fullname"].ToString());
                        cmd.Parameters.AddWithValue("@prescriptionid", txtpresid.Text.Trim());
                        cmd.Parameters.AddWithValue("@doctorname", txtdoctorname.Text.Trim());
                        cmd.Parameters.AddWithValue("@address", txtdoctoraddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@contact", txtcontactno.Text.Trim());
                        cmd.Parameters.AddWithValue("@dateofpres", txtdate.Text.Trim());
                        cmd.Parameters.AddWithValue("@rxname", txtrx.Text.Trim());
                        cmd.Parameters.AddWithValue("@rxmgtabs", txtrxmgtabs.Text.Trim());
                        cmd.Parameters.AddWithValue("@signtabs", txtsigntabs.Text.Trim());
                        cmd.Parameters.AddWithValue("@signhrs", txtsignhrs.Text.Trim());
                        cmd.Parameters.AddWithValue("@di", txtditabs.Text.Trim());
                        cmd.Parameters.AddWithValue("@refill", txtrefill.Text.Trim());
                        cmd.Parameters.AddWithValue("@town", citylist.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@storename", DropDownList1.SelectedItem.Value);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Submit Successful (Go to View Pharmacy Store)');</script>");
                        clearForm();
                        txtpresid.Text = "";
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
            else
            {
                Response.Write("<script>alert('Please Fill-Up All');</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (citylist.SelectedIndex == 0)
            {
                DropDownList1.Visible = false;
            }
            else
            {
                DropDownList1.Visible = true;
                getpharmacylist();
            }
            
        }
        void getpharmacylist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT storename from pharmacy where town='" + citylist.SelectedItem.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}