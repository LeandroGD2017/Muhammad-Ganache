// SPDX-Lincense-Identifier: MIT
pragma solidity ^0.8.0;


contract FoodDelivery {
    struct Order {
        uint id;
        address customer;
        string foodItem;
        uint price;
        address deliveryPerson;
        bool is Accepted;
        bool is Completed;
    }


    address public admin;
    uint public orderCount;
    mapping(uint => Order) public orders;

    //this is for the orders, 
    event OrderPlaced(uint id, address customer, string foodItem, uint price);
    event OrderAccepted(uint id, address deliveryPerson);
    event OrderCompleted(uint id);


    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }


    constructor() {
        admin = msg.sender;
    }
}