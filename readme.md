<h1>
    Installation of Node Packages: 
</h1>
<h5>run "npm install"</h5>

<h1>
    Start The Server: 
</h1>
<h5>run "node index.js"</h5> <h4>Or</h4> <h5>run "npm run dev"</h5>

<h2>All the Application Logs are generated in "infoimage.log" file</h2>
<h2>All the configurations are in "appConfig.js" file</h2>

<h1>For Getting data from database with querry</h1>
<h3>Post Request:</h3>
http://localhost:5000/api/v1/dbdata/

<h3>with payload:</h3>

{
"db_credentials":{
"host":"localhost",
"username":"root",
"password":"",
"database_name":"pptm"
},
"querry":"select \* from clients"

}

<h3>Get the Response:</h3>

{
data: [],
status: "successful"/"unsuccessful"
message:""
}

<h1>CLEAN UP API<h1>
<h3>Delete Request:</h3>
http://localhost:5000/api/v1/cleanup/

<h3>No Payload</h3>

<h3>Get the Response</h3>
{
    "query_status": [
        "successful",
        "successful",
        "successful",
        "successful",
        "successful",
        "successful",
        "successful",
        "successful"
    ]
}

<h1>REPORT API<h1>
<h3>Post Request:</h3>
http://localhost:5000/api/v1/report/

<h3>with payload:</h3>

{
"from_date":"1-1-2010",
"to_date":"1-1-2020"
}

<h3>Get the Response</h3>
{
"status": 200 or 204
}
