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

    //access only for admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }


    constructor() {
        admin = msg.sender;
    }

    // allows a costomer place a order.
    function placeOrder(string memory _foodItem, uint _price) public {
        orderCount++;
        orders[orderCount] = Order(orderCount, msg.sender, _foodItem, _price, address(0), false, false);
        emit OrderPlaced(orderCount, msg.sender, foodItem, _price);
    }

    // allows a delivery person to accept an order
    function acceptOrder(uint _orderId) public {
        Order storage order = orders[_orderId];
        require(order.Id == _orderId, "Order does not exist");
        require(!order.isAccepted, "Order already accepted");
        order.deliveryPerson = msg.sernder;
        order.isAccepted =true;
        emit OrderAccepted(_orderId, msg.sender);
    }

    // allows the delivery to mark an order as completed.
    function completeOrder(uint _orderId) public {
        order storage order = orders[_orderId];
        require(_order.Id == _orderId, "Order does not exist");
        require(order.deliveryPerson == msg.sender, "Only assigned delivery person can complete the order");
        require(!order.isCompleted, "Order already completed");
        order.isCompleted(_orderId);
    }
}