---
layout: site
title: Connecting
body_class: connecting
---

This article explains how to connect to various third party tools you might use to query Advanced MIS.

### Before you can connect

Before you can connect to your Advanced MIS data warehouse, you will need to supply Talis with information about which users should be allowed access.  Talis will need the following information:

* User's name
* User's email address
* External IP Address or IP Address range (described below)

#### IP Addresses

We need an __externally visible__ IP Address or a range of IP Addresses for each user. We will use this information to add the user's IP Address to a firewall which restricts access to the Advanced MIS Data Warehouse to only those who should have access and reduces the chance of security issues.

User workstations will need to either have a statically assigned IP Address, or be part of a known subnet range which is ideally __not__ a range that covers every IP Address in the whole uni.

If you are working from home, we will still need an IP Address, but it must be a university IP Address assigned by your Virtual Private Network (VPN) which your IT department will be able to help you with. We will not allow access to residential IP addresses as these can change frequently and at the whim of the Internet Service Provider and are not controlled by the University.

Typically University IT departments will need to do one or more of the following:

* Allow traffic to leave the university on port 5439 to the database connection (Talis can advise you what this is) 
* Use DHCP to statically lease an IP address to a known workstation (usually using the MAC address of the network interface). If the device is a laptop and may have both wired and wireless network cards, then multiple statically leased IP addresses may be required.
* Lease a known range of IP Addresses to a range of workstations. For example, this might be "all library staff PCs" or "all PCs sited in the administration office" It is up to University network teams to determine what is the most sensible way to achieve this.
* Use a Virtual Private Network (VPN) to allow a connection from your laptop at home to be connected to the university network. These often have different IP addresses in this situation.

__IMPORTANT__ the IP address must be an IP Address that will been seen by Talis in the outbound connection from the University network to the Talis Aspire Advanced MIS data warehouse. Internally assigned private network IP addresses will not suffice. For example, these ranges (shown as CIDR block with subnet mask) are not suitable: `10.0.0.0/8 (255.0.0.0)` or `172.16.0.0/12 (255.240.0.0)` or `192.168.0.0/16 (255.255.0.0)`.

### Basic connections

You will need four bits of information in all cases, these will be supplied to you by Talis when Advanced MIS is activated:

1. Server domain name
2. Database name
3. User name
4. Password

Third party tools with specific instructions on this page are:

__SQL Tools__

