// 'use strict'
const db = require('../config/db');

const fs = require('fs');

let successState = 0 // 表示成功
let failState = 1 // 表示失败


// let successState = 0 // 表示成功
// let failState = 1 // 表示失败


// exports.test = (req, res) => {
//     console.log(req.query);
//     res.send({ name: '666', age: 11 })
// }





// 获取用户信息
exports.getuserinfo = (req, res) => {
    // 代表返回的数据结构

    let resObj = { status: successState, message: '' };
    // console.log(req.params);

    let user_id = req.params.id;
    let sql = "select * from user_info where user_id = " + user_id;
    console.log('获取用户：============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            // res.send(JSON.stringify(resObj))
            res.send(resObj)
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 新建商品
exports.createProductInfo = (req, res) => {

    // 上传的文件
    console.log(req.files);
    let resObj = { status: successState, message: '' };
    console.log(req.body);

    let data = req.body;
    let length = data.imgArr.length;
    let sql = `insert into product_info 
    (product_id, product_title, product_price, product_detail, product_status, product_owner, product_image, product_classify, product_district)
    values 
    ("${data.id}", "${data.title}", "${data.price}", "${data.detail}", "0", "${data.ownerId}", "${length}", "${data.classify}", "${data.district}")`;

    console.log('新建商品：============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 查询商品详细信息
exports.getProductDetail = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };
    console.log(req.params);

    let product_id = req.params.id;

    let sql = `select product_info.*,user_info.user_name from product_info,user_info where product_info.product_owner = user_info.user_id and product_id = ` + product_id;


    console.log('查询商品============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        console.log(datas[0].product_image);
        datas[0].imgArr = [];
        // datas[0].imgArr.push(`../../static/upload/${product_id}_${i}.png`);
        for (let i = 0; i < datas[0].product_image; i++) {
            datas[0].imgArr.push(`/upload/${product_id}_${i}.png`);
        }
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 编辑商品详细信息
exports.editProductDetail = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };
    console.log(req.params);

    let data = req.body;
    let length = data.imgArr.length;

    let sql = `update product_info set product_title = "${data.title}", product_price = "${data.price}",
               product_detail = "${data.detail}", product_image = "${length}", product_classify = "${data.classify}",
               product_district = "${data.district}" where product_id = "${data.id}"`;

    console.log('编辑商品详细信息============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 图片上传
exports.upload = (req, res) => {
    let index = 0;
    console.log(req.body.id);
    let time = Date.now();
    for (const i of req.files) {
        // fs.rename("./upload/" + i.filename, "../uni-app/static/upload/" + req.body.time + "_" + req.body.id + ".png", (err) => {
        //     if (err) {
        //         console.error(err)
        //         return
        //     } else {
        //         console.log('文件重命名成功')
        //     }
        // })
        // index++;
        fs.rename("./public/upload/" + i.filename, "./public/upload/" + req.body.time + "_" + req.body.id + ".png", (err) => {
            // fs.rename("./src/public/upload/" + i.filename, "./src/public/upload/" + time + "_" + index + ".png", (err) => {
            if (err) {
                console.error(err)
                return
            } else {
                console.log('文件重命名成功')
            }
        })
        index++;
    }
    // res.send("success", req.files)
    res.send("success")
}

// 获取商品列表
exports.getProductList = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = "";
    // console.log(typeof req.params.id);
    // if (req.params.id !== 'undefined') {
    //     sql = `select product_id, product_title, product_price from product_info
    //   where product_status = 0 and product_owner != ${req.params.id} order by product_id DESC`;
    // } else {
    //     sql = `select product_id, product_title, product_price from product_info
    //     where product_status = 0 order by product_id DESC`;
    // }

    if (req.params.id !== 'undefined') {
        sql = `select product_id, product_title, product_price from product_info
      where product_status = 0 order by product_id DESC`;
    } else {
        sql = `select product_id, product_title, product_price from product_info
        where product_status = 0 order by product_id DESC`;
    }

    console.log('获取商品列表============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 获取用户商品列表
exports.getUserProduct = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    // let sql = `select product_id, product_title, product_price, product_status from product_info
    //                    where product_owner = ${req.params.id} 
    //                     or product_buyer = ${req.params.id} order by product_id DESC`
    let sql = `select product_id, product_title, product_price, product_status from product_info
                       where product_owner = ${req.params.id} order by product_id DESC`

    console.log('获取用户商品列表============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        // for (const i of datas) {
        //     i.imgArr = "../../static/upload/" + i.product_id + "_0.png";
        // }
        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 新建用户
exports.createUser = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `insert into user_info values (null,"${req.body.id}", "${req.body.password}", "${req.body.username}", 2)`;

    console.log('新建用户============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 修改商品状态为交易中
exports.buyProduct = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `update product_info set product_status = 1, product_buyer = ${req.body.userid} where product_id = ${req.body.productid}`;
    console.log('修改商品状态为交易中============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 搜索商品列表
exports.searchItem = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };
    let sql = "";
    console.log(req.body.id);

    if (req.body.id) {
        // 登录后
        if (req.body.text && !req.body.status) {
            // 上架的商品
            console.log("case1");
            // sql = `select product_id, product_title, product_price from product_info
            //    where product_title like '%${req.body.text}%' and product_status = 0 
            //    and product_owner != ${req.body.id} order by product_id DESC`

            sql = `select product_id, product_title, product_price from product_info
               where product_title like '%${req.body.text}%' and product_status = 0 
               order by product_id DESC`

        } else {
            // 无搜索数据返回全部
            console.log("case2");
            // sql = `select product_id, product_title, product_price from product_info where product_status = 0
            //    and product_owner != ${req.body.id} order by product_id DESC`

            sql = `select product_id, product_title, product_price from product_info where product_status = 0 
            order by product_id DESC`
        }
    } else {
        if (req.body.text) {
            console.log("case3");
            sql = `select product_id, product_title, product_price from product_info
                  where product_title like '%${req.body.text}%' and product_status = 0 
                  order by product_id DESC`;
        } else {
            console.log("case4");
            sql = `select product_id, product_title, product_price from product_info where product_status = 0 order by product_id DESC`
        }
    }

    console.log('搜索商品列表============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }
        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 插入历史记录
exports.setHistory = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };
    console.log(req.body);
    let sql = `select * FROM history where user_id = ${req.body.user} and product_id = ${req.body.product}`;
    console.log('检查是否已有记录============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        if (datas.length === 0) {
            // 无数据 插入
            console.log(123456);
        } else {
            // 有数据 返回
            res.send(JSON.stringify(resObj))
            return
        }
        let sql1 = `insert into history values (null,${req.body.product}, ${req.body.user})`;
        console.log('插入历史记录============>', sql1)

        db.query(sql1, (err, datas) => {
            // 4.0 判断是否异常
            if (err) {
                resObj.status = failState
                resObj.message = err.message
                res.send(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
        })

        res.send(JSON.stringify(resObj))
    })
}

// 获取历史记录
exports.getHistory = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select * from history, product_info where user_id = ${req.params.id} and history.product_id = product_info.product_id`;
    console.log('获取历史记录============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 设置图片位置
        // for (const i of datas) {
        //     i.imgArr = "../../static/upload/" + i.product_id + "_0.png";
        // }
        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 删除历史记录
exports.delHistory = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `delete from history where user_id = ${req.body.userid} and product_id = ${req.body.productid}`;
    console.log('删除历史记录============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 删除商品
exports.delProduct = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql =
        `delete product_info,history from product_info,history where
        product_info.product_id = history.product_id and product_info.product_id = ${req.body.productid}`;
    console.log('删除商品============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 修改交易商品状态
exports.changeProductstatus = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };
    let sql = "";
    if (req.body.status == 0) {
        // 终止交易
        sql = `update product_info set product_status = 0,
      product_buyer = null where product_id = ${req.body.productid}`;
    } else {
        // 交易完成
        sql = `update product_info set product_status = ${req.body.status}
       where product_id = ${req.body.productid}`;
    }
    console.log('修改交易商品状态============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 获取所有商品列表
exports.getAllProductList = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select * from product_info order by product_id DESC`;

    console.log('获取所有商品列表============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        // for (const i of datas) {
        //     i.imgArr = "../../static/upload/" + i.product_id + "_0.png";
        // }
        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 获取购买的商品列表
exports.getBuy = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select product_id, product_title, product_price, product_status from product_info
                     where product_buyer = ${req.params.id} order by product_id DESC`

    console.log('获取购买的商品列表============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 获取交易中的商品
exports.tradingProduct = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select product_id, product_title, product_price, product_status from product_info
                     where product_owner = ${req.params.id} 
                      and product_status = 1 order by product_id DESC`

    console.log('获取交易中的商品============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 获取售出的商品列表
exports.getSell = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select product_id, product_title, product_price, product_status from product_info
                     where product_owner = ${req.params.id} 
                      and product_status = 2 order by product_id DESC`

    console.log('获取售出的商品列表============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 修改用户
exports.changeUser = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };
    console.log(req.body.message);
    let sql = ``
    if (req.body.message == '0') {
        sql = `update user_info set user_name = "${req.body.text}" where user_id = ${req.body.id}`
    } else if (req.body.message == '1') {
        sql = `update user_info set user_id = "${req.body.text}" where user_id = ${req.body.id}`
    } else {
        sql = `update user_info set user_password = "${req.body.text}" where user_id = ${req.body.id}`
    }

    console.log('修改用户============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 添加关注商品
exports.addFollow = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };
    let sql1 = `select * from follow where product_id = ${req.body.productid} and user_id = ${req.body.userid}`

    console.log('检查是否已有记录============>', sql1)
    db.query(sql1, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        if (datas.length === 0) {
            // 无数据 插入
            console.log(123456);
        } else {
            // 有数据 返回
            res.send(JSON.stringify(resObj))
            return
        }

        let sql = `insert into follow values (null,"${req.body.productid}", "${req.body.userid}")`
        console.log('添加关注============>', sql)

        db.query(sql, (err, datas) => {
            // 4.0 判断是否异常
            if (err) {
                resObj.status = failState
                resObj.message = err.message
                res.send(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
        })

        res.send(JSON.stringify(resObj))
    })
}

// 查询关注商品
exports.getFollow = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select * from follow, product_info where follow.product_id = product_info.product_id and 
              user_id = ${req.params.id}`

    console.log('查询关注商品============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }

        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 删除关注商品
exports.delFollow = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `delete from follow where product_id = ${req.body.productid} and user_id = ${req.body.userid}`

    console.log('删除关注商品============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 计算出售的商品
exports.calEarn = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select SUM(ROUND(product_price, 1)) as price from product_info where product_owner = ${req.params.id} and product_status = 2`

    console.log('计算出售的商品============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 查询是否已关注
exports.findFollow = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select * from follow where product_id = "${req.body.productid}" and user_id = "${req.body.userid}"`

    console.log('检查是否关注============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 获取商品分类列表
exports.getClassifyList = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = "";
    console.log(req.body.id);
    console.log(req.body.id !== undefined);
    // if (req.body.id !== undefined) {
    //     sql = `select product_id, product_title, product_price from product_info where product_status = 0 and 
    //     product_owner != '${req.body.id}' and product_classify = '${req.body.classify}' order by product_id DESC`;
    // } else {
    //     sql = `select product_id, product_title, product_price from product_info where product_status = 0 and
    //      product_classify = '${req.body.classify}' order by product_id DESC`;
    // }


    if (req.body.id !== undefined) {
        sql = `select product_id, product_title, product_price from product_info where product_status = 0 and 
        product_classify = '${req.body.classify}' order by product_id DESC`;
    } else {
        sql = `select product_id, product_title, product_price from product_info where product_status = 0 and
         product_classify = '${req.body.classify}' order by product_id DESC`;
    }

    console.log(req.body);
    console.log('获取商品分类列表============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        for (const i of datas) {
            i.imgArr = (`/upload/${i.product_id}_0.png`);
        }
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 获取用户所有信息
exports.getUserInfoNum = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: {} };

    let sqlArr = [
        // buy
        `select COUNT(product_buyer) as buy from product_info where product_buyer = ${req.body.id}`,
        // sell
        `select COUNT(product_id) as sell from product_info where product_status = 2 and product_owner = ${req.body.id}`,
        // follow
        `select COUNT(user_id) as follow from follow where user_id = ${req.body.id}`,
        // history
        `select COUNT(user_id) as history from history, product_info where user_id = ${req.body.id} and history.product_id = product_info.product_id`,
        // trading
        `select COUNT(product_owner) as trading from product_info where product_owner = ${req.body.id} and product_status = 1`,
        // earn
        `select SUM(ROUND(product_price, 1)) as price from product_info where product_owner = ${req.body.id} and product_status = 2`
    ];
    console.log('获取用户所有信息============>        start')
    let p = []
    for (const sql of sqlArr) {
        p.push(new Promise((resolve, reject) => {
            db.query(sql, (err, datas) => {
                // 4.0 判断是否异常
                if (err) {
                    resObj.status = failState
                    resObj.message = err.message
                    res.send(JSON.stringify(resObj))
                    reject(resObj)
                    return
                }

                // 5.0 获取数据成功
                if (datas[0].price === null) {
                    datas[0].price = "0";
                }
                // console.log(datas);
                console.log(datas[0]);
                resObj.message = Object.assign(resObj.message, datas[0])
                resolve(resObj)
            })
        }))
    }
    Promise.all(p).then(() => {
        // console.log(JSON.stringify(resObj));
        res.send(JSON.stringify(resObj))
        console.log('获取用户所有信息============>        send')
    });
}

// 获取所有用户信息
exports.getUserinfo = (req, res) => {
    // 代表返回的数据结构

    let resObj = { status: successState, message: '' };
    // console.log(req.params);

    let sql = "select * from user_info";
    console.log('获取所有用户信息============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 获取单个用户详细信息
exports.getUserDetail = (req, res) => {
    // 代表返回的数据结构

    let resObj = { status: successState, message: '' };
    // console.log(req.params);

    let sql = "select * from user_info where user_id = " + req.params.id;
    console.log('获取单个用户详细信息============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 删除用户
exports.delUser = (req, res) => {
    // 代表返回的数据结构

    let resObj = { status: successState, message: '' };
    // console.log(req.params);

    let sql = "delete from user_info where user_id = " + req.params.id;
    console.log('删除用户============>', sql)
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas
        res.send(JSON.stringify(resObj))
    })
}

// 修改用户
exports.editUser = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `update user_info set user_id = "${req.body.id}", user_name = "${req.body.name}", user_password = "${req.body.password}", user_role = "${req.body.role}" where user_id = "${req.body.preId}"`;
    console.log('修改用户============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// test
exports.test = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: [] };

    // resObj.message.push(123)
    res.send(JSON.stringify(resObj))
}

// 搜索分类
exports.searchClassify = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = ``;
    console.log('搜索分类============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}


// 获取轮播图
exports.getSwiper = (req, res) => {
    // 代表返回的数据结构
    let resObj = { status: successState, message: '' };

    let sql = `select * from swiper_info`;
    console.log('获取轮播图============>', sql)

    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}




// 发布求购商品
exports.postWantBuy = (req, res) => {
    // 代表返回的数据结构
    console.log(req.body);

    let resObj = { status: successState, message: '' };

    let wantBuyName = req.body.name;
    let wantBuyDetail = req.body.intro;
    let email = req.body.email;
    let user_id = req.body.user_id;

    let sql = `insert into wantbuy_info values(NULL,
        "${wantBuyName}","${wantBuyDetail}","${email}",0,${user_id})`;
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            console.log(err);
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}


// 获取求购商品
exports.getWantBuyList = (req, res) => {
    // 代表返回的数据结构

    let resObj = { status: successState, message: '' };

    let sql = `select * from wantbuy_info where isBuy = 0`;
    db.query(sql, (err, datas) => {
        // 4.0 判断是否异常
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            console.log(err);
            return
        }

        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))
    })
}

// 获取求购商品详情
exports.getWantBuyDetail = (req, res) => {
    // 代表返回的数据结构

    let resObj = { status: successState, message: '' };

    console.log(req.params);

    let sql = `select * from wantbuy_info where id = ${req.params.id}`;

    db.query(sql, (err, datas) => {
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            console.log(err);
            return
        }
        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))

    })
}


// 获取我的求购商品
exports.getMyWantBuyList = (req, res) => {
    // 代表返回的数据结构

    let resObj = { status: successState, message: '' };

    console.log(req.params);

    let sql = `select * from wantbuy_info where user_id = ${req.params.id} and isBuy = 0`;

    db.query(sql, (err, datas) => {
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            console.log(err);
            return
        }
        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))

    })


}


// 获取我的求购商品
exports.deleteMyWantBuyItem = (req, res) => {
    // 代表返回的数据结构

    let resObj = { status: successState, message: '' };

    console.log(req.params);

    let sql = `update wantbuy_info set isBuy = 1 where id = ${req.params.id}`;

    db.query(sql, (err, datas) => {
        if (err) {
            resObj.status = failState
            resObj.message = err.message
            res.send(JSON.stringify(resObj))
            console.log(err);
            return
        }
        // 5.0 获取数据成功
        resObj.message = datas

        res.send(JSON.stringify(resObj))

    })


}