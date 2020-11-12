theoretical riskareas

To start the project:
1. Have Docker installed.
2. Goto the mariadb folder and execute "docker-compose up" in a powershell.
3. In your browser you can now open up phpmyadmin on "localhost:8000".
4. Create a database called "covid". (In a future release this will be implemented on default)
5. Import the file "covid_only_init.sql" to fill in all the needed data for this project.
6. You can now start the real api-server. Goto the folder "tr_server". Execute "node app.js" in a powershell to start the server.
7. The server will pull new date-data every 30 seconds.
