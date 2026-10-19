<%@ Application Language="C#" %>

<script runat="server">

void Application_Start(object sender, EventArgs e)
{
    // רץ פעם אחת, כשהאתר עולה לאוויר
}

void Session_Start(object sender, EventArgs e)
{
    // רץ פעם אחת, כשגולש חדש נכנס לאתר
    Session["user"] = "אורח";
}

void Session_End(object sender, EventArgs e)
{
    // רץ כשה-Session מסתיים, למשל אחרי 20 דקות של חוסר פעילות
}

</script>
