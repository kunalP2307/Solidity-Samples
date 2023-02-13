// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWallet{
    event Deposite(
        address indexed sender,
        uint ammount, uint balance
    );

    event SubmitTx(
        address indexed owner, 
        uint indexed txIndex,
        address indexed to,
        // can't use indexed more than 3 times
        uint value,
        bytes data
    );

    event ConfirmTx(
        address indexed owner,
        uint indexed txIndex
    );

    event RevokeTx(
        address indexed owner,
        uint indexed txIndex
    );

    event ExecuteTx(
        address indexed owner,
        uint indexed txIndex
    );

    address[] public owners;
    mapping(address => bool) public isOwner;

    uint public noOfConfirmationReqToSign;

    struct Transaction{
        address to;
        uint value;
        bytes data;
        bool executed;
        uint noOfConfirmations;
    }

    mapping(uint => mapping(address => bool)) public isConfirmed;

    Transaction[] public transactions;

    modifier onlyOwner(){
        require(isOwner[msg.sender], "Not the owner");
        _;
    }

    modifier txExists(uint _txIndex){
        require(_txIndex < transactions.length, "Not Valid Transaction Index");
        _;
    }

    modifier notExecuted(uint _txIndex){
        require(!transactions[_txIndex].executed, "Transaction already executed");
        _;
    }

    modifier notConfirmed(uint _txIndex){
        require(!isConfirmed[_txIndex][msg.sender], "Already Confimed");
        _;
    }

    constructor(address[] memory _owners, uint _noOfConfirmationReqToSign){
        require(_owners.length > 0, "At least one owner required");
        require(_noOfConfirmationReqToSign > 0 && _noOfConfirmationReqToSign <= _owners.length, "Invalid number of requied confrimations in constrcutor");

        for(uint i=0; i< _owners.length; i++){
            address owner = _owners[i];
            require(owner != address(0), "Invalid Owner");
            require(!isOwner[owner], "Owner not unique");
            isOwner[owner] = true;
            owners.push(owner);
        }   

        noOfConfirmationReqToSign = _noOfConfirmationReqToSign;    
    }

    receive() external payable{
        emit Deposite(msg.sender, msg.value, address(this).balance);
    }

    function confirmTransaction(uint _txIndex) public onlyOwner txExists(_txIndex) 
                                                notExecuted(_txIndex)
                                                notConfirmed(_txIndex){
        Transaction storage transation = transactions[_txIndex];
        transation.noOfConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;

        emit ConfirmTx(msg.sender, _txIndex);
    }

    function submitTransaction(address _to, uint _value, bytes memory _data) 
                                        public onlyOwner{
        uint txIndex = transactions.length;
        transactions.push(
            Transaction({
                to : _to,
                value : _value,
                data : _data,
                executed : false,
                noOfConfirmations : 0 
            })
        );
        emit SubmitTx(msg.sender, txIndex, _to, _value, _data);
    }

    function executeTransaction(uint _txIndex) public onlyOwner 
                                            txExists(_txIndex)
                                            notExecuted(_txIndex){

        Transaction storage transaction = transactions[_txIndex];
        require(transaction.noOfConfirmations >= noOfConfirmationReqToSign, "Cannot execute Transaction");
        transaction.executed = true;
        (bool success,) = transaction.to.call{gas : 20000, value : transaction.value}(transaction.data);
        require(success, "Transaction Falied");
        emit ExecuteTx(msg.sender, _txIndex);
    }

    function DepositETH() public payable{
        (bool success,)=address(this).call{value:msg.value}("");
        require(success,"invalid");
        emit Deposite(msg.sender,msg.value,address(this).balance);
    } 

    function revokeConfirmation(uint _txIndex) public onlyOwner
                                                    txExists(_txIndex)
                                                    notExecuted(_txIndex){

        Transaction storage transaction = transactions[_txIndex];                                                    
        require(isConfirmed[_txIndex][msg.sender],"Transaction is not Confirmed");
        transaction.noOfConfirmations -= 1;
        isConfirmed[_txIndex][msg.sender] = false;

        emit RevokeTx(msg.sender, _txIndex);
    }

    function getOwners() public view returns(address[] memory){
        return owners;
    }

    function getTransactionCount() public view returns(uint){
        return transactions.length;
    }

    function getTransaction(uint _txIndex) public view 
                            returns(address to,
                                    uint value,
                                    bytes memory data, 
                                    bool executed,
                                    uint noOfConfirmations
                            ){
        Transaction storage transaction = transactions[_txIndex];
        return(
            transaction.to,
            transaction.value,
            transaction.data,
            transaction.executed,
            transaction.noOfConfirmations
        );
    }
    

}   