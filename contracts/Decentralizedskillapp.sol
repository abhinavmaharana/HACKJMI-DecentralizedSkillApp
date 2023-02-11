// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// userid and company id is a unique natural number representing a account globally.
contract Decentralizedskillapp {
    company[] public companies;
    user[] public employees;
    certificate[] public certifications;
    endorsment[] public endorsments;
    skill[] public skills;
    experience[] public experiences;

    //First layer linkedinOauth
    //Second layer linking of email id to the wallet address.

    // mapping of account's mail id with account's wallet address
    mapping(string => address) public email_to_address;
    // mapping of wallet address with account id
    mapping(address => uint256) public address_to_id;
    // mapping of wallet address with bool representing account status (Company/User)
    mapping(address => bool) public is_company;

    // To check verified user.
    modifier verifiedUser(uint256 user_id) {
        require(user_id == address_to_id[msg.sender]);
        _;
    }

    // Account structure. Whenever a user signs up, there will be two kinds of accounts: A company account or a user account.
    struct company {
        uint256 id;
        string name;
        address wallet_address;
        uint256[] current_employees;
        uint256[] previous_employees;
        uint256[] requested_employees;
    }

    struct user {
        uint256 id;
        uint256 company_id;
        string name;
        address wallet_address;
        bool is_employed;
        bool is_manager;
        uint256 num_skill;
        uint256[] user_skills;
        uint256[] user_work_experience;
    }

    struct experience {
        string starting_date;
        string ending_date;
        string role;
        bool currently_working;
        uint256 company_id;
        bool is_approved;
    }
}