# dotnetAPI1

* If running the project locally, we can call the exe on browser or POSTMAN with localhost:5000  
* Run the project in a container:  
** docker build -t dotnet-api:1.0 .  
** docker run -it --rm -p 8080:80 -d dotnet-api:1.0  
*** now on POSTMAN we will use localhost:8080
