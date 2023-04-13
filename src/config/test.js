const { encryptPassword, comparePassword } = require('./pwd');

// 加密密码
const password = 'mypassword';
const hashedPassword = encryptPassword(password);



const pwd1 = encryptPassword(password);

console.log(pwd1);

const result = comparePassword(password, pwd1);
console.log(result);
// 验证密码
// const isPasswordCorrect = comparePassword(password, hashedPassword);
// if (isPasswordCorrect) {
//   console.log('Password is correct');
// } else {
//   console.log('Password is incorrect');
// }
