// const { encryptPassword, comparePassword } = require('./pwd');

// // 加密密码
// const password = 'mypassword';
// const hashedPassword = encryptPassword(password);



// const pwd1 = encryptPassword(password);

// console.log(pwd1);

// const result = comparePassword(password, pwd1);
// console.log(result);
// // 验证密码
// // // const isPasswordCorrect = comparePassword(password, hashedPassword);
// // // if (isPasswordCorrect) {
// // //   console.log('Password is correct');
// // // } else {
// // //   console.log('Password is incorrect');
// // // }

// var d = new Date("2023-04-14T13:42:02.000Z");
// console.log(d);


// // 定义原始时间和目标时区信息
// const sourceTime = '2023-04-14T13:42:02.000Z';
// const targetTimeZone = 'Asia/Shanghai';

// // 创建日期对象并设置其时区为UTC
// let date = new Date(sourceTime);
// date.setUTCHours(date.getUTCHours());

// // 将时区转换到目标时区
// date = new Date(date.toLocaleString('en-US', { timeZone: targetTimeZone }));

// // 输出结果
// console.log(date.toISOString());



const timeStr = moment("2023-04-14T13:42:02.000Z").format(
    'Y-MM-DD HH:mm:ss'
)
this.item.post_time = timeStr;
console.log(timeStr);