* [TablePlus](#tableplus)
* [ODBC](#odbc)
* [SQLWorkbenchJ](#sqlworkbenchj)

__Business Intelligence Tools__

* [Tableau](#tableau)
* [Power BI](#power-bi)

Once you have connected, take a look at our [recipes]({{ site.baseurl }}/topics/recipes.html) and copy-paste some of the examples to start exploring. 

### TablePlus

For Mac OSX and Windows, this simple tool is really handy for exploring the data available in the tables, and writing and testing SQL queries.
Connection is straight forward, simply select 'redshift' as the connection type and fill in the requested fields. The docs on their website are very clearly written, and you should have no trouble getting started. 

[https://tableplus.com/](https://tableplus.com/)

### ODBC

ODBC is a generic database driver framework which can be a handy way to connect to many different types of database.

* __Windows__: To make an ODBC connection available on your Windows machine, [follow these instructions for Windows Amazon Redshift ODBC installation and configuration](https://docs.aws.amazon.com/redshift/latest/mgmt/odbc20-install-config-win.html).
* __Mac OSX__: To make an ODBC connection available on your MAC, [follow these instruction for Mac Amazon Redshift ODBC installation and configuration](https://docs.aws.amazon.com/redshift/latest/mgmt/odbc20-install-config-mac.html)
* __Linux__:   To make an ODBC connection available on your Linux machine, [follow these instructions for Linux Amazon Redshift ODBC installation and configuration](https://docs.aws.amazon.com/redshift/latest/mgmt/odbc20-install-config-linux.html)

You will then be able to use your username and password to connect from any ODBC compatible client.

### SQLWorkbenchJ

The process for connecting to SQLWorkbenchJ will be similar for many other SQL clients, so the instructions here can be followed for those too.

1. First, follow [the instructions here](https://docs.aws.amazon.com/redshift/latest/mgmt/connecting-using-workbench.html) for adding the Amazon Redshift driver to your installation of SQLWorkbenchJ
2. Launch SQLWorkbenchJ and choose **File > Connection Window** from the menu. You should see the dialog below:

![SQLWorkbenchJ Connection Screenshot]({{ site.baseurl }}/images/topics/connecting/sqlworkbenchj-connect.jpg)

3. In the driver drop down, select `Amazon Redshift (com.amazon.redshift.jdbc.Driver)`
4. In the URL field, add the server domain, followed by `/` and then your database name
5. Add the username and password in the correct fields
6. **Important**: Make Sure 'Autocommit' is ticked.
7. Click OK

In the next screen, you should see the workspace window. Choose **Tools > Show Database Explorer** to have a look around.

![SQLWorkbenchJ Connection Screenshot]({{ site.baseurl }}/images/topics/connecting/sqlworkbenchj-connected.jpg)

### Tableau

1. Choose "Connect to a server/Amazon Redshift"

![Tableau Connections Screenshot]({{ site.baseurl }}/images/topics/connecting/tableau-connect.jpg)


2. In the "Server" field enter the domain name
3. In the "Database" field enter your database name
4. In the "User" field enter your username
5. In the "Password" field enter your password

In the next screen, make sure you are in the public schema. You should see a list of fact tables on the right (prefixed f_). From here you can create the data source for the workbook.

![Tableau Connected Screenshot]({{ site.baseurl }}/images/topics/connecting/tableau-connected.jpg)

### Power BI

Connecting to Power BI involves 2 components; the desktop client and the Power BI online web based service.

In both cases, the connection details that Talis Supply will be required.

#### Power BI Desktop App

Power BI Desktop allows you to create a new data connection to Redshift Services.
Simply enter user names, passwords and host when requested.

The domain to use in the connection string _must_ be the SSL version of the domain. We are not currently able to add our own certificate to the Redshift connection.

You will have the option to create a connection as a Direct Query or Import connection type.

* Import — Use this option if you plan to publish dataset to the Power Bi Online Service. This is the default and Microsoft recommended way to connect in Power BI as it uses the underlying Power BI data engine.
* Direct Query — Use this option if you want to get live data on the desktop client only, or if you have an on premise Power BI gateway setup (see below). [Read more about Direct Query](https://docs.microsoft.com/en-us/power-bi/desktop-use-directquery).

##### Native Power BI
Microsoft details [how to connect to a Redshift source](https://docs.microsoft.com/en-us/power-bi/desktop-connect-redshift). This info uses the default Power BI Redshift connector and does NOT support customer queries.

##### Using ODBC Driver
You can also use an ODBC connection if you want to be able to run arbitrary SQL queries against your Advanced MIS database.
To make an ODBC connection available on your Windows machine, [follow these instructions](https://docs.aws.amazon.com/redshift/latest/mgmt/odbc20-install-config-win.html).
You will then be able to select ODBC as the data source in Power BI.  In the Advanced options you can enter the SQL query that you wish to run. 

These kind of connections will always be 'import' queries and data will need to be refreshed using the Power BI Desktop client.

#### Power BI Service

We are unable to open database access to Power BI Service as there are no specific Azure servers that are hosting the service, and we'd have to open ports for every Azure server across the globe.

If you plan to publish reports using the Power BI service, please either: 

* Use the Import connection type.
* Setup a local [on premise Power BI gateway](https://docs.microsoft.com/en-us/power-bi/service-gateway-onprem) to proxy the redshift connection. You can tell us what the IP of your on premise gateway is and we will allow connections from that IP address.  This has been supported in Power BI gateway since the [May 2019 release of the gateway](https://powerbi.microsoft.com/en-us/blog/on-premises-data-gateway-may-2019-update-is-now-available/). 


