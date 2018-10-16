/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ThreeQueens at 0xc318e7c79c5f12f68481b59639e49303100f48e3
*/
pragma solidity ^ 0.4.21;

contract ThreeQueens {
    address[3] public Queens;
    
    enum AntType {Worker, Warrior, Miner}
    
    struct Colony {
        uint food;
        uint materials;
        uint gold;
        uint tunnels;
        
        uint workers;
        uint warriors;
        uint miners;
        
        AntType spawningType;
        uint lastSpawnBN;
    }
    
    Colony[3] public colonies;
    
    function claimQueen(uint8 playerID)
    external {
        require(Queens[playerID] == 0x0);
        
        Queens[playerID] = msg.sender;
        
        colonies[playerID].food = 100;
        
        colonies[playerID].spawningType = AntType.Worker;
        colonies[playerID].lastSpawnBN = block.number;
    }
    
//    modifier onlyQueen() {
//        require(msg.sender == Queens[0] || msg.sender == Queens[1] || msg.sender == Queens[2]);
//        _;
//    }
    
    function checkAndGetSendersID()
    internal
    view
    returns(uint8) {
        for (uint8 i=0; i<3; i++) {
            if (msg.sender == Queens[i]) {
                return i;
            }
        }
        revert();
    }
    
    function setSpawnType(AntType spawnType)
    external {
        uint8 playerID = checkAndGetSendersID();
        
        colonies[playerID].spawningType = spawnType;
        colonies[playerID].lastSpawnBN = block.number;
    }
    
    function getAntCost(AntType antType)
    internal
    pure
    returns(uint) {
        if (antType == AntType.Worker) return 1;
        if (antType == AntType.Warrior) return 5;
        if (antType == AntType.Miner) return 15;
    }
    
    function spawnAnts(uint8 playerID, uint number, AntType spawnType)
    internal {
        uint prevFood = colonies[playerID].food;
        colonies[playerID].food -= number * getAntCost(spawnType);
        
        // Currently this is probably still vulnerable to attacks relating to overflow...
        assert(colonies[playerID].food <= prevFood);// this won't really fix it completely, but might help??
        
        if (spawnType == AntType.Worker) colonies[playerID].workers += number;
        if (spawnType == AntType.Warrior) colonies[playerID].warriors += number;
        if (spawnType == AntType.Miner) colonies[playerID].miners += number;
        
        colonies[playerID].lastSpawnBN = block.number;
    }
    
    function spawn()
    external {
        uint8 playerID = checkAndGetSendersID();
        
        uint numBlocksPassed = block.number - colonies[playerID].lastSpawnBN;
        uint maxSpawnTimeConstraint = numBlocksPassed; // Could change this in the future
        
        uint maxSpawnFoodConstraint = colonies[playerID].food / getAntCost(colonies[playerID].spawningType);
        
        uint spawnNumber;
        if (maxSpawnTimeConstraint < maxSpawnFoodConstraint) spawnNumber = maxSpawnTimeConstraint;
        else spawnNumber = maxSpawnFoodConstraint;
        
        spawnAnts(playerID, spawnNumber, colonies[playerID].spawningType);
    }
}