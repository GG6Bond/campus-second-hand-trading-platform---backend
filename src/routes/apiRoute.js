const express = require('express');
const multer = require('multer');
const route = express.Router();

const apiCtrl = require("../controllers/apiController.js")
// test 接口
route.get('/api/test', apiCtrl.test);


// route.get('/api/getUserInfo/:id', apiCtrl.getUserInfo);




// 获取用户信息
route.get('/api/getuserinfo/:id', apiCtrl.getuserinfo)

// 创建商品信息
route.post('/api/createProductInfo', apiCtrl.createProductInfo)

// 查询商品详细信息
route.get('/api/getProductDetail/:id', apiCtrl.getProductDetail)

// 查询商品详细信息
route.post('/api/editProductDetail', apiCtrl.editProductDetail)

// 上传图片文件
route.post('/api/upload', multer({
    dest: './public/upload'
}).any(), apiCtrl.upload)

// 获取商品列表
route.get('/api/getProductList/:id', apiCtrl.getProductList)

// 获取用户商品列表
route.get('/api/getUserProduct/:id', apiCtrl.getUserProduct)

// 新建用户
route.post('/api/createUser', apiCtrl.createUser)

// 修改商品状态为交易中
route.post('/api/buyProduct', apiCtrl.buyProduct)

// 搜索商品列表
route.post('/api/searchItem', apiCtrl.searchItem)

// 插入历史记录
route.post('/api/setHistory', apiCtrl.setHistory)

// 获取历史记录
route.get('/api/getHistory/:id', apiCtrl.getHistory)

// 删除历史记录
route.post('/api/delHistory', apiCtrl.delHistory)

// 删除商品
route.post('/api/delProduct', apiCtrl.delProduct)

// 修改交易商品状态
route.post('/api/changeProductstatus', apiCtrl.changeProductstatus)

// 获取所有商品列表
route.get('/api/getAllProductList', apiCtrl.getAllProductList)

// 获取购买的商品列表
route.get('/api/getBuy/:id', apiCtrl.getBuy)

// 获取售出的商品列表
route.get('/api/getSell/:id', apiCtrl.getSell)

// 获取交易中的商品
route.get('/api/tradingProduct/:id', apiCtrl.tradingProduct)

// 修改用户id
route.post('/api/changeUser', apiCtrl.changeUser)

// 添加关注商品
route.post('/api/addFollow', apiCtrl.addFollow)

// 查询关注商品
route.get('/api/getFollow/:id', apiCtrl.getFollow)

// 删除关注商品
route.post('/api/delFollow', apiCtrl.delFollow)

// 计算出售的商品
route.get('/api/calEarn/:id', apiCtrl.calEarn)

// 查询是否已关注
route.post('/api/findFollow', apiCtrl.findFollow)

// 获取商品分类列表
route.post('/api/getClassifyList', apiCtrl.getClassifyList)

// 获取用户所有信息
route.post('/api/getUserInfoNum', apiCtrl.getUserInfoNum)

// 获取所有用户信息
route.get('/api/getUserinfo', apiCtrl.getUserinfo)

// 获取单个用户详细信息
route.get('/api/getUserDetail/:id', apiCtrl.getUserDetail)

// 删除用户
route.get('/api/delUser/:id', apiCtrl.delUser)

// 修改用户
route.post('/api/editUser', apiCtrl.editUser)

// 搜索分类
route.post('/api/searchClassify', apiCtrl.searchClassify)

// test
route.post('/api/test', apiCtrl.test)

module.exports = route



// module.exports = route;