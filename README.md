# SCORE Assessment Forms

The SCORE Assessment application consists of a backend written in Rails and the UI written using ReactJS.

### Instructions to setup the development environment for the Rails App (backend).

The Rails app supports docker containerizing. You can just bring the service and database up and running by executing the command `docker-compose up` inside the rails app directory.

1. Clone this repository.
2. Run the command `docker-compose up` to start the services cotainers.
3. Connect to the rails app container using the command `docker exec -it <container_id> bash`.
4. Now inside the rails app container, run the command `rake db:drop:all db:create:all db:migrate` to initialise and migrate the database.
5. The rails console can be opened by simply running `rails console` inside the rails app controller.


### Instructions to setup the development environment for the ReactJS app (UI).
1. Clone the UI repository.
2. To install node modules and dependencies run `npm install`.
3. To run the development server, run `npm start`.
4. To create the build directory and static files for deployment, run `npm run build`.
5. To deploy the current UI to the AWS S3, run `npm run deploy`.