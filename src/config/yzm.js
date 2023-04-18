
// 生成6位随机数字验证码和过期时间（10分钟）
function generateVerificationCode() {
    const code = Math.floor(Math.random() * 900000 + 100000).toString();
    const expirationTime = Date.now() + 1 * 60 * 1000; // 当前时间 + 1分钟
    return { code, expirationTime };
}

// console.log(generateVerificationCode());

module.exports = {
    generateVerificationCode
}