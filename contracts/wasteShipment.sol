pragma solidity ^0.4.23;

import "../node_modules/zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract wasteShipment is ERC721Token{
    
    string public constant name = "waste0Token";
    string public constant symbol = "W0T";
    Shipment[] public shipments;
    address public owner;

    struct Shipment {
        string wasteType;
        uint weight;
    }

    function _shipmentOwner() public {
        owner = msg.sender;
    }

    function _createShipment(string _wasteType, uint _weight, address _to) public{
        require(owner == msg.sender);
        uint id = shipments.length;
        shipments.push(Shipment(_wasteType, _weight));
        _mint(_to,id);
    }

    constructor (string _name, string _symbol) public
        ERC721Token(_name, _symbol)
    {
    }

    /**
    * Custom accessor to create a unique token
    */
    function mintUniqueTokenTo(
        address _to,
        uint256 _tokenId,
        string  _tokenURI
    ) public
    {
        super._mint(_to, _tokenId);
        super._setTokenURI(_tokenId, _tokenURI);
    }
}