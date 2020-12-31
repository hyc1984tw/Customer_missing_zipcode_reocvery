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


## 2- Customer residential zipcode prediction via Machine Learning Model


### 2.1 Data Collection

cdp_mltable is the pre-processed tables for zipcode machine learning. 


### 2.2 Data Preprocessing

### 2.3 ML Prediction
