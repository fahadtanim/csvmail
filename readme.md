#For Getting data from database with querry
Post Request:
http://localhost:5000/api/v1/dbdata/

with payload:

{
"db_credentials":{
"host":"localhost",
"username":"root",
"password":"",
"database_name":"pptm"
},
"querry":"select \* from clients"

}

get the response:

{
data: [],
status: "successful"/"unsuccessful"
message:""
}

#For Getting data from database with querry and mailing to some email addresses after creating a CSV with the data
Post Request:
http://localhost:5000/api/v1/dbdata/

with payload:

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
"mail_body":"<h1>Hello</h1>"
}

}

{
"status": "successful"/"unsuccessful",
"message": ""
}
