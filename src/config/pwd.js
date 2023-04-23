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

// 这段代码是一个 JavaScript 中的函数，
// 用于对用户密码进行加密。下面是代码的解释：

// bcrypt 是一个 JavaScript 库，用来实现密码哈希和校验等功能。
// bcrypt.genSaltSync(10) 生成一个包含随机值的 salt （盐），
// 参数表示 salt 的长度。
// bcrypt.hashSync(password, salt) 使用密码和 salt 作为输入，生成哈希密码。
// return hash; 返回生成的哈希密码作为输出。
// 因此，这个函数利用 bcrypt 库生成一个 salt，用于加密用户输入的 password。通过调用 hashSync() 方法，
// 将用户密码和 salt 作为输入，生成一个哈希值。该哈希值可以安全地存储在数据库中，并用于验证用户密码的正确性。

// 需要注意的是，哈希密码是不可逆的，也就是说，无法从哈希密码推导出原始密码。因此，当用户验证登录时，
// 需要对用户输入的密码与存储的哈希密码进行比对，而不是直接将其解密。