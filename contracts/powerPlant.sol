pragma solidity ^0.4.23;

import "../node_modules/zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract powerPlant is ERC721Token{
    
    string public constant name = "powerToken";
    string public constant symbol = "PWT";
    Cremation[] public cremations;
    address public owner;

    struct Cremation {
        uint kwhGenerated;
        uint shipment;
        uint CO2;
        uint toxicPollutants;
    }

    function _cremationOwner() public {
        owner = msg.sender;
    }

    function _createCremation(uint _kwhGenerated, uint _shipment, uint _CO2, uint _toxicPollutants, address _to) public{
        require(owner == msg.sender);
        uint id = cremations.length;
        cremations.push(Cremation(_kwhGenerated, _shipment,_CO2,_toxicPollutants));
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