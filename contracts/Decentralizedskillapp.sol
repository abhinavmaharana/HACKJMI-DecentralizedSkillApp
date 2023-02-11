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

    // String comparison functions.
    
    function memcmp(bytes memory a, bytes memory b)
        internal
        pure
        returns (bool)
    {
        return (a.length == b.length) && (keccak256(a) == keccak256(b)); // Compares the two hashes
    }

    function strcmp(string memory a, string memory b) // string comparison function
        internal
        pure
        returns (bool)
    {
        return memcmp(bytes(a), bytes(b));
    }

    // Sign Up
    function sign_up(
        string calldata email,
        string calldata name,
        string calldata acc_type // account type (Company/User)
    ) public {
        // We will check that account does not already exists
        require(
            email_to_address[email] == address(0),
            "error: user already exists!"
        );
        email_to_address[email] == msg.sender;

        // For user account type
        if (strcmp(acc_type, "user")) {
            user storage new_user = employees.push(); // Creates a new user and returns the reference to it.
            new_user.name = name;
            new_user.id = employees.length - 1; // give account a unique user id
            new_user.wallet_address = msg.sender;
            address_to_id[msg.sender] = new_user.id;
            new_user.user_skills = new uint256[](0);
            new_user.user_work_experience = new uint256[](0);
        } else { 
            // For company account type
            company storage new_company = companies.push(); // Creates a new company and returns a reference to it
            new_company.name = name;
            new_company.id = companies.length - 1; // give account a unique company id
            new_company.wallet_address = msg.sender;
            new_company.current_employees = new uint256[](0);
            new_company.previous_employees = new uint256[](0);
            address_to_id[msg.sender] = new_company.id;
            is_company[msg.sender] = true; 
        }
    }

    // Login Process
    function login(string calldata email) public view returns (string memory) {
        // Checking the function caller's wallet address from global map containing email address mapped to wallet address
        require(
            msg.sender == email_to_address[email],
            "error: incorrect wallet address used for signing in"
        );
        return (is_company[msg.sender]) ? "company" : "user"; // returns account type
    }

    // Updating a wallet address
    function update_wallet_address(string calldata email, address new_address)
        public
    {
        require(
            email_to_address[email] == msg.sender,
            "error: function called from incorrect wallet address"
        );
        email_to_address[email] = new_address;
        uint256 id = address_to_id[msg.sender];
        address_to_id[msg.sender] = 0;
        address_to_id[new_address] = id;
    }
}