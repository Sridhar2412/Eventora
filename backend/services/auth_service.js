const jwt=require('jsonwebtoken');
const { jwtSecret } = require('../services/config')

function setUser(user){
    return jwt.sign({
        id:user.id,
        email:user.email,
        fullname:user.fullname,
        mobile:user.mobile,
    },jwtSecret);
}

function getUserData(token, res){
    if(!token) return null;
    try{
    const user= jwt.verify(token, jwtSecret);
    return res.status(200).json({"status":"OK","code":"200","data":user});
    }catch(e){
    return res.status(400).json({"status":"ERROR","code":"400", 'error':{ 'message':`${e}`}});
    }
}

module.exports={
    setUser,getUserData,
};