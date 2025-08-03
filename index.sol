// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

contract EntGroupDPortal {

    address public admin;

    struct Service {

        uint id;

        string name;

        string description;

    }

    struct Client {

        address clientAddress;

        string name;

    }

    struct Training {

        string topic;

        string date;

        bool isActive;

    }

    struct PricingPlan {

        string name;

        uint priceInWei;

    }

    uint public serviceCount;

    uint public clientCount;

    uint public investmentTotal;

    mapping(uint => Service) public services;

    mapping(uint => PricingPlan) public pricingPlans;

    mapping(address => Client) public clients;

    Training[] public trainings;

    event ServiceAdded(uint id, string name);

    event ClientRegistered(address client, string name);

    event InvestmentReceived(address investor, uint amount);

    event TrainingAdded(string topic, string date);

    event PricingSet(string name, uint price);

    modifier onlyAdmin() {

        require(msg.sender == admin, "Only admin allowed");

        _;

    }

    constructor() {

        admin = msg.sender;

    }

    // Admin adds services

    function addService(string memory name, string memory desc) external onlyAdmin {

        serviceCount++;

        services[serviceCount] = Service(serviceCount, name, desc);

        emit ServiceAdded(serviceCount, _name);

    }

    // Public: Register as client

    function registerClient(string memory _name) external {

        require(bytes(clients[msg.sender].name).length == 0, "Already registered");

        clients[msg.sender] = Client(msg.sender, _name);

        clientCount++;

        emit ClientRegistered(msg.sender, _name);

    }

    // Public: Send investments

    function invest() external payable {

        require(msg.value > 0, "Send ETH to invest");

        investmentTotal += msg.value;

        emit InvestmentReceived(msg.sender, msg.value);

    }

    // Admin: Add training session

    function addTraining(string memory topic, string memory date) external onlyAdmin {

        trainings.push(Training(_topic, _date, true));

        emit TrainingAdded(_topic, _date);

    }

    // Admin: Set pricing plans

    function setPricingPlan(string memory name, uint price) external onlyAdmin {

        pricingPlans[uint(keccak256(bytes(_name)))] = PricingPlan(_name, _price);

        emit PricingSet(_name, _price);

    }

    // Get all training sessions

    function getAllTrainings() external view returns (Training[] memory) {

        return trainings;

    }

    // Get a pricing plan by name

    function getPricingPlan(string memory _name) external view returns (PricingPlan memory) {

        return pricingPlans[uint(keccak256(bytes(_name)))];

    }

}
