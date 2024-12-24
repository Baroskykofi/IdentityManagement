// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdentityManagement {
    //Structs to define Identity Details
    struct Identity {
        string name;
        string email;
        string verificationDocument;
        bool isVerified;
        bool isRevoked;
        address owner;
    }

    //Contract owner(Deployer)
    address public contractOwner;

    //Mapping to store identities by address
    mapping(address => Identity) private identities;

    //Mapping to authorized verifiers
    mapping(address => bool) private authorizedVerifiers;

    //Events
    event IdentityRegistered(address indexed user, string name);
    event IdentityVerified(address indexed user, address indexed verifier);
    event IdentityRevoked(address indexed user, address indexed verifier);
    event VerifierAdded(address indexed verifier);
    event VerifierRemoved(address indexed verifier);

    //Modifiers
    modifier onlyManager() {
        require(
            identities[msg.sender].owner == msg.sender,
            "Only the identity owner can perform this action."
        );
        _;
    }

    modifier onlyVerifier() {
        require(
            authorizedVerifiers[msg.sender],
            "Only an authorized verifier can perform this action."
        );
        _;
    }

    modifier onlyContractOwner() {
        require(
            msg.sender == contractOwner,
            "Only the contract owner can perform this action."
        );
        _;
    }

    //Constructor
    constructor() {
        contractOwner = msg.sender;
    }

    //Functions
    function registerIdentity(string memory _name, string memory _email, string memory _verificationDocument) public {
        require(
            bytes(identities[msg.sender].name).length == 0,
            "Identity already registered"
        );
        identities[msg.sender] = Identity({
            name: _name,
            email: _email,
            verificationDocument: _verificationDocument,
            isVerified: false,
            isRevoked: false,
            owner: msg.sender
        });

        emit IdentityRegistered(msg.sender, _name);
    }

    function verifyIdentity(address _user) public onlyVerifier {
        require(
            !identities[_user].isVerified,
            "Identity is already verified"
        );
        require(!identities[_user].isRevoked, "Identity has been revoked");

        identities[_user].isVerified = true;

        emit IdentityVerified(_user, msg.sender);
    }

    function getIdentity(address _user) public view returns(string memory name, string memory email, bool isVerified, bool isRevoked) {
        Identity memory id = identities[_user];
        return (id.name, id.email, id.isVerified, id.isRevoked);
    }

    function addVerifier(address _verifier) public onlyContractOwner{
        require(!authorizedVerifiers[_verifier], "Verifier is already added.");
        authorizedVerifiers[_verifier] = true;

        emit VerifierAdded(_verifier);
    }


    function removeVerifier(address _verifier) public onlyContractOwner {
        require(
            authorizedVerifiers[_verifier], "Verifier not authorized."
        );
        authorizedVerifiers[_verifier] = false;

        emit VerifierRemoved(_verifier);


    }

}