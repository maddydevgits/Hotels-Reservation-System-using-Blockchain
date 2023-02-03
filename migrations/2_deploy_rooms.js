const rooms=artifacts.require('rooms');

module.exports=function(deployer){
    deployer.deploy(rooms);
}