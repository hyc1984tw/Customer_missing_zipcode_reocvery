# Customer Missing Residential Zipcode Recovery Project

**Background**: In the previous version of membership registration requirement, residential information of the member was not  mandatory data to be filled for membership applicaiton. Therefore, it was discovered a certain qantity of membership data lack of residential information. The residential information is usually filled by member's residential zipcode. Without residential information, it is difficult to analyze member's shopping behaviour with respect to regions.

Two solutions are made to recover missing zipcode information, which are:
* EC Customer Delivery Information
* Customer zipcode prediction via Machine Learning Model

## 1- EC customer delivery information
Some of our members are both our retail and E-commerce (EC) store customers. When our EC customers ordered the products from the website, it is mandatory to leave shipping information which are either their address or the preferred convenient store for them to pickup. Therefore, we can use this shipping information to recover customer's residential zipcode.

The following four steps will be conducted in this section:
1. Make queries to gather all EC customer's shipping information.
1. Collect convenient store's location information by web scarping. 
1. Join the EC customer's shipping information and convenient store's locaiton informaiton.
1. Recover residential zipcode information  

All the sql codes made in this section are stored in this repository.

## 2- Customer residential zipcode prediction via Machine Learning Model
Another solution is to make prediction on customer's missing zipcode via the built machine learning model. The zipcode prediction machine learning model has been built by the data team of DKT Taiwan. Two supervised models were constructed, which are: 
* Model 1: Make prediction of residential city of the members.
* Model 2: Make prediction of residential zipcode of the members after the model 1. 

We will first allocate the member who have missing residential information to corresponding cities in Taiwan using Model 1. Once these members are allocated to the city in Taiwan, the second prediction will be made to predict their corresponding region in the city, which is the zipcode information. 

### 2.1 Data Collection & Preprocessing

In the data collection part, we will make query to gather the member data with missing residential zipcode information. These data includes the stores they visited in the past, the sum of money they spent, and visit in weekday or weekend etc.. All the data are preprocessed and organised to the table with the format requried by the ML model predictions.

All the sql code used for the query are saved in this repository. 

### 2.3 ML Prediction
The ML model is run by GCP.

* MOdel 1 Predition results:


* Model 2 Predition results:


The entire flow of the ML process is shown below:
![taiwan_ml_zipcode_version 02_update_2020_09_29](https://user-images.githubusercontent.com/68263082/103403120-1849ec80-4b8a-11eb-9888-d10452b841a5.png)


