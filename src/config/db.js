const mysql = require('mysql')
// 建立 mysql 数据库的连接关系
const db = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: 'jt5586',
    database: 'ershou'
})

// 测试mysql模块能否正常工作
// db.query('select * from users', (err, results) => {
//     if (err) {
//         return console.log(err.message);
//     }
//     console.log(results);
// })

module.exports = db;