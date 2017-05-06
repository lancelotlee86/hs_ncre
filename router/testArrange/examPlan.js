/**
 * Created by tastycarb on 2017/4/19.
 */
/**
 * Created by tom smith on 2017/2/7.
 */
(function () {
    var router = require('express').Router(),
        bodyParser = require('body-parser'),
        user_config = require('../../user_config'),
        _ = require('lodash');

    /** 获取考点-科目列表 */
    router.get('/examSites',function(req,res,next){
        res.send(JSON.stringify(user_config.exam_sites));
    });

    /** 添加考点 */
    router.post('/examSites',bodyParser.urlencoded({extended: true}),function(req,res,next){
        user_config.exam_sites_operator.addSite(req.body)
            .then(function(){
                res.send('添加成功');
            })
            .catch(function(err){
                res.status(400).send('添加失败:' + err.message);
            });
    });
    /** 修改考点 */
    router.put('/examSites/:exam_site_code/:attr',bodyParser.urlencoded({extended: true}),function(req,res,next){
        // req = {value}
        user_config.exam_sites_operator.updateSite(req.params.exam_site_code,req.params.attr,req.body.value)
            .then(function(){
                res.send('修改成功');
            }).catch(function(err){
                res.status(400).send('修改失败：' + err.message);
            });
    });
    /** 删除考点 */
    router.delete('/examSites/:exam_site_code',function(req,res,next){
        user_config.exam_sites_operator.removeSite(req.params.exam_site_code)
            .then(function(){
                res.send('删除成功');
            })
            .catch(function(err){
                res.status(400).send('删除失败：' + err.message);

            });
    });

    /** 添加科目 */
    router.post('/examSites/:exam_site_code/subjects',bodyParser.urlencoded({extended: true}),function(req,res,next){
        user_config.exam_sites_operator.addSubject(req.params.exam_site_code,req.body)
            .then(function(){
                res.send('添加成功')
            })
            .catch(function(err){
                res.status(400).send('添加失败：' + err.message);
            });
    });

    /** 删除科目 */
    router.delete('/examSites/:exam_site_code/subjects/:subject_code',function(req,res,next){
        user_config.exam_sites_operator.removeSubject(req.params.exam_site_code,req.params.subject_code)
            .then(function(){
                res.send('删除成功');
            })
            .catch(function(err){
                res.status(400).send('删除失败：' + err.message);
            });
    });

    /** 获取人数限制规则 */
    router.get('/limitRules',function(req,res,next){
        res.send(JSON.stringify(user_config.limit_rules));
    });

    /** 添加人数限制规则 */
    router.post('/limitRules',bodyParser.urlencoded({extended: true}),function(req,res,next){
        try{
            req.body.limit_obj = JSON.parse(req.body.limit_obj);
            user_config.limit_rules_operator.addRule(req.body)
                .then(function(){
                    res.send('添加成功')
                })
                .catch(function(err){
                    res.status(400).send(err.message);
                });
        }
        catch(err) {
            res.status(400).send('非法的数据');
        }
    });

    /** 删除人数限制规则 */
    router.delete('/limitRules/:index',function(req,res,next){
        user_config.limit_rules_operator.removeRule(req.params.index)
            .then(function(){
                res.send('删除成功');
            })
            .catch(function(err){
                res.status(400).send('删除失败：' + err.message);
            });
    });

    module.exports = router;

})();