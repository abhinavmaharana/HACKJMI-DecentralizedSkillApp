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
}