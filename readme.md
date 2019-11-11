<h1>For Getting data from database with querry</h1>
<h5>Post Request:</h5>
http://localhost:5000/api/v1/dbdata/

<h5>with payload:</h5>

{
"db_credentials":{
"host":"localhost",
"username":"root",
"password":"",
"database_name":"pptm"
},
"querry":"select \* from clients"

}

<h5>Get the Response:</h5>

{
data: [],
status: "successful"/"unsuccessful"
message:""
}

<h1>For Getting data from database with querry and mailing to some email addresses after creating a CSV with the data<h1>
<h5>Post Request:</h5>
http://localhost:5000/api/v1/dbdata/

<h5>with payload:</h5>

{
"db_credentials":{
"host":"localhost",
"username":"root",
"password":"",
"database_name":"pptm"
},
"querry":"select \* from clients",
"mail_details":{
"mail_server":"smtp.ethereal.email",
"port":"587",
"secure": false,
"authentication":{
"email":"rosetta.daugherty@ethereal.email",
"password":"BMN2CQkSsBge7SjQ4R"
},
"mail_to":"fahad.khan@gmail.com,fahadtanim@gmail.com",
"mail_subject":"Ajaira mail",
"mail_body":"Hello"
}

}

<h5>Get the Response</h5>
{
"status": "successful"/"unsuccessful",
"message": ""
}
