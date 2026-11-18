<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        Application["visits"] = 0;
        Application["online"] = 0;
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        Session["uName"] = "אורח";
        Session["userFName"] = "אורח";
        Session["admin"] = "no";

        Application.Lock();

        int visits = (int)Application["visits"];
        Application["visits"] = visits + 1;

        int online = (int)Application["online"];
        Application["online"] = online + 1;

        Application.UnLock();
    }
    void Session_End(object sender, EventArgs e)
    {
        Application.Lock();

        int online = (int)Application["online"];
        Application["online"] = online - 1;

        Application.UnLock();
    }

</script>
