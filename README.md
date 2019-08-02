# Web Client Code Pipeline Demo 

## Description
CICD and Deployment CloudFormation template for a static web client

## Dependencies
* [aws account](https://aws.amazon.com/)
* [aws-cli](https://aws.amazon.com/cli/)

## Available Scripts

In the project directory, you can run:

`npm start`

Runs the app in the development mode.<br>
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

`npm test`

`npm run build`

`STAGE='dev' GH_WEB_CLIENT_TOKEN='superfaketokenfrommybash' npm run provision`

`STAGE='dev' S3_BUCKETNAME='some-bucket-name' DISTRIBUTION='1234' npm run deploy`

