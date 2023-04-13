const bcrypt = require('bcryptjs');

// 加密函数
function encryptPassword(password) {
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(password, salt);
    return hash;
}

// 解密函数
function comparePassword(password, hash) {
    return bcrypt.compareSync(password, hash);
}

// 暴露加密和解密函数
module.exports = {
    encryptPassword,
    comparePassword,
};